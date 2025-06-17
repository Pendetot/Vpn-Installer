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
echo "  ║                    🌐 VPN Protocols Menu                      ║"
echo "  ╚═══════════════════════════════════════════════════════════════╝"
echo -e "${RESET}"
echo ""

# L2TP Section
echo -e "${WHITE}${BOLD}${BLUE}L2TP/IPsec${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN} 1${RESET}${WHITE}.${RESET} Create Account L2TP        ${GREEN} 2${RESET}${WHITE}.${RESET} Delete Account L2TP"
echo -e "${GREEN} 3${RESET}${WHITE}.${RESET} Extending Account L2TP Active Life"
echo ""

# PPTP Section
echo -e "${WHITE}${BOLD}${BLUE}PPTP${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN} 4${RESET}${WHITE}.${RESET} Create Account PPTP        ${GREEN} 5${RESET}${WHITE}.${RESET} Delete Account PPTP"
echo -e "${GREEN} 6${RESET}${WHITE}.${RESET} Extending Account PPTP Active Life"
echo ""

# SSTP Section
echo -e "${WHITE}${BOLD}${BLUE}SSTP${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN} 7${RESET}${WHITE}.${RESET} Create Account SSTP        ${GREEN} 8${RESET}${WHITE}.${RESET} Delete Account SSTP"
echo -e "${GREEN} 9${RESET}${WHITE}.${RESET} Extending Account SSTP Active Life"
echo -e "${GREEN}10${RESET}${WHITE}.${RESET} Check User Login SSTP"
echo ""

# WireGuard Section
echo -e "${WHITE}${BOLD}${PURPLE}WireGuard${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN}11${RESET}${WHITE}.${RESET} Create Account Wireguard   ${GREEN}12${RESET}${WHITE}.${RESET} Delete Account Wireguard"
echo -e "${GREEN}13${RESET}${WHITE}.${RESET} Extending Account Wireguard Active Life"
echo ""

echo -e "${GREEN} 0${RESET}${WHITE}.${RESET} Back to Main Menu"
echo ""
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${WHITE}${BOLD}Select option [${GREEN}0${WHITE}-${GREEN}13${WHITE}]:${RESET} \\c"
read menu
echo ""

case $menu in
1)
addl2tp
;;
2)
dell2tp
;;
3)
renewl2tp
;;
4)
addpptp
;;
5)
delpptp
;;
6)
renewpptp
;;
7)
addsstp
;;
8)
delsstp
;;
9)
renewsstp
;;
10)
ceksstp
;;
11)
addwg
;;
12)
delwg
;;
13)
renewwg
;;
0)
menu
;;
*)
clear
vpn-menu
;;
esac
