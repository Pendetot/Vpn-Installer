#!/bin/bash
cd /home/user/workspace

# Source the service status functions
source ssh/service-status.sh

# Color definitions
RESET="[0m"
BOLD="[1m"
CYAN="[96m"
BLUE="[94m"
GREEN="[92m"
YELLOW="[93m"
RED="[91m"
WHITE="[97m"

# Get system information
HOSTNAME=$(hostname)
IP=$(curl -s ifconfig.me 2>/dev/null || echo "N/A")
UPTIME=$(uptime -p 2>/dev/null || echo "N/A")
DATE=$(date "+%Y-%m-%d %H:%M:%S")

clear

# Simple header
echo -e "${CYAN}${BOLD}"
echo "=================================================================="
echo "                    ATHENA PROJECT TUNNELING"
echo "                      Mas Ventod Edition"
echo "=================================================================="
echo -e "${RESET}"

# System information
echo -e "${WHITE}System Information:${RESET}"
echo "=================================================================="
echo "Host: ${HOSTNAME}"
echo "IP Address: ${IP}"
echo "Date: ${DATE}"
echo "Uptime: ${UPTIME}"
echo "=================================================================="
echo ""

# Show running services
show_running_services

# Main menu categories
echo -e "${WHITE}${BOLD}Main Menu Categories${RESET}"
echo "=================================================================="
echo -e "${GREEN} 1${RESET}. SSH & OpenVPN Services"
echo -e "${GREEN} 2${RESET}. VPN Protocols (L2TP, PPTP, SSTP, WireGuard)"
echo -e "${GREEN} 3${RESET}. Advanced Tunneling (Shadowsocks, SSR, Trojan GO)"
echo -e "${GREEN} 4${RESET}. XRAY Protocols (VMESS, VLESS, Trojan)"
echo -e "${GREEN} 5${RESET}. System Management & Tools"
echo ""

# Auto-Update Status
if [ -f "/usr/local/bin/auto-update.sh" ]; then
    AUTO_UPDATE_STATUS=$(/usr/local/bin/auto-update.sh status 2>/dev/null | grep -o "ENABLED\|DISABLED" || echo "UNKNOWN")
    if [ "$AUTO_UPDATE_STATUS" = "ENABLED" ]; then
        UPDATE_STATUS="${GREEN}[ON]${RESET}"
    else
        UPDATE_STATUS="${RED}[OFF]${RESET}"
    fi
else
    UPDATE_STATUS="${YELLOW}[NOT INSTALLED]${RESET}"
fi

# Quick Actions
echo -e "${WHITE}${BOLD}Quick Actions${RESET}"
echo "=================================================================="
echo -e "${GREEN} 6${RESET}. Restart All Services"
echo -e "${GREEN} 7${RESET}. System Information"
echo -e "${GREEN} 8${RESET}. About Script"
echo -e "${GREEN} 9${RESET}. Auto-Update ${UPDATE_STATUS}"
echo ""
echo -e "${GREEN} 0${RESET}. Exit"
echo ""
echo "=================================================================="
echo ""
echo -e "${WHITE}${BOLD}Select option [${GREEN}0${WHITE}-${GREEN}9${WHITE}]:${RESET}"
