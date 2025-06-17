#!/bin/bash

# AthenaProject Auto Update System
# Automatic script updater with GitHub integration

clear

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
BOLD='\033[1m'
NC='\033[0m'

# Configuration
REPO_OWNER="Pendetot"
REPO_NAME="Vpn-Installer"
CURRENT_VERSION_FILE="/home/ver"
GITHUB_API_URL="https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/releases/latest"
RAW_BASE_URL="https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_NAME}/main"

# Banner
echo -e "${CYAN}╔══════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${BOLD}${WHITE}                🔄 ATHENA PROJECT AUTO UPDATER 🔄                 ${NC}${CYAN}║${NC}"
echo -e "${CYAN}║${BOLD}${PURPLE}                        Powered by MasVentot                        ${NC}${CYAN}║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Function to get current version
get_current_version() {
    if [ -f "$CURRENT_VERSION_FILE" ]; then
        cat "$CURRENT_VERSION_FILE"
    else
        echo "1.0"
    fi
}

# Function to get latest version from GitHub
get_latest_version() {
    curl -s "$GITHUB_API_URL" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*//' 2>/dev/null || echo "2.0.0"
}

# Function to compare versions
version_compare() {
    if [[ $1 == $2 ]]; then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++)); do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++)); do
        if [[ -z ${ver2[i]} ]]; then
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]})); then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]})); then
            return 2
        fi
    done
    return 0
}

# Function to update scripts
update_scripts() {
    echo -e "${YELLOW}🔄 Starting update process...${NC}"
    echo ""
    
    # Run the update menu script
    if wget -q --spider "$RAW_BASE_URL/update/updatemenu.sh"; then
        echo -e "${GREEN}✅ Downloading latest scripts...${NC}"
        wget -O /tmp/updatemenu.sh "$RAW_BASE_URL/update/updatemenu.sh" >/dev/null 2>&1
        chmod +x /tmp/updatemenu.sh
        /tmp/updatemenu.sh
        rm -f /tmp/updatemenu.sh
        
        # Update version file
        echo "$LATEST_VERSION" > "$CURRENT_VERSION_FILE"
        
        echo -e "${GREEN}✅ Update completed successfully!${NC}"
        echo -e "${CYAN}📝 Updated to version: ${BOLD}$LATEST_VERSION${NC}"
        echo ""
        echo -e "${YELLOW}⚠️  Please restart your SSH session to use updated scripts.${NC}"
    else
        echo -e "${RED}❌ Failed to download update scripts.${NC}"
        echo -e "${YELLOW}⚠️  Please check your internet connection.${NC}"
    fi
}

# Function to setup auto update cron job
setup_auto_update() {
    echo -e "${YELLOW}🔧 Setting up automatic updates...${NC}"
    
    # Create auto update script
    cat > /usr/local/bin/athena-auto-update << 'EOF'
#!/bin/bash
# AthenaProject Auto Update Cron Job
CURRENT_VERSION=$(cat /home/ver 2>/dev/null || echo "1.0")
LATEST_VERSION=$(curl -s "https://api.github.com/repos/Pendetot/Vpn-Installer/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*//' 2>/dev/null || echo "2.0.0")

if [ "$CURRENT_VERSION" != "$LATEST_VERSION" ]; then
    echo "$(date): Auto-updating from $CURRENT_VERSION to $LATEST_VERSION" >> /var/log/athena-autoupdate.log
    wget -O /tmp/updatemenu.sh "https://raw.githubusercontent.com/Pendetot/Vpn-Installer/main/update/updatemenu.sh" >/dev/null 2>&1
    chmod +x /tmp/updatemenu.sh
    /tmp/updatemenu.sh >/dev/null 2>&1
    echo "$LATEST_VERSION" > /home/ver
    rm -f /tmp/updatemenu.sh
    echo "$(date): Update completed successfully" >> /var/log/athena-autoupdate.log
fi
EOF
    
    chmod +x /usr/local/bin/athena-auto-update
    
    # Add to crontab (check for updates every 6 hours)
    (crontab -l 2>/dev/null; echo "0 */6 * * * /usr/local/bin/athena-auto-update >/dev/null 2>&1") | crontab -
    
    echo -e "${GREEN}✅ Automatic updates enabled!${NC}"
    echo -e "${CYAN}📅 System will check for updates every 6 hours${NC}"
}

# Main execution
echo -e "${BLUE}🔍 Checking for updates...${NC}"
echo ""

CURRENT_VERSION=$(get_current_version)
LATEST_VERSION=$(get_latest_version)

echo -e "${CYAN}📋 Current Version: ${BOLD}$CURRENT_VERSION${NC}"
echo -e "${CYAN}📋 Latest Version:  ${BOLD}$LATEST_VERSION${NC}"
echo ""

version_compare $CURRENT_VERSION $LATEST_VERSION
case $? in
    0)
        echo -e "${GREEN}✅ You are running the latest version!${NC}"
        echo ""
        read -p "$(echo -e "${YELLOW}Do you want to enable automatic updates? (y/n): ${NC}")" auto_update
        if [[ $auto_update =~ ^[Yy]$ ]]; then
            setup_auto_update
        fi
        ;;
    2)
        echo -e "${YELLOW}🆕 New version available!${NC}"
        echo ""
        read -p "$(echo -e "${BOLD}${GREEN}Do you want to update now? (y/n): ${NC}")" update_choice
        if [[ $update_choice =~ ^[Yy]$ ]]; then
            update_scripts
            echo ""
            read -p "$(echo -e "${YELLOW}Do you want to enable automatic updates? (y/n): ${NC}")" auto_update
            if [[ $auto_update =~ ^[Yy]$ ]]; then
                setup_auto_update
            fi
        fi
        ;;
    1)
        echo -e "${PURPLE}🔮 You are running a development version!${NC}"
        ;;
esac

echo ""
echo -e "${CYAN}╔══════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${BOLD}${WHITE}                    Thank you for using AthenaProject!              ${NC}${CYAN}║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════════╝${NC}"
echo ""

read -p "Press Enter to continue..."
menu
