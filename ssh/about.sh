#!/bin/bash

clear

# Color definitions
RESET="[0m"
BOLD="[1m"
CYAN="[96m"
GREEN="[92m"
YELLOW="[93m"
WHITE="[97m"
GRAY="[90m"
PURPLE="[95m"

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
echo -e "${WHITE}${BOLD}📋 About Athena Project${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN}Project Name:${RESET} Athena Project Mas Ventod"
echo -e "${GREEN}Developer:${RESET} Mas Ventod"
echo -e "${GREEN}Telegram:${RESET} @masventot"
echo -e "${GREEN}Version:${RESET} Enhanced Multi-Protocol VPN Installer"
echo ""

# Supported Systems
echo -e "${WHITE}${BOLD}💻 Supported Systems${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${YELLOW}•${RESET} Debian 10, 11 (64 bit)"
echo -e "${YELLOW}•${RESET} Ubuntu 18.04, 20.04, 22.04 (64 bit)"
echo -e "${YELLOW}•${RESET} VPS with KVM and VMWare virtualization"
echo ""

# Supported Protocols
echo -e "${WHITE}${BOLD}🔐 Supported Protocols${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${PURPLE}•${RESET} SSH & OpenVPN"
echo -e "${PURPLE}•${RESET} L2TP/IPsec, PPTP, SSTP"
echo -e "${PURPLE}•${RESET} WireGuard"
echo -e "${PURPLE}•${RESET} Shadowsocks & ShadowsocksR"
echo -e "${PURPLE}•${RESET} XRAY (VMESS, VLESS, Trojan)"
echo -e "${PURPLE}•${RESET} Trojan GO"
echo ""

# Thanks Section
echo -e "${WHITE}${BOLD}🙏 Thanks To${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN}•${RESET} Allah SWT"
echo -e "${GREEN}•${RESET} My Family"
echo -e "${GREEN}•${RESET} VPN Community"
echo -e "${GREEN}•${RESET} All Contributors"
echo ""

echo -e "${CYAN}Press any key to return to menu...${RESET}"
read -n 1 -s
menu
