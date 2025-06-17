#!/bin/bash

# Auto-Update Menu for VPN Installer
clear

# Color definitions
RESET="[0m"
BOLD="[1m"
CYAN="[96m"
BLUE="[94m"
GREEN="[92m"
YELLOW="[93m"
RED="[91m"
WHITE="[97m"
GRAY="[90m"

# Auto-update script path
AUTO_UPDATE_SCRIPT="/usr/local/bin/auto-update.sh"
CONFIG_FILE="/etc/vpn-installer/config"
LOG_FILE="/var/log/vpn-auto-update.log"

# Header
echo -e "${CYAN}${BOLD}"
echo "  ╔═══════════════════════════════════════════════════════════════╗"
echo "  ║                                                               ║"
echo "  ║                    🔄 AUTO-UPDATE SYSTEM                     ║"
echo "  ║                                                               ║"
echo "  ╚═══════════════════════════════════════════════════════════════╝"
echo -e "${RESET}"
echo ""

# Check if auto-update system is installed
if [ ! -f "$AUTO_UPDATE_SCRIPT" ]; then
    echo -e "${RED}${BOLD}Auto-Update System Not Installed!${RESET}"
    echo ""
    echo -e "${YELLOW}The auto-update system is not installed on this server.${RESET}"
    echo -e "${WHITE}Please run the main installer to install the auto-update system.${RESET}"
    echo ""
    echo -e "${WHITE}Press Enter to return to main menu...${RESET}"
    read
    menu
    exit 0
fi

# Get current status
get_update_status() {
    if [ -f "$CONFIG_FILE" ]; then
        source "$CONFIG_FILE"
        if [ "$AUTO_UPDATE_ENABLED" = "false" ]; then
            echo "DISABLED"
        else
            echo "ENABLED"
        fi
    else
        echo "ENABLED"  # Default
    fi
}

# Get last update check time
get_last_check() {
    if [ -f "$LOG_FILE" ]; then
        tail -n 20 "$LOG_FILE" | grep "Checking for updates" | tail -n 1 | cut -d']' -f1 | cut -d'[' -f2 || echo "Never"
    else
        echo "Never"
    fi
}

# Get repository version info
get_version_info() {
    if [ -f "$AUTO_UPDATE_SCRIPT" ]; then
        LOCAL_VERSION=$($AUTO_UPDATE_SCRIPT status 2>/dev/null | grep "Local version" | cut -d':' -f2 | xargs || echo "Unknown")
        REMOTE_VERSION=$($AUTO_UPDATE_SCRIPT status 2>/dev/null | grep "Remote version" | cut -d':' -f2 | xargs || echo "Unknown")
    else
        LOCAL_VERSION="Unknown"
        REMOTE_VERSION="Unknown"
    fi
}

# Display current status
STATUS=$(get_update_status)
LAST_CHECK=$(get_last_check)
get_version_info

echo -e "${WHITE}${BOLD}📊 Current Status${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"

if [ "$STATUS" = "ENABLED" ]; then
    echo -e "${WHITE}Auto-Update Status: ${GREEN}${BOLD}ENABLED${RESET}"
else
    echo -e "${WHITE}Auto-Update Status: ${RED}${BOLD}DISABLED${RESET}"
fi

echo -e "${WHITE}Last Check: ${YELLOW}$LAST_CHECK${RESET}"
echo -e "${WHITE}Local Version: ${BLUE}${LOCAL_VERSION:0:8}...${RESET}"
echo -e "${WHITE}Remote Version: ${BLUE}${REMOTE_VERSION:0:8}...${RESET}"

if [ "$LOCAL_VERSION" != "$REMOTE_VERSION" ] && [ "$LOCAL_VERSION" != "Unknown" ] && [ "$REMOTE_VERSION" != "Unknown" ]; then
    echo -e "${YELLOW}${BOLD}⚠️  Update Available!${RESET}"
else
    echo -e "${GREEN}✅ System is up to date${RESET}"
fi

echo ""

# Menu options
echo -e "${WHITE}${BOLD}🔧 Auto-Update Management${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN} 1${RESET}${WHITE}.${RESET} 🔍 Check for Updates Now"
echo -e "${GREEN} 2${RESET}${WHITE}.${RESET} ⬇️  Force Update (Download Latest)"
echo -e "${GREEN} 3${RESET}${WHITE}.${RESET} ⚙️  Toggle Auto-Update (Enable/Disable)"
echo -e "${GREEN} 4${RESET}${WHITE}.${RESET} 📋 View Update Log"
echo -e "${GREEN} 5${RESET}${WHITE}.${RESET} 🔧 Edit Configuration"
echo -e "${GREEN} 6${RESET}${WHITE}.${RESET} 📊 System Information"
echo ""
echo -e "${GREEN} 0${RESET}${WHITE}.${RESET} 🔙 Back to Main Menu"
echo ""
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${WHITE}${BOLD}Select option [${GREEN}0${WHITE}-${GREEN}6${WHITE}]:${RESET} \c"
read choice
echo ""

case $choice in
1)
    echo -e "${BLUE}Checking for updates...${RESET}"
    echo ""
    $AUTO_UPDATE_SCRIPT check
    echo ""
    echo -e "${WHITE}Press Enter to continue...${RESET}"
    read
    auto-update-menu
    ;;
2)
    echo -e "${YELLOW}${BOLD}⚠️  Force Update Warning${RESET}"
    echo -e "${WHITE}This will force download the latest version from GitHub.${RESET}"
    echo -e "${WHITE}Current installation will be backed up automatically.${RESET}"
    echo ""
    echo -e "${WHITE}Continue? (y/N): ${RESET}\c"
    read confirm
    if [[ $confirm =~ ^[Yy]$ ]]; then
        echo ""
        echo -e "${BLUE}Force updating...${RESET}"
        echo ""
        $AUTO_UPDATE_SCRIPT force
        echo ""
        echo -e "${GREEN}Update completed!${RESET}"
    else
        echo -e "${YELLOW}Update cancelled.${RESET}"
    fi
    echo ""
    echo -e "${WHITE}Press Enter to continue...${RESET}"
    read
    auto-update-menu
    ;;
3)
    if [ "$STATUS" = "ENABLED" ]; then
        echo -e "${YELLOW}Disabling auto-update...${RESET}"
        $AUTO_UPDATE_SCRIPT disable
        echo -e "${RED}Auto-update has been disabled.${RESET}"
    else
        echo -e "${BLUE}Enabling auto-update...${RESET}"
        $AUTO_UPDATE_SCRIPT enable
        echo -e "${GREEN}Auto-update has been enabled.${RESET}"
    fi
    echo ""
    echo -e "${WHITE}Press Enter to continue...${RESET}"
    read
    auto-update-menu
    ;;
4)
    echo -e "${BLUE}${BOLD}📋 Update Log (Last 20 entries)${RESET}"
    echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    if [ -f "$LOG_FILE" ]; then
        tail -n 20 "$LOG_FILE"
    else
        echo -e "${YELLOW}No log file found.${RESET}"
    fi
    echo ""
    echo -e "${WHITE}Press Enter to continue...${RESET}"
    read
    auto-update-menu
    ;;
5)
    echo -e "${BLUE}${BOLD}🔧 Configuration File${RESET}"
    echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    if [ -f "$CONFIG_FILE" ]; then
        echo -e "${WHITE}Current configuration:${RESET}"
        echo ""
        cat "$CONFIG_FILE"
        echo ""
        echo -e "${WHITE}Edit configuration? (y/N): ${RESET}\c"
        read edit_confirm
        if [[ $edit_confirm =~ ^[Yy]$ ]]; then
            nano "$CONFIG_FILE"
            echo -e "${GREEN}Configuration updated.${RESET}"
        fi
    else
        echo -e "${YELLOW}Configuration file not found.${RESET}"
    fi
    echo ""
    echo -e "${WHITE}Press Enter to continue...${RESET}"
    read
    auto-update-menu
    ;;
6)
    echo -e "${BLUE}${BOLD}📊 System Information${RESET}"
    echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo -e "${WHITE}Auto-Update Script: ${BLUE}$AUTO_UPDATE_SCRIPT${RESET}"
    echo -e "${WHITE}Configuration File: ${BLUE}$CONFIG_FILE${RESET}"
    echo -e "${WHITE}Log File: ${BLUE}$LOG_FILE${RESET}"
    echo -e "${WHITE}Repository: ${BLUE}https://github.com/Pendetot/Vpn-Installer.git${RESET}"
    echo ""
    if systemctl is-active --quiet vpn-auto-update.timer; then
        echo -e "${WHITE}Systemd Timer: ${GREEN}ACTIVE${RESET}"
    else
        echo -e "${WHITE}Systemd Timer: ${RED}INACTIVE${RESET}"
    fi
    echo ""
    echo -e "${WHITE}Press Enter to continue...${RESET}"
    read
    auto-update-menu
    ;;
0)
    menu
    ;;
*)
    echo -e "${RED}Invalid option. Please try again.${RESET}"
    sleep 2
    auto-update-menu
    ;;
esac
