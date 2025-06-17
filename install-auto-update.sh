#!/bin/bash

# VPN Installer Auto-Update Installation Script
# This script installs the auto-update system

# Colors
RED='[0;31m'
GREEN='[0;32m'
YELLOW='[1;33m'
BLUE='[0;34m'
NC='[0m'

echo -e "${BLUE}Installing VPN Installer Auto-Update System...${NC}"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}Please run this script as root${NC}"
    exit 1
fi

# Create necessary directories
echo -e "${YELLOW}Creating directories...${NC}"
mkdir -p /usr/local/bin
mkdir -p /etc/vpn-installer
mkdir -p /opt/vpn-installer
mkdir -p /var/log

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy auto-update script
echo -e "${YELLOW}Installing auto-update script...${NC}"
cp "${SCRIPT_DIR}/auto-update.sh" /usr/local/bin/auto-update.sh
chmod +x /usr/local/bin/auto-update.sh

# Copy login script
echo -e "${YELLOW}Installing login script...${NC}"
cp "${SCRIPT_DIR}/vpn-auto-update-login.sh" /etc/profile.d/vpn-auto-update.sh
chmod +x /etc/profile.d/vpn-auto-update.sh

# Copy configuration file
echo -e "${YELLOW}Installing configuration...${NC}"
if [ ! -f /etc/vpn-installer/config ]; then
    cp "${SCRIPT_DIR}/vpn-installer-config" /etc/vpn-installer/config
else
    echo -e "${YELLOW}Configuration file already exists, skipping...${NC}"
fi

# Initialize the repository in /opt/vpn-installer
echo -e "${YELLOW}Initializing repository...${NC}"
cd /opt/vpn-installer

# If directory is empty or not a git repo, clone it
if [ ! -d ".git" ]; then
    # Remove any existing files
    rm -rf /opt/vpn-installer/*
    rm -rf /opt/vpn-installer/.*
    
    # Clone the repository
    git clone https://github.com/Pendetot/Vpn-Installer.git /opt/vpn-installer
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Repository cloned successfully${NC}"
    else
        echo -e "${RED}Failed to clone repository${NC}"
        exit 1
    fi
else
    echo -e "${YELLOW}Repository already exists, updating...${NC}"
    git fetch origin main
    git reset --hard origin/main
fi

# Make all scripts executable
find /opt/vpn-installer -name "*.sh" -exec chmod +x {} \;

# Create symlink for easy access
if [ ! -L /usr/local/bin/vpn-update ]; then
    ln -s /usr/local/bin/auto-update.sh /usr/local/bin/vpn-update
fi

# Create systemd service for periodic updates (optional)
echo -e "${YELLOW}Creating systemd service...${NC}"
cat > /etc/systemd/system/vpn-auto-update.service << EOF
[Unit]
Description=VPN Installer Auto-Update Service
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/auto-update.sh check
User=root

[Install]
WantedBy=multi-user.target
EOF

cat > /etc/systemd/system/vpn-auto-update.timer << EOF
[Unit]
Description=VPN Installer Auto-Update Timer
Requires=vpn-auto-update.service

[Timer]
OnCalendar=hourly
Persistent=true

[Install]
WantedBy=timers.target
EOF

# Enable and start the timer
systemctl daemon-reload
systemctl enable vpn-auto-update.timer
systemctl start vpn-auto-update.timer

echo -e "${GREEN}Auto-update system installed successfully!${NC}"
echo ""
echo -e "${BLUE}Usage:${NC}"
echo -e "  ${YELLOW}vpn-update${NC}          - Check and update if available"
echo -e "  ${YELLOW}vpn-update force${NC}    - Force update"
echo -e "  ${YELLOW}vpn-update enable${NC}   - Enable auto-update"
echo -e "  ${YELLOW}vpn-update disable${NC}  - Disable auto-update"
echo -e "  ${YELLOW}vpn-update status${NC}   - Show auto-update status"
echo ""
echo -e "${BLUE}Configuration file: ${YELLOW}/etc/vpn-installer/config${NC}"
echo -e "${BLUE}Log file: ${YELLOW}/var/log/vpn-auto-update.log${NC}"
echo ""
echo -e "${GREEN}The system will now automatically check for updates on login and hourly via systemd timer.${NC}"
