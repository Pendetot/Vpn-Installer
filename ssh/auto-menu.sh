#!/bin/bash

# Auto-launch menu script for Athena Project
# This script automatically opens the menu when user logs in

# Color definitions
CYAN="\033[96m"
GREEN="\033[92m"
RESET="\033[0m"

# Check if this is an interactive shell
if [[ $- == *i* ]]; then
    # Check if we are in a terminal (not in a script)
    if [ -t 0 ]; then
        # Show welcome message
        echo -e "${CYAN}Welcome to Athena Project Mas Ventod!${RESET}"
        echo -e "${GREEN}Loading menu automatically...${RESET}"
        echo ""
        
        # Small delay for better user experience
        sleep 1
        
        # Launch menu
        menu
    fi
fi
