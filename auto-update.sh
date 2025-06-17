#!/bin/bash

# VPN Installer Auto-Update System
# This script checks for updates from GitHub and updates the system automatically

# Configuration
REPO_URL="https://github.com/Pendetot/Vpn-Installer.git"
INSTALL_DIR="/opt/vpn-installer"
BACKUP_DIR="/opt/vpn-installer-backup"
CONFIG_FILE="/etc/vpn-installer/config"
LOG_FILE="/var/log/vpn-auto-update.log"

# Colors for output
RED='[0;31m'
GREEN='[0;32m'
YELLOW='[1;33m'
BLUE='[0;34m'
NC='[0m' # No Color

# Logging function
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Check if auto-update is enabled
check_auto_update_enabled() {
    if [ -f "$CONFIG_FILE" ]; then
        source "$CONFIG_FILE"
        if [ "$AUTO_UPDATE_ENABLED" = "false" ]; then
            log_message "Auto-update is disabled in config"
            return 1
        fi
    fi
    return 0
}

# Check internet connectivity
check_internet() {
    if ! ping -c 1 github.com &> /dev/null; then
        log_message "No internet connection available"
        return 1
    fi
    return 0
}

# Get local repository version (last commit hash)
get_local_version() {
    if [ -d "$INSTALL_DIR/.git" ]; then
        cd "$INSTALL_DIR"
        git rev-parse HEAD 2>/dev/null
    else
        echo "no-git"
    fi
}

# Get remote repository version (latest commit hash)
get_remote_version() {
    git ls-remote "$REPO_URL" HEAD 2>/dev/null | cut -f1
}

# Create backup of current installation
create_backup() {
    log_message "Creating backup of current installation..."
    
    # Remove old backup if exists
    if [ -d "$BACKUP_DIR" ]; then
        rm -rf "$BACKUP_DIR"
    fi
    
    # Create new backup
    if cp -r "$INSTALL_DIR" "$BACKUP_DIR" 2>/dev/null; then
        log_message "Backup created successfully at $BACKUP_DIR"
        return 0
    else
        log_message "Failed to create backup"
        return 1
    fi
}

# Restore from backup
restore_backup() {
    log_message "Restoring from backup..."
    
    if [ -d "$BACKUP_DIR" ]; then
        rm -rf "$INSTALL_DIR"
        if cp -r "$BACKUP_DIR" "$INSTALL_DIR"; then
            log_message "Backup restored successfully"
            return 0
        fi
    fi
    
    log_message "Failed to restore backup"
    return 1
}

# Update the installation
perform_update() {
    log_message "Starting update process..."
    
    # Create backup first
    if ! create_backup; then
        log_message "Update aborted due to backup failure"
        return 1
    fi
    
    # Navigate to install directory
    cd "$INSTALL_DIR" || {
        log_message "Failed to navigate to install directory"
        return 1
    }
    
    # Fetch latest changes
    log_message "Fetching latest changes from repository..."
    if ! git fetch origin main; then
        log_message "Failed to fetch updates"
        return 1
    fi
    
    # Reset to latest version
    log_message "Applying updates..."
    if ! git reset --hard origin/main; then
        log_message "Failed to apply updates, restoring backup..."
        restore_backup
        return 1
    fi
    
    # Make scripts executable
    find "$INSTALL_DIR" -name "*.sh" -exec chmod +x {} \;
    
    # Update menu scripts in /usr/bin
    if [ -f "$INSTALL_DIR/update/updatemenu.sh" ]; then
        log_message "Updating menu scripts..."
        bash "$INSTALL_DIR/update/updatemenu.sh" &>/dev/null
    fi
    
    log_message "Update completed successfully"
    return 0
}

# Check for updates and update if available
check_and_update() {
    log_message "Checking for updates..."
    
    # Check if auto-update is enabled
    if ! check_auto_update_enabled; then
        return 0
    fi
    
    # Check internet connectivity
    if ! check_internet; then
        return 1
    fi
    
    # Get versions
    local_version=$(get_local_version)
    remote_version=$(get_remote_version)
    
    if [ -z "$remote_version" ]; then
        log_message "Failed to get remote version"
        return 1
    fi
    
    log_message "Local version: $local_version"
    log_message "Remote version: $remote_version"
    
    # Compare versions
    if [ "$local_version" != "$remote_version" ]; then
        log_message "Update available! Starting update process..."
        echo -e "${YELLOW}VPN Installer update available! Updating...${NC}"
        
        if perform_update; then
            echo -e "${GREEN}VPN Installer updated successfully!${NC}"
            log_message "Update process completed successfully"
            
            # Show update notification
            if [ -t 1 ]; then  # Only show if running in terminal
                echo -e "${BLUE}=== VPN Installer Updated ===${NC}"
                echo -e "${GREEN}Your VPN Installer has been updated to the latest version.${NC}"
                echo -e "${YELLOW}Please restart any running services if needed.${NC}"
                echo ""
            fi
            
            return 0
        else
            echo -e "${RED}Update failed! Check logs for details.${NC}"
            log_message "Update process failed"
            return 1
        fi
    else
        log_message "No updates available"
        return 0
    fi
}

# Initialize installation directory if not exists
initialize_repo() {
    if [ ! -d "$INSTALL_DIR" ]; then
        log_message "Initializing repository at $INSTALL_DIR"
        mkdir -p "$INSTALL_DIR"
        cd "$INSTALL_DIR"
        
        if git clone "$REPO_URL" .; then
            log_message "Repository initialized successfully"
        else
            log_message "Failed to initialize repository"
            return 1
        fi
    fi
}

# Main function
main() {
    # Create necessary directories
    mkdir -p "$(dirname "$CONFIG_FILE")"
    mkdir -p "$(dirname "$LOG_FILE")"
    
    # Initialize repository if needed
    initialize_repo
    
    # Check and update
    check_and_update
}

# Handle command line arguments
case "$1" in
    "check")
        check_and_update
        ;;
    "force")
        log_message "Force update requested"
        perform_update
        ;;
    "disable")
        echo "AUTO_UPDATE_ENABLED=false" > "$CONFIG_FILE"
        echo "Auto-update disabled"
        ;;
    "enable")
        echo "AUTO_UPDATE_ENABLED=true" > "$CONFIG_FILE"
        echo "Auto-update enabled"
        ;;
    "status")
        if check_auto_update_enabled; then
            echo "Auto-update: ENABLED"
        else
            echo "Auto-update: DISABLED"
        fi
        ;;
    *)
        main
        ;;
esac
