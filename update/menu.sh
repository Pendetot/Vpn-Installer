#!/bin/bash
clear

# Color definitions
RESET="\033[0m"
BOLD="\033[1m"
DIM="\033[2m"
CYAN="\033[96m"
BLUE="\033[94m"
GREEN="\033[92m"
YELLOW="\033[93m"
RED="\033[91m"
PURPLE="\033[95m"
WHITE="\033[97m"
GRAY="\033[90m"

# Source service status functions
source /usr/bin/service-status.sh 2>/dev/null || source /home/user/workspace/ssh/service-status.sh 2>/dev/null

# Get system information
HOSTNAME=$(hostname)
IP=$(curl -s ifconfig.me 2>/dev/null || echo "N/A")
UPTIME=$(uptime -p 2>/dev/null || echo "N/A")
DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Header with AthenaProject Tunneling branding
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

# System info bar
echo -e "${GRAY}${DIM}┌─────────────────────────────────────────────────────────────────┐${RESET}"
echo -e "${GRAY}${DIM}│${RESET} ${WHITE}Host:${RESET} ${HOSTNAME} ${GRAY}│${RESET} ${WHITE}IP:${RESET} ${IP} ${GRAY}│${RESET} ${WHITE}Date:${RESET} ${DATE} ${GRAY}${DIM}│${RESET}"
echo -e "${GRAY}${DIM}│${RESET} ${WHITE}Uptime:${RESET} ${UPTIME}${GRAY}${DIM}                                    │${RESET}"
echo -e "${GRAY}${DIM}└─────────────────────────────────────────────────────────────────┘${RESET}"
echo ""

# Show running services
if type show_running_services >/dev/null 2>&1; then
    show_running_services
fi

# Main menu categories
echo -e "${WHITE}${BOLD}📋 Main Menu Categories${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN} 1${RESET}${WHITE}.${RESET} 🔐 SSH & OpenVPN Services"
echo -e "${GREEN} 2${RESET}${WHITE}.${RESET} 🌐 VPN Protocols (L2TP, PPTP, SSTP, WireGuard)"
echo -e "${GREEN} 3${RESET}${WHITE}.${RESET} 🔒 Advanced Tunneling (Shadowsocks, SSR, Trojan GO)"
echo -e "${GREEN} 4${RESET}${WHITE}.${RESET} ⚡ XRAY Protocols (VMESS, VLESS, Trojan)"
echo -e "${GREEN} 5${RESET}${WHITE}.${RESET} ⚙️  System Management & Tools"
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
echo -e "${WHITE}${BOLD}⚡ Quick Actions${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN} 6${RESET}${WHITE}.${RESET} 🔄 Restart All Services"
echo -e "${GREEN} 7${RESET}${WHITE}.${RESET} 📊 System Information"
echo -e "${GREEN} 8${RESET}${WHITE}.${RESET} ℹ️  About Script"
echo -e "${GREEN} 9${RESET}${WHITE}.${RESET} 🔄 Auto-Update ${UPDATE_STATUS}"
echo ""

echo -e "${GREEN} 0${RESET}${WHITE}.${RESET} 🚪 Exit"
echo ""
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${WHITE}${BOLD}Select option [${GREEN}0${WHITE}-${GREEN}9${WHITE}]:${RESET} \c"
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
