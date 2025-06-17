#!/bin/bash

# Auto-launch menu script for Athena Project with auto-update
# This script automatically checks for updates and opens the menu when user logs in

# Color definitions
CYAN="\033[96m"
GREEN="\033[92m"
YELLOW="\033[93m"
RESET="\033[0m"

# Check if this is an interactive shell
if [[ $- == *i* ]]; then
    # Check if we are in a terminal (not in a script)
    if [ -t 0 ]; then
        # Show welcome message
        echo -e "${CYAN}Welcome to Athena Project Mas Ventod!${RESET}"
        echo -e "${GREEN}Checking for updates...${RESET}"
        
        # Check for updates automatically (silent if no updates)
        if [ -f "/usr/bin/auto-update" ]; then
            /usr/bin/auto-update auto
        elif [ -f "/usr/local/bin/auto-update" ]; then
            /usr/local/bin/auto-update auto
        fi
        
        echo -e "${GREEN}Loading menu...${RESET}"
        echo ""
        
        # Small delay for better user experience
        sleep 1
        
        # Launch menu
        menu
    fi
fi
