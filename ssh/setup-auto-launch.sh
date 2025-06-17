#!/bin/bash

# Setup script for auto-launch menu functionality
# This script configures the system to automatically show menu on login

echo "Setting up auto-launch menu functionality..."

# Create the auto-launch script in /usr/bin for system-wide access
if [ ! -f "/usr/bin/auto-menu" ]; then
    cp /home/user/workspace/ssh/auto-menu.sh /usr/bin/auto-menu
    chmod +x /usr/bin/auto-menu
    echo "Auto-menu script installed to /usr/bin/auto-menu"
fi

# Add auto-launch to root .bashrc if not already present
if ! grep -q "auto-menu" /root/.bashrc 2>/dev/null; then
    echo "" >> /root/.bashrc
    echo "# Auto-launch Athena Project menu" >> /root/.bashrc
    echo "if [ -f /usr/bin/auto-menu ]; then" >> /root/.bashrc
    echo "    source /usr/bin/auto-menu" >> /root/.bashrc
    echo "fi" >> /root/.bashrc
    echo "Auto-launch added to /root/.bashrc"
fi

# Create alias for easy menu access
if ! grep -q "alias menu=" /root/.bashrc 2>/dev/null; then
    echo "alias menu=\"bash /usr/bin/menu\"" >> /root/.bashrc
    echo "Menu alias added to /root/.bashrc"
fi

echo "Auto-launch setup completed!"
echo "Menu will automatically open on next login."
echo "You can also type \"menu\" anytime to access the menu."
