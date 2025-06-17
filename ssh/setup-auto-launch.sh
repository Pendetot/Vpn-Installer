#!/bin/bash

# Setup script for auto-launch menu functionality with auto-update
# This script configures the system to automatically show menu and check for updates on login

echo "Setting up auto-launch menu functionality with auto-update..."

# Create the auto-update script in /usr/bin for system-wide access
if [ ! -f "/usr/bin/auto-update" ]; then
    cp /home/user/workspace/ssh/auto-update.sh /usr/bin/auto-update
    chmod +x /usr/bin/auto-update
    echo "Auto-update script installed to /usr/bin/auto-update"
fi

# Create the auto-launch script in /usr/bin for system-wide access
if [ ! -f "/usr/bin/auto-menu" ]; then
    cp /home/user/workspace/ssh/auto-menu.sh /usr/bin/auto-menu
    chmod +x /usr/bin/auto-menu
    echo "Auto-menu script installed to /usr/bin/auto-menu"
fi

# Add auto-launch to root .bashrc if not already present
if ! grep -q "auto-menu" /root/.bashrc 2>/dev/null; then
    echo "" >> /root/.bashrc
    echo "# Auto-launch Athena Project menu with update check" >> /root/.bashrc
    echo "if [ -f /usr/bin/auto-menu ]; then" >> /root/.bashrc
    echo "    source /usr/bin/auto-menu" >> /root/.bashrc
    echo "fi" >> /root/.bashrc
    echo "Auto-launch added to /root/.bashrc"
fi

# Create aliases for easy access
if ! grep -q "alias menu=" /root/.bashrc 2>/dev/null; then
    echo "" >> /root/.bashrc
    echo "# Athena Project aliases" >> /root/.bashrc
    echo "alias menu=\"bash /usr/bin/menu\"" >> /root/.bashrc
    echo "alias update-check=\"/usr/bin/auto-update manual\"" >> /root/.bashrc
    echo "alias update-status=\"/usr/bin/auto-update status\"" >> /root/.bashrc
    echo "alias update-force=\"/usr/bin/auto-update force\"" >> /root/.bashrc
    echo "Menu and update aliases added to /root/.bashrc"
fi

# Initialize version tracking
if [ ! -f "/usr/local/athena-version" ]; then
    echo "initial" > /usr/local/athena-version
    echo "Version tracking initialized"
fi

# Create update log directory
mkdir -p /var/log
touch /var/log/athena-update.log
chmod 644 /var/log/athena-update.log

echo ""
echo "✅ Auto-launch and auto-update setup completed!"
echo ""
echo "📋 Available commands:"
echo "  menu         - Open main menu"
echo "  update-check - Manual update check"
echo "  update-status - Show update status"
echo "  update-force - Force update"
echo ""
echo "🔄 Auto-update features:"
echo "  • Checks for updates once per day on login"
echo "  • Automatically downloads and applies updates"
echo "  • Creates backups before updating"
echo "  • Restores backup if update fails"
echo ""
echo "📝 Logs are stored in: /var/log/athena-update.log"
