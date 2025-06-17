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
echo "  ║                    ⚡ XRAY Protocols Menu                     ║"
echo "  ╚═══════════════════════════════════════════════════════════════╝"
echo -e "${RESET}"
echo ""

# VMESS Section
echo -e "${WHITE}${BOLD}${YELLOW}VMESS${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN} 1${RESET}${WHITE}.${RESET} Create Account XRAYS Vmess Websocket"
echo -e "${GREEN} 2${RESET}${WHITE}.${RESET} Delete Account XRAYS Vmess Websocket"
echo -e "${GREEN} 3${RESET}${WHITE}.${RESET} Extending Account XRAYS Vmess Active Life"
echo -e "${GREEN} 4${RESET}${WHITE}.${RESET} Check User Login XRAYS Vmess"
echo ""

# VLESS Section
echo -e "${WHITE}${BOLD}${YELLOW}VLESS${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN} 5${RESET}${WHITE}.${RESET} Create Account XRAYS Vless Websocket"
echo -e "${GREEN} 6${RESET}${WHITE}.${RESET} Delete Account XRAYS Vless Websocket"
echo -e "${GREEN} 7${RESET}${WHITE}.${RESET} Extending Account XRAYS Vless Active Life"
echo -e "${GREEN} 8${RESET}${WHITE}.${RESET} Check User Login XRAYS Vless"
echo ""

# TROJAN Section
echo -e "${WHITE}${BOLD}${YELLOW}TROJAN${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN} 9${RESET}${WHITE}.${RESET} Create Account XRAYS Trojan"
echo -e "${GREEN}10${RESET}${WHITE}.${RESET} Delete Account XRAYS Trojan"
echo -e "${GREEN}11${RESET}${WHITE}.${RESET} Extending Account XRAYS Trojan Active Life"
echo -e "${GREEN}12${RESET}${WHITE}.${RESET} Check User Login XRAYS Trojan"
echo ""

# Certificate Management
echo -e "${WHITE}${BOLD}${CYAN}Certificate Management${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN}13${RESET}${WHITE}.${RESET} Renew Certificate XRAYS Account"
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
addvmess
;;
2)
delvmess
;;
3)
renewvmess
;;
4)
cekvmess
;;
5)
addvless
;;
6)
delvless
;;
7)
renewvless
;;
8)
cekvless
;;
9)
addtrojan
;;
10)
deltrojan
;;
11)
renewtrojan
;;
12)
cektrojan
;;
13)
certv2ray
;;
0)
menu
;;
*)
clear
xray-menu
;;
esac
