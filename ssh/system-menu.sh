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

# Header
echo -e "${CYAN}${BOLD}"
echo "  ╔═══════════════════════════════════════════════════════════════╗"
echo "  ║                   ⚙️  System Management Menu                  ║"
echo "  ╚═══════════════════════════════════════════════════════════════╝"
echo -e "${RESET}"
echo ""

# Domain & Network Management
echo -e "${WHITE}${BOLD}${BLUE}Domain & Network${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN} 1${RESET}${WHITE}.${RESET} Add Or Change Domain Host For VPS (Enhanced)"
echo -e "${GREEN} 2${RESET}${WHITE}.${RESET} Change Port Of Some Service"
echo -e "${GREEN} 3${RESET}${WHITE}.${RESET} Limit Bandwith Speed Server"
echo ""

# Backup & Restore
echo -e "${WHITE}${BOLD}${PURPLE}Backup & Restore${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN} 4${RESET}${WHITE}.${RESET} Autobackup Data VPS       ${GREEN} 5${RESET}${WHITE}.${RESET} Backup Data VPS"
echo -e "${GREEN} 6${RESET}${WHITE}.${RESET} Restore Data VPS"
echo ""

# System Monitoring
echo -e "${WHITE}${BOLD}${YELLOW}System Monitoring${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN} 7${RESET}${WHITE}.${RESET} Check Usage of VPS Ram    ${GREEN} 8${RESET}${WHITE}.${RESET} Speedtest VPS"
echo -e "${GREEN} 9${RESET}${WHITE}.${RESET} Displaying System Information"
echo ""

# System Control
echo -e "${WHITE}${BOLD}${RED}System Control${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN}10${RESET}${WHITE}.${RESET} Webmin Menu              ${GREEN}11${RESET}${WHITE}.${RESET} Reboot VPS"
echo ""

# Script Information
echo -e "${WHITE}${BOLD}${CYAN}Script Information${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN}12${RESET}${WHITE}.${RESET} Info Script Auto Install"
echo ""

# Auto-Update System
echo -e "${WHITE}${BOLD}${GREEN}🔄 Auto-Update System${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN}13${RESET}${WHITE}.${RESET} 📊 Update Status           ${GREEN}14${RESET}${WHITE}.${RESET} 🔍 Check for Updates"
echo -e "${GREEN}15${RESET}${WHITE}.${RESET} ⚡ Force Update            ${GREEN}16${RESET}${WHITE}.${RESET} ⚙️  Setup Auto-Update"
echo ""

echo -e "${GREEN} 0${RESET}${WHITE}.${RESET} Back to Main Menu"
echo ""
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${WHITE}${BOLD}Select option [${GREEN}0${WHITE}-${GREEN}16${WHITE}]:${RESET} \c"
read menu
echo ""

case $menu in
1)
addhost-enhanced
;;
2)
changeport
;;
3)
limitspeed
;;
4)
autobackup
;;
5)
backup
;;
6)
restore
;;
7)
ram
;;
8)
speedtest
;;
9)
info
;;
10)
wbmn
;;
11)
reboot
;;
12)
about
;;
13)
if [ -f "/usr/bin/auto-update" ]; then
    /usr/bin/auto-update status
else
    echo "Auto-update system not installed. Please run option 16 to setup."
fi
read -n 1 -s -r -p "Press any key to continue..."
system-menu
;;
14)
if [ -f "/usr/bin/auto-update" ]; then
    /usr/bin/auto-update manual
else
    echo "Auto-update system not installed. Please run option 16 to setup."
fi
read -n 1 -s -r -p "Press any key to continue..."
system-menu
;;
15)
if [ -f "/usr/bin/auto-update" ]; then
    /usr/bin/auto-update force
else
    echo "Auto-update system not installed. Please run option 16 to setup."
fi
read -n 1 -s -r -p "Press any key to continue..."
system-menu
;;
16)
if [ -f "/usr/bin/setup-auto-launch" ]; then
    /usr/bin/setup-auto-launch
else
    echo "Setup script not found. Installing auto-update system..."
    wget -O /usr/bin/auto-update "https://raw.githubusercontent.com/Pendetot/Vpn-Installer/main/ssh/auto-update.sh"
    wget -O /usr/bin/setup-auto-launch "https://raw.githubusercontent.com/Pendetot/Vpn-Installer/main/ssh/setup-auto-launch.sh"
    chmod +x /usr/bin/auto-update /usr/bin/setup-auto-launch
    /usr/bin/setup-auto-launch
fi
read -n 1 -s -r -p "Press any key to continue..."
system-menu
;;
0)
clear
menu
;;
*)
clear
system-menu
;;
esac
