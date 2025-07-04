#!/bin/bash

# VPN Installer Auto-Update on Login
# This script runs automatically when a user logs into the VPS

# Configuration
AUTO_UPDATE_SCRIPT="/usr/local/bin/auto-update.sh"
LAST_CHECK_FILE="/tmp/.vpn-update-check"
CHECK_INTERVAL=3600  # Check every hour (3600 seconds)

# Colors
GREEN='[0;32m'
YELLOW='[1;33m'
BLUE='[0;34m'
NC='[0m'

# Only run for interactive shells and root/sudo users
if [[ $- != *i* ]] || [[ $EUID -ne 0 && -z "$SUDO_USER" ]]; then
    exit 0
fi

# Check if we should run the update check
should_check_update() {
    # If last check file doesn't exist, we should check
    if [ ! -f "$LAST_CHECK_FILE" ]; then
        return 0
    fi
    
    # Get last check time
    last_check=$(cat "$LAST_CHECK_FILE" 2>/dev/null || echo "0")
    current_time=$(date +%s)
    
    # Check if enough time has passed
    if [ $((current_time - last_check)) -gt $CHECK_INTERVAL ]; then
        return 0
    fi
    
    return 1
}

# Update the last check time
update_check_time() {
    echo "$(date +%s)" > "$LAST_CHECK_FILE"
}

# Main execution
if should_check_update && [ -f "$AUTO_UPDATE_SCRIPT" ]; then
    # Show a brief message
    echo -e "${BLUE}Checking for VPN Installer updates...${NC}"
    
    # Run the auto-update script and display output
    bash "$AUTO_UPDATE_SCRIPT" check
    update_check_time
fi

# Launch menu automatically for interactive root sessions
if [ -f /usr/bin/auto-menu ]; then
    bash /usr/bin/auto-menu
elif command -v menu >/dev/null 2>&1; then
    menu
fi
