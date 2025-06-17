#!/bin/bash

clear

# Color definitions
RESET="\033[0m"
BOLD="\033[1m"
CYAN="\033[96m"
GREEN="\033[92m"
YELLOW="\033[93m"
WHITE="\033[97m"
GRAY="\033[90m"

# Header with Athena Project branding
echo -e "${CYAN}${BOLD}"
echo "  ╔═══════════════════════════════════════════════════════════════╗"
echo "  ║                                                               ║"
echo "  ║              ▄▀█ ▀█▀ █░█ █▀▀ █▄░█ ▄▀█   █▀█ █▀█ █▀█ ░░█ █▀▀ █▀▀ ▀█▀  ║"
echo "  ║              █▀█ ░█░ █▀█ ██▄ █░▀█ █▀█   █▀▀ █▀▄ █▄█ █▄█ ██▄ █▄▄ ░█░  ║"
echo "  ║                                                               ║"
echo "  ║                     Mas Ventod Edition                       ║"
echo "  ║                                                               ║"
echo "  ╚═══════════════════════════════════════════════════════════════╝"
echo -e "${RESET}"
echo ""

# Script Information
echo -e "${WHITE}${BOLD}📋 Script Information${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN}Project:${RESET} Athena Project Mas Ventod"
echo -e "${GREEN}Developer:${RESET} Mas Ventod"
echo -e "${GREEN}Telegram:${RESET} @masventot"
echo -e "${GREEN}Version:${RESET} Enhanced Menu System"
echo ""

# System Information
echo -e "${WHITE}${BOLD}🖥️  System Information${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
neofetch

# Installation Log
echo ""
echo -e "${WHITE}${BOLD}📝 Installation Log${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
if [ -f "/root/log-install.txt" ]; then
    cat /root/log-install.txt
else
    echo -e "${YELLOW}Installation log not found${RESET}"
fi
echo ""

echo -e "${CYAN}Press any key to return to menu...${RESET}"
read -n 1 -s
menu
