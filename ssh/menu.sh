#!/bin/bash
clear

# Color definitions for modern minimalist design
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

# Get system information
HOSTNAME=$(hostname)
IP=$(curl -s ifconfig.me 2>/dev/null || echo "N/A")
UPTIME=$(uptime -p 2>/dev/null || echo "N/A")
DATE=$(date "+%Y-%m-%d %H:%M:%S")

# Header with AthenaProject Tunneling branding
echo -e "${CYAN}${BOLD}"
echo "  ╔═══════════════════════════════════════════════════════════════╗"
echo "  ║                                                               ║"
echo "  ║              ▄▀█ ▀█▀ █░█ █▀▀ █▄░█ ▄▀█ █▀█ █▀█ █▀█ ░░█ █▀▀ █▀▀ ▀█▀  ║"
echo "  ║              █▀█ ░█░ █▀█ ██▄ █░▀█ █▀█ █▀▀ █▀▄ █▄█ █▄█ ██▄ █▄▄ ░█░  ║"
echo "  ║                                                               ║"
echo "  ║                        T U N N E L I N G                      ║"
echo "  ║                                                               ║"
echo "  ╚═══════════════════════════════════════════════════════════════╝"
echo -e "${RESET}"

# System info bar
echo -e "${GRAY}${DIM}┌─────────────────────────────────────────────────────────────────┐${RESET}"
echo -e "${GRAY}${DIM}│${RESET} ${WHITE}Host:${RESET} ${HOSTNAME} ${GRAY}│${RESET} ${WHITE}IP:${RESET} ${IP} ${GRAY}│${RESET} ${WHITE}Date:${RESET} ${DATE} ${GRAY}${DIM}│${RESET}"
echo -e "${GRAY}${DIM}│${RESET} ${WHITE}Uptime:${RESET} ${UPTIME}${GRAY}${DIM}                                    │${RESET}"
echo -e "${GRAY}${DIM}└─────────────────────────────────────────────────────────────────┘${RESET}"
echo ""

# Modern menu sections with icons
echo -e "${WHITE}${BOLD}🔐 SSH & OpenVPN${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN} 1${RESET}${WHITE}.${RESET} Create SSH & OpenVPN Account"
echo -e "${GREEN} 2${RESET}${WHITE}.${RESET} Generate SSH & OpenVPN Trial Account"
echo -e "${GREEN} 3${RESET}${WHITE}.${RESET} Extending SSH & OpenVPN Account Active Life"
echo -e "${GREEN} 4${RESET}${WHITE}.${RESET} Check User Login SSH & OpenVPN"
echo -e "${GREEN} 5${RESET}${WHITE}.${RESET} Daftar Member SSH & OpenVPN"
echo -e "${GREEN} 6${RESET}${WHITE}.${RESET} Delete SSH & OpenVpn Account"
echo -e "${GREEN} 7${RESET}${WHITE}.${RESET} Delete User Expired SSH & OpenVPN"
echo -e "${GREEN} 8${RESET}${WHITE}.${RESET} Set up Autokill SSH"
echo -e "${GREEN} 9${RESET}${WHITE}.${RESET} Displays Users Who Do Multi Login SSH"
echo -e "${GREEN}10${RESET}${WHITE}.${RESET} Restart All Service"
echo ""

echo -e "${WHITE}${BOLD}🌐 VPN Protocols${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${BLUE}L2TP${RESET}"
echo -e "${GREEN}11${RESET}${WHITE}.${RESET} Create Account L2TP        ${GREEN}12${RESET}${WHITE}.${RESET} Delete Account L2TP"
echo -e "${GREEN}13${RESET}${WHITE}.${RESET} Extending Account L2TP Active Life"
echo ""
echo -e "${BLUE}PPTP${RESET}"
echo -e "${GREEN}14${RESET}${WHITE}.${RESET} Create Account PPTP        ${GREEN}15${RESET}${WHITE}.${RESET} Delete Account PPTP"
echo -e "${GREEN}16${RESET}${WHITE}.${RESET} Extending Account PPTP Active Life"
echo ""
echo -e "${BLUE}SSTP${RESET}"
echo -e "${GREEN}17${RESET}${WHITE}.${RESET} Create Account SSTP        ${GREEN}18${RESET}${WHITE}.${RESET} Delete Account SSTP"
echo -e "${GREEN}19${RESET}${WHITE}.${RESET} Extending Account SSTP Active Life"
echo -e "${GREEN}20${RESET}${WHITE}.${RESET} Check User Login SSTP"
echo ""

echo -e "${WHITE}${BOLD}🔒 Advanced Tunneling${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${PURPLE}WireGuard${RESET}"
echo -e "${GREEN}21${RESET}${WHITE}.${RESET} Create Account Wireguard   ${GREEN}22${RESET}${WHITE}.${RESET} Delete Account Wireguard"
echo -e "${GREEN}23${RESET}${WHITE}.${RESET} Extending Account Wireguard Active Life"
echo ""
echo -e "${PURPLE}Shadowsocks${RESET}"
echo -e "${GREEN}24${RESET}${WHITE}.${RESET} Create Account Shadowsocks ${GREEN}25${RESET}${WHITE}.${RESET} Delete Account Shadowsocks"
echo -e "${GREEN}26${RESET}${WHITE}.${RESET} Extending Account Shadowsocks Active Life"
echo -e "${GREEN}27${RESET}${WHITE}.${RESET} Check User Login Shadowsocks"
echo ""
echo -e "${PURPLE}ShadowsocksR${RESET}"
echo -e "${GREEN}28${RESET}${WHITE}.${RESET} Create Account SSR         ${GREEN}29${RESET}${WHITE}.${RESET} Delete Account SSR"
echo -e "${GREEN}30${RESET}${WHITE}.${RESET} Extending Account SSR Active Life"
echo -e "${GREEN}31${RESET}${WHITE}.${RESET} Show Other SSR Menu"
echo ""

echo -e "${WHITE}${BOLD}⚡ XRAYS Protocols${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${YELLOW}VMESS${RESET}"
echo -e "${GREEN}32${RESET}${WHITE}.${RESET} Create Account XRAYS Vmess Websocket"
echo -e "${GREEN}33${RESET}${WHITE}.${RESET} Delete Account XRAYS Vmess Websocket"
echo -e "${GREEN}34${RESET}${WHITE}.${RESET} Extending Account XRAYS Vmess Active Life"
echo -e "${GREEN}35${RESET}${WHITE}.${RESET} Check User Login XRAYS Vmess"
echo -e "${GREEN}36${RESET}${WHITE}.${RESET} Renew Certificate XRAYS Account"
echo ""
echo -e "${YELLOW}VLESS${RESET}"
echo -e "${GREEN}37${RESET}${WHITE}.${RESET} Create Account XRAYS Vless Websocket"
echo -e "${GREEN}38${RESET}${WHITE}.${RESET} Delete Account XRAYS Vless Websocket"
echo -e "${GREEN}39${RESET}${WHITE}.${RESET} Extending Account XRAYS Vless Active Life"
echo -e "${GREEN}40${RESET}${WHITE}.${RESET} Check User Login XRAYS Vless"
echo ""
echo -e "${YELLOW}TROJAN${RESET}"
echo -e "${GREEN}41${RESET}${WHITE}.${RESET} Create Account XRAYS Trojan"
echo -e "${GREEN}42${RESET}${WHITE}.${RESET} Delete Account XRAYS Trojan"
echo -e "${GREEN}43${RESET}${WHITE}.${RESET} Extending Account XRAYS Trojan Active Life"
echo -e "${GREEN}44${RESET}${WHITE}.${RESET} Check User Login XRAYS Trojan"
echo ""

echo -e "${WHITE}${BOLD}🛡️ Trojan GO${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN}45${RESET}${WHITE}.${RESET} Create Account Trojan Go   ${GREEN}46${RESET}${WHITE}.${RESET} Delete Account Trojan Go"
echo -e "${GREEN}47${RESET}${WHITE}.${RESET} Extending Account Trojan Go Active Life"
echo -e "${GREEN}48${RESET}${WHITE}.${RESET} Check User Login Trojan Go"
echo ""

echo -e "${WHITE}${BOLD}⚙️  System Management${RESET}"
echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN}49${RESET}${WHITE}.${RESET} Add Or Change Domain Host For VPS (Enhanced)"
echo -e "${GREEN}50${RESET}${WHITE}.${RESET} Change Port Of Some Service"
echo -e "${GREEN}51${RESET}${WHITE}.${RESET} Autobackup Data VPS       ${GREEN}52${RESET}${WHITE}.${RESET} Backup Data VPS"
echo -e "${GREEN}53${RESET}${WHITE}.${RESET} Restore Data VPS          ${GREEN}54${RESET}${WHITE}.${RESET} Webmin Menu"
echo -e "${GREEN}55${RESET}${WHITE}.${RESET} Limit Bandwith Speed Server"
echo -e "${GREEN}56${RESET}${WHITE}.${RESET} Check Usage of VPS Ram    ${GREEN}57${RESET}${WHITE}.${RESET} Reboot VPS"
echo -e "${GREEN}58${RESET}${WHITE}.${RESET} Speedtest VPS             ${GREEN}59${RESET}${WHITE}.${RESET} Displaying System Information"
echo -e "${GREEN}60${RESET}${WHITE}.${RESET} Info Script Auto Install"

echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
echo -e "${WHITE}${BOLD}Select option [${GREEN}1${WHITE}-${GREEN}60${WHITE}]:${RESET} \\c"
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
11)
addl2tp
;;
12)
dell2tp
;;
13)
renewl2tp
;;
14)
addpptp
;;
15)
delpptp
;;
16)
renewpptp
;;
17)
addsstp
;;
18)
delsstp
;;
19)
renewsstp
;;
20)
ceksstp
;;
21)
addwg
;;
22)
delwg
;;
23)
renewwg
;;
24)
addss
;;
25)
delss
;;
26)
renewss
;;
27)
cekss
;;
28)
addssr
;;
29)
delssr
;;
30)
renewssr
;;
31)
ssr
;;
32)
addvmess
;;
33)
delvmess
;;
34)
renewvmess
;;
35)
cekvmess
;;
36)
certv2ray
;;
37)
addvless
;;
38)
delvless
;;
39)
renewvless
;;
40)
cekvless
;;
41)
addtrojan
;;
42)
deltrojan
;;
43)
renewtrojan
;;
44)
cektrojan
;;
45)
addtrgo
;;
46)
deltrgo
;;
47)
renewtrgo
;;
48)
cektrgo
;;
49)
addhost-enhanced
;;
50)
changeport
;;
51)
autobackup
;;
52)
backup
;;
53)
restore
;;
54)
wbmn
;;
55)
limitspeed
;;
56)
ram
;;
57)
reboot
;;
58)
speedtest
;;
59)
info
;;
60)
about
;;
*)
clear
menu
;;
esac
