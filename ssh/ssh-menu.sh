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
echo "  ║                    🔐 SSH & OpenVPN Menu                      ║"
echo "  ╚═══════════════════════════════════════════════════════════════╝"
echo -e "${RESET}"
echo ""

# SSH & OpenVPN Options
echo -e "${WHITE}${BOLD}SSH & OpenVPN Management${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN} 1${RESET}${WHITE}.${RESET} Create SSH & OpenVPN Account"
echo -e "${GREEN} 2${RESET}${WHITE}.${RESET} Generate SSH & OpenVPN Trial Account"
echo -e "${GREEN} 3${RESET}${WHITE}.${RESET} Extending SSH & OpenVPN Account Active Life"
echo -e "${GREEN} 4${RESET}${WHITE}.${RESET} Check User Login SSH & OpenVPN"
echo -e "${GREEN} 5${RESET}${WHITE}.${RESET} List Member SSH & OpenVPN"
echo -e "${GREEN} 6${RESET}${WHITE}.${RESET} Delete SSH & OpenVPN Account"
echo -e "${GREEN} 7${RESET}${WHITE}.${RESET} Delete User Expired SSH & OpenVPN"
echo -e "${GREEN} 8${RESET}${WHITE}.${RESET} Set up Autokill SSH"
echo -e "${GREEN} 9${RESET}${WHITE}.${RESET} Check Users Who Do Multi Login SSH"
echo -e "${GREEN}10${RESET}${WHITE}.${RESET} Restart SSH & OpenVPN Services"
echo ""
echo -e "${GREEN} 0${RESET}${WHITE}.${RESET} Back to Main Menu"
echo ""
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${WHITE}${BOLD}Select option [${GREEN}0${WHITE}-${GREEN}10${WHITE}]:${RESET} \\c"
read menu
echo ""

case $menu in
1)
addssh
;;
2)
trialssh
;;
3)
renewssh
;;
4)
cekssh
;;
5)
member
;;
6)
delssh
;;
7)
delexp
;;
8)
autokill
;;
9)
ceklim
;;
10)
restart
;;
0)
menu
;;
*)
clear
ssh-menu
;;
esac
