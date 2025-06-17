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
echo "  ║                  🔒 Advanced Tunneling Menu                   ║"
echo "  ╚═══════════════════════════════════════════════════════════════╝"
echo -e "${RESET}"
echo ""

# Shadowsocks Section
echo -e "${WHITE}${BOLD}${PURPLE}Shadowsocks${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN} 1${RESET}${WHITE}.${RESET} Create Account Shadowsocks ${GREEN} 2${RESET}${WHITE}.${RESET} Delete Account Shadowsocks"
echo -e "${GREEN} 3${RESET}${WHITE}.${RESET} Extending Account Shadowsocks Active Life"
echo -e "${GREEN} 4${RESET}${WHITE}.${RESET} Check User Login Shadowsocks"
echo ""

# ShadowsocksR Section
echo -e "${WHITE}${BOLD}${PURPLE}ShadowsocksR${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN} 5${RESET}${WHITE}.${RESET} Create Account SSR         ${GREEN} 6${RESET}${WHITE}.${RESET} Delete Account SSR"
echo -e "${GREEN} 7${RESET}${WHITE}.${RESET} Extending Account SSR Active Life"
echo -e "${GREEN} 8${RESET}${WHITE}.${RESET} Show Other SSR Menu"
echo ""

# Trojan GO Section
echo -e "${WHITE}${BOLD}${RED}Trojan GO${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN} 9${RESET}${WHITE}.${RESET} Create Account Trojan Go   ${GREEN}10${RESET}${WHITE}.${RESET} Delete Account Trojan Go"
echo -e "${GREEN}11${RESET}${WHITE}.${RESET} Extending Account Trojan Go Active Life"
echo -e "${GREEN}12${RESET}${WHITE}.${RESET} Check User Login Trojan Go"
echo ""

echo -e "${GREEN} 0${RESET}${WHITE}.${RESET} Back to Main Menu"
echo ""
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${WHITE}${BOLD}Select option [${GREEN}0${WHITE}-${GREEN}12${WHITE}]:${RESET} \\c"
read menu
echo ""

case $menu in
1)
addss
;;
2)
delss
;;
3)
renewss
;;
4)
cekss
;;
5)
addssr
;;
6)
delssr
;;
7)
renewssr
;;
8)
ssr
;;
9)
addtrgo
;;
10)
deltrgo
;;
11)
renewtrgo
;;
12)
cektrgo
;;
0)
menu
;;
*)
clear
advanced-menu
;;
esac
