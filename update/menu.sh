#!/bin/bash
clear

# Color definitions
RESET="[0m"
BOLD="[1m"
CYAN="[96m"
BLUE="[94m"
GREEN="[92m"
YELLOW="[93m"
RED="[91m"
WHITE="[97m"

# Source service status functions
source /usr/bin/service-status.sh 2>/dev/null || source /home/user/workspace/ssh/service-status.sh 2>/dev/null

# Get system information
HOSTNAME=$(hostname)
IP=$(curl -s ifconfig.me 2>/dev/null || echo "N/A")
UPTIME=$(uptime -p 2>/dev/null || echo "N/A")
DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Simple header
echo -e "${CYAN}${BOLD}ATHENA PROJECT TUNNELING - Mas Ventod Edition${RESET}"
echo ""

# System information
echo -e "${WHITE}Host:${RESET} ${HOSTNAME}"
echo -e "${WHITE}IP Address:${RESET} ${IP}"
echo -e "${WHITE}Date:${RESET} ${DATE}"
echo -e "${WHITE}Uptime:${RESET} ${UPTIME}"
echo ""

# Show running services
if type show_running_services >/dev/null 2>&1; then
    show_running_services
fi

# Main menu categories
echo -e "${WHITE}${BOLD}Main Menu Categories${RESET}"
echo -e "${GRAY}----------------------------------------------------------------${RESET}"
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
echo -e "${GRAY}----------------------------------------------------------------${RESET}"
echo -e "${GREEN} 6${RESET}. Restart All Services"
echo -e "${GREEN} 7${RESET}. System Information"
echo -e "${GREEN} 8${RESET}. About Script"
echo -e "${GREEN} 9${RESET}. Auto-Update ${UPDATE_STATUS}"
echo -e "${GREEN}10${RESET}. API Information"
echo ""
echo -e "${GREEN} 0${RESET}. Exit"
echo ""
echo -e "${GRAY}----------------------------------------------------------------${RESET}"
echo ""
echo -e "${WHITE}${BOLD}Select option [${GREEN}0${WHITE}-${GREEN}10${WHITE}]:${RESET} \c"
read menu
echo ""

case $menu in
1)
ssh-menu
;;
2)
vpn-menu
;;
3)
advanced-menu
;;
4)
xray-menu
;;
5)
system-menu
;;
6)
restart
;;
7)
info
;;
8)
about
;;
9)
auto-update-menu
;;
10)
api-info
;;
0)
clear
echo -e "${CYAN}Thank you for using Athena Project Mas Ventod!${RESET}"
echo -e "${YELLOW}Telegram: @masventot${RESET}"
exit 0
;;
*)
clear
menu
;;
esac
