#!/bin/bash

# Auto-update system for Athena Project
# This script checks for updates from GitHub and applies them automatically

# Color definitions
RESET="\033[0m"
BOLD="\033[1m"
CYAN="\033[96m"
GREEN="\033[92m"
YELLOW="\033[93m"
RED="\033[91m"
WHITE="\033[97m"

# Configuration
GITHUB_REPO="https://github.com/Pendetot/Vpn-Installer.git"
BRANCH="menu-update"
LOCAL_PATH="/usr/local/athena-project"
BACKUP_PATH="/usr/local/athena-backup"
UPDATE_LOG="/var/log/athena-update.log"
VERSION_FILE="/usr/local/athena-version"
LAST_CHECK_FILE="/usr/local/athena-last-check"

# Function to log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$UPDATE_LOG"
}

# Function to check if we should update (once per day)
should_check_update() {
    if [ ! -f "$LAST_CHECK_FILE" ]; then
        return 0  # First time, should check
    fi
    
    local last_check=$(cat "$LAST_CHECK_FILE" 2>/dev/null || echo "0")
    local current_time=$(date +%s)
    local time_diff=$((current_time - last_check))
    local one_day=86400
    
    if [ $time_diff -gt $one_day ]; then
        return 0  # More than 24 hours, should check
    else
        return 1  # Less than 24 hours, skip
    fi
}

# Function to update last check time
update_last_check() {
    date +%s > "$LAST_CHECK_FILE"
}

# Function to get current local version
get_local_version() {
    if [ -f "$VERSION_FILE" ]; then
        cat "$VERSION_FILE"
    else
        echo "unknown"
    fi
}

# Function to get remote version
get_remote_version() {
    local remote_hash=$(git ls-remote "$GITHUB_REPO" "$BRANCH" 2>/dev/null | cut -f1)
    if [ -n "$remote_hash" ]; then
        echo "${remote_hash:0:8}"
    else
        echo "unknown"
    fi
}

# Function to backup current installation
backup_current() {
    log_message "Creating backup of current installation..."
    
    if [ -d "$BACKUP_PATH" ]; then
        rm -rf "$BACKUP_PATH"
    fi
    
    mkdir -p "$BACKUP_PATH"
    
    # Backup menu files
    if [ -d "/usr/bin" ]; then
        cp /usr/bin/menu* "$BACKUP_PATH/" 2>/dev/null || true
        cp /usr/bin/ssh-menu* "$BACKUP_PATH/" 2>/dev/null || true
        cp /usr/bin/vpn-menu* "$BACKUP_PATH/" 2>/dev/null || true
        cp /usr/bin/advanced-menu* "$BACKUP_PATH/" 2>/dev/null || true
        cp /usr/bin/xray-menu* "$BACKUP_PATH/" 2>/dev/null || true
        cp /usr/bin/system-menu* "$BACKUP_PATH/" 2>/dev/null || true
        cp /usr/bin/service-status* "$BACKUP_PATH/" 2>/dev/null || true
        cp /usr/bin/auto-menu* "$BACKUP_PATH/" 2>/dev/null || true
        cp /usr/bin/info* "$BACKUP_PATH/" 2>/dev/null || true
        cp /usr/bin/about* "$BACKUP_PATH/" 2>/dev/null || true
    fi
    
    log_message "Backup completed successfully"
}

# Function to restore from backup
restore_backup() {
    log_message "Restoring from backup due to update failure..."
    
    if [ -d "$BACKUP_PATH" ]; then
        cp "$BACKUP_PATH"/* /usr/bin/ 2>/dev/null || true
        chmod +x /usr/bin/menu* 2>/dev/null || true
        chmod +x /usr/bin/*-menu* 2>/dev/null || true
        log_message "Backup restored successfully"
    else
        log_message "ERROR: No backup found to restore"
    fi
}

# Function to download and apply updates
apply_update() {
    local temp_dir="/tmp/athena-update-$$"
    
    log_message "Downloading updates from GitHub..."
    
    # Create temporary directory
    mkdir -p "$temp_dir"
    cd "$temp_dir"
    
    # Clone the repository
    if git clone -b "$BRANCH" "$GITHUB_REPO" athena-project >/dev/null 2>&1; then
        log_message "Repository cloned successfully"
    else
        log_message "ERROR: Failed to clone repository"
        rm -rf "$temp_dir"
        return 1
    fi
    
    cd athena-project
    
    # Copy updated files to system
    log_message "Installing updated files..."
    
    # Update menu files
    if [ -d "ssh" ]; then
        cp ssh/menu.sh /usr/bin/menu 2>/dev/null && chmod +x /usr/bin/menu
        cp ssh/ssh-menu.sh /usr/bin/ssh-menu 2>/dev/null && chmod +x /usr/bin/ssh-menu
        cp ssh/vpn-menu.sh /usr/bin/vpn-menu 2>/dev/null && chmod +x /usr/bin/vpn-menu
        cp ssh/advanced-menu.sh /usr/bin/advanced-menu 2>/dev/null && chmod +x /usr/bin/advanced-menu
        cp ssh/xray-menu.sh /usr/bin/xray-menu 2>/dev/null && chmod +x /usr/bin/xray-menu
        cp ssh/system-menu.sh /usr/bin/system-menu 2>/dev/null && chmod +x /usr/bin/system-menu
        cp ssh/service-status.sh /usr/bin/service-status 2>/dev/null && chmod +x /usr/bin/service-status
        cp ssh/auto-menu.sh /usr/bin/auto-menu 2>/dev/null && chmod +x /usr/bin/auto-menu
        cp ssh/info.sh /usr/bin/info 2>/dev/null && chmod +x /usr/bin/info
        cp ssh/about.sh /usr/bin/about 2>/dev/null && chmod +x /usr/bin/about
    fi
    
    # Update version file
    local new_version=$(git rev-parse --short HEAD)
    echo "$new_version" > "$VERSION_FILE"
    
    # Cleanup
    cd /
    rm -rf "$temp_dir"
    
    log_message "Update applied successfully - Version: $new_version"
    return 0
}

# Function to check and perform update
check_and_update() {
    # Check if we should perform update check today
    if ! should_check_update; then
        return 0
    fi
    
    log_message "Checking for updates..."
    
    local local_version=$(get_local_version)
    local remote_version=$(get_remote_version)
    
    log_message "Local version: $local_version"
    log_message "Remote version: $remote_version"
    
    # Update last check time
    update_last_check
    
    if [ "$local_version" != "$remote_version" ] && [ "$remote_version" != "unknown" ]; then
        echo -e "${YELLOW}🔄 New update available!${RESET}"
        echo -e "${CYAN}Local version: ${WHITE}$local_version${RESET}"
        echo -e "${CYAN}Remote version: ${WHITE}$remote_version${RESET}"
        echo -e "${GREEN}Updating automatically...${RESET}"
        
        # Create backup
        backup_current
        
        # Apply update
        if apply_update; then
            echo -e "${GREEN}✅ Update completed successfully!${RESET}"
            log_message "Update completed successfully"
            
            # Show update notification
            echo -e "${CYAN}${BOLD}📢 Athena Project Updated!${RESET}"
            echo -e "${WHITE}Your system has been updated to the latest version.${RESET}"
            echo -e "${WHITE}New features and improvements are now available.${RESET}"
            echo ""
        else
            echo -e "${RED}❌ Update failed! Restoring backup...${RESET}"
            restore_backup
            log_message "Update failed, backup restored"
        fi
    else
        log_message "System is up to date"
    fi
}

# Function for manual update
manual_update() {
    echo -e "${CYAN}${BOLD}🔄 Manual Update Check${RESET}"
    echo -e "${WHITE}Checking for updates...${RESET}"
    
    local local_version=$(get_local_version)
    local remote_version=$(get_remote_version)
    
    echo -e "${CYAN}Local version: ${WHITE}$local_version${RESET}"
    echo -e "${CYAN}Remote version: ${WHITE}$remote_version${RESET}"
    
    if [ "$local_version" != "$remote_version" ] && [ "$remote_version" != "unknown" ]; then
        echo -e "${YELLOW}New update available!${RESET}"
        echo -e "${WHITE}Do you want to update now? [y/N]: ${RESET}\c"
        read -r response
        
        if [[ "$response" =~ ^[Yy]$ ]]; then
            backup_current
            if apply_update; then
                echo -e "${GREEN}✅ Update completed successfully!${RESET}"
            else
                echo -e "${RED}❌ Update failed! Backup restored.${RESET}"
                restore_backup
            fi
        else
            echo -e "${YELLOW}Update cancelled.${RESET}"
        fi
    else
        echo -e "${GREEN}✅ System is already up to date!${RESET}"
    fi
}

# Function to show update status
show_status() {
    echo -e "${CYAN}${BOLD}📊 Athena Project Update Status${RESET}"
    echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo -e "${WHITE}Current version: ${GREEN}$(get_local_version)${RESET}"
    echo -e "${WHITE}Remote version: ${GREEN}$(get_remote_version)${RESET}"
    echo -e "${WHITE}Last check: ${YELLOW}$(date -d @$(cat "$LAST_CHECK_FILE" 2>/dev/null || echo "0") 2>/dev/null || echo "Never")${RESET}"
    echo -e "${WHITE}Update log: ${CYAN}$UPDATE_LOG${RESET}"
    echo ""
}

# Main execution
case "${1:-auto}" in
    "auto")
        check_and_update
        ;;
    "manual")
        manual_update
        ;;
    "status")
        show_status
        ;;
    "force")
        echo -e "${YELLOW}🔄 Forcing update...${RESET}"
        backup_current
        if apply_update; then
            echo -e "${GREEN}✅ Force update completed!${RESET}"
        else
            echo -e "${RED}❌ Force update failed! Backup restored.${RESET}"
            restore_backup
        fi
        ;;
    *)
        echo "Usage: $0 {auto|manual|status|force}"
        echo "  auto   - Automatic update check (once per day)"
        echo "  manual - Manual update with confirmation"
        echo "  status - Show current update status"
        echo "  force  - Force update without version check"
        exit 1
        ;;
esac
