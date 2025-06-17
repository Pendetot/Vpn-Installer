#!/bin/bash

# Test script to verify menu structure
echo "Testing Athena Project Menu System..."
echo ""

# Test if all menu files exist
files=(
    "ssh/menu.sh"
    "ssh/ssh-menu.sh" 
    "ssh/vpn-menu.sh"
    "ssh/advanced-menu.sh"
    "ssh/xray-menu.sh"
    "ssh/system-menu.sh"
    "ssh/service-status.sh"
    "ssh/auto-menu.sh"
    "ssh/info.sh"
    "ssh/about.sh"
)

echo "Checking menu files..."
for file in "${files[@]}"; do
    if [ -f "/home/user/workspace/$file" ]; then
        echo "✓ $file exists"
    else
        echo "✗ $file missing"
    fi
done

echo ""
echo "Checking file permissions..."
for file in "${files[@]}"; do
    if [ -x "/home/user/workspace/$file" ]; then
        echo "✓ $file is executable"
    else
        echo "✗ $file not executable"
    fi
done

echo ""
echo "Testing color definitions in main menu..."
head -20 /home/user/workspace/ssh/menu.sh | grep -E "RESET|CYAN|GREEN"

echo ""
echo "Menu system test completed!"
