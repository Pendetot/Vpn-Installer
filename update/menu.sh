#!/bin/bash
clear
# AthenaProject Color Scheme
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# AthenaProject Banner
echo -e "${CYAN}╔══════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${BOLD}${WHITE}                    🚀 ATHENA PROJECT VPN MANAGER 🚀                ${NC}${CYAN}║${NC}"
echo -e "${CYAN}║${BOLD}${PURPLE}                        Powered by MasVentot                        ${NC}${CYAN}║${NC}"
echo -e "${CYAN}╠══════════════════════════════════════════════════════════════════╣${NC}"
echo -e "${CYAN}║${YELLOW} Version: 2.0.0                    ${WHITE}Recode By: AthenaProject ${NC}${CYAN}║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# SSH & OpenVPN Section
echo -e "${BOLD}${BLUE}┌─────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${BOLD}${BLUE}│${WHITE}                        🔐 SSH & OpenVPN                         ${BLUE}│${NC}"
echo -e "${BOLD}${BLUE}└─────────────────────────────────────────────────────────────────┘${NC}"
echo -e "${GREEN} 1${WHITE}.  Create SSH & OpenVPN Account${NC}"
echo -e "${GREEN} 2${WHITE}.  Generate SSH & OpenVPN Trial Account${NC}"
echo -e "${GREEN} 3${WHITE}.  Extending SSH & OpenVPN Account Active Life${NC}"
echo -e "${GREEN} 4${WHITE}.  Check User Login SSH & OpenVPN${NC}"
echo -e "${GREEN} 5${WHITE}.  Daftar Member SSH & OpenVPN${NC}"
echo -e "${GREEN} 6${WHITE}.  Delete SSH & OpenVpn Account${NC}"
echo -e "${GREEN} 7${WHITE}.  Delete User Expired SSH & OpenVPN${NC}"
echo -e "${GREEN} 8${WHITE}.  Set up Autokill SSH${NC}"
echo -e "${GREEN} 9${WHITE}.  Displays Users Who Do Multi Login SSH${NC}"
echo -e "${GREEN}10${WHITE}.  Restart All Service${NC}"
echo ""

# L2TP Section
echo -e "${BOLD}${PURPLE}┌─────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${BOLD}${PURPLE}│${WHITE}                            🌐 L2TP VPN                          ${PURPLE}│${NC}"
echo -e "${BOLD}${PURPLE}└─────────────────────────────────────────────────────────────────┘${NC}"
echo -e "${GREEN}11${WHITE}.  Create Account L2TP${NC}"
echo -e "${GREEN}12${WHITE}.  Delete Account L2TP${NC}"
echo -e "${GREEN}13${WHITE}.  Extending Account L2TP Active Life${NC}"
echo ""

# PPTP Section
echo -e "${BOLD}${YELLOW}┌─────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${BOLD}${YELLOW}│${WHITE}                            🔒 PPTP VPN                          ${YELLOW}│${NC}"
echo -e "${BOLD}${YELLOW}└─────────────────────────────────────────────────────────────────┘${NC}"
echo -e "${GREEN}14${WHITE}.  Create Account PPTP${NC}"
echo -e "${GREEN}15${WHITE}.  Delete Account PPTP${NC}"
echo -e "${GREEN}16${WHITE}.  Extending Account PPTP Active Life${NC}"
echo ""

# SSTP Section
echo -e "${BOLD}${RED}┌─────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${BOLD}${RED}│${WHITE}                            🛡️  SSTP VPN                          ${RED}│${NC}"
echo -e "${BOLD}${RED}└─────────────────────────────────────────────────────────────────┘${NC}"
echo -e "${GREEN}17${WHITE}.  Create Account SSTP${NC}"
echo -e "${GREEN}18${WHITE}.  Delete Account SSTP${NC}"
echo -e "${GREEN}19${WHITE}.  Extending Account SSTP Active Life${NC}"
echo -e "${GREEN}20${WHITE}.  Check User Login SSTP${NC}"
echo ""

# WireGuard Section
echo -e "${BOLD}${CYAN}┌─────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${BOLD}${CYAN}│${WHITE}                          ⚡ WIREGUARD VPN                        ${CYAN}│${NC}"
echo -e "${BOLD}${CYAN}└─────────────────────────────────────────────────────────────────┘${NC}"
echo -e "${GREEN}21${WHITE}.  Create Account Wireguard${NC}"
echo -e "${GREEN}22${WHITE}.  Delete Account Wireguard${NC}"
echo -e "${GREEN}23${WHITE}.  Extending Account Wireguard Active Life${NC}"
echo ""

# Shadowsocks Section
echo -e "${BOLD}${PURPLE}┌─────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${BOLD}${PURPLE}│${WHITE}                          🌙 SHADOWSOCKS                         ${PURPLE}│${NC}"
echo -e "${BOLD}${PURPLE}└─────────────────────────────────────────────────────────────────┘${NC}"
echo -e "${GREEN}24${WHITE}.  Create Account Shadowsocks${NC}"
echo -e "${GREEN}25${WHITE}.  Delete Account Shadowsocks${NC}"
echo -e "${GREEN}26${WHITE}.  Extending Account Shadowsocks Active Life${NC}"
echo -e "${GREEN}27${WHITE}.  Check User Login Shadowsocks${NC}"
echo ""

# ShadowsocksR Section
echo -e "${BOLD}${BLUE}┌─────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${BOLD}${BLUE}│${WHITE}                         🔮 SHADOWSOCKSR                         ${BLUE}│${NC}"
echo -e "${BOLD}${BLUE}└─────────────────────────────────────────────────────────────────┘${NC}"
echo -e "${GREEN}28${WHITE}.  Create Account SSR${NC}"
echo -e "${GREEN}29${WHITE}.  Delete Account SSR${NC}"
echo -e "${GREEN}30${WHITE}.  Extending Account SSR Active Life${NC}"
echo -e "${GREEN}31${WHITE}.  Show Other SSR Menu${NC}"
echo ""

# XRAYS VMESS Section
echo -e "${BOLD}${YELLOW}┌─────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${BOLD}${YELLOW}│${WHITE}                          ⭐ XRAYS VMESS                         ${YELLOW}│${NC}"
echo -e "${BOLD}${YELLOW}└─────────────────────────────────────────────────────────────────┘${NC}"
echo -e "${GREEN}32${WHITE}.  Create Account XRAYS Vmess Websocket${NC}"
echo -e "${GREEN}33${WHITE}.  Delete Account XRAYS Vmess Websocket${NC}"
echo -e "${GREEN}34${WHITE}.  Extending Account XRAYS Vmess Active Life${NC}"
echo -e "${GREEN}35${WHITE}.  Check User Login XRAYS Vmess${NC}"
echo -e "${GREEN}36${WHITE}.  Renew Certificate XRAYS Account${NC}"
echo ""

# XRAYS VLESS Section
echo -e "${BOLD}${RED}┌─────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${BOLD}${RED}│${WHITE}                          🌟 XRAYS VLESS                         ${RED}│${NC}"
echo -e "${BOLD}${RED}└─────────────────────────────────────────────────────────────────┘${NC}"
echo -e "${GREEN}37${WHITE}.  Create Account XRAYS Vless Websocket${NC}"
echo -e "${GREEN}38${WHITE}.  Delete Account XRAYS Vless Websocket${NC}"
echo -e "${GREEN}39${WHITE}.  Extending Account XRAYS Vless Active Life${NC}"
echo -e "${GREEN}40${WHITE}.  Check User Login XRAYS Vless${NC}"
echo ""

# XRAYS TROJAN Section
echo -e "${BOLD}${CYAN}┌─────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${BOLD}${CYAN}│${WHITE}                         🗡️  XRAYS TROJAN                         ${CYAN}│${NC}"
echo -e "${BOLD}${CYAN}└─────────────────────────────────────────────────────────────────┘${NC}"
echo -e "${GREEN}41${WHITE}.  Create Account XRAYS Trojan${NC}"
echo -e "${GREEN}42${WHITE}.  Delete Account XRAYS Trojan${NC}"
echo -e "${GREEN}43${WHITE}.  Extending Account XRAYS Trojan Active Life${NC}"
echo -e "${GREEN}44${WHITE}.  Check User Login XRAYS Trojan${NC}"
echo ""

# TROJAN GO Section
echo -e "${BOLD}${PURPLE}┌─────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${BOLD}${PURPLE}│${WHITE}                          🏹 TROJAN GO                          ${PURPLE}│${NC}"
echo -e "${BOLD}${PURPLE}└─────────────────────────────────────────────────────────────────┘${NC}"
echo -e "${GREEN}45${WHITE}.  Create Account Trojan Go${NC}"
echo -e "${GREEN}46${WHITE}.  Delete Account Trojan Go${NC}"
echo -e "${GREEN}47${WHITE}.  Extending Account Trojan Go Active Life${NC}"
echo -e "${GREEN}48${WHITE}.  Check User Login Trojan Go${NC}"
echo ""

# SYSTEM Section
echo -e "${BOLD}${WHITE}┌─────────────────────────────────────────────────────────────────┐${NC}"
echo -e "${BOLD}${WHITE}│${YELLOW}                          ⚙️  SYSTEM TOOLS                        ${WHITE}│${NC}"
echo -e "${BOLD}${WHITE}└─────────────────────────────────────────────────────────────────┘${NC}"
echo -e "${GREEN}49${WHITE}.  Add Or Change Subdomain Host For VPS${NC}"
echo -e "${GREEN}50${WHITE}.  Change Port Of Some Service${NC}"
echo -e "${GREEN}51${WHITE}.  Autobackup Data VPS${NC}"
echo -e "${GREEN}52${WHITE}.  Backup Data VPS${NC}"
echo -e "${GREEN}53${WHITE}.  Restore Data VPS${NC}"
echo -e "${GREEN}54${WHITE}.  Webmin Menu${NC}"
echo -e "${GREEN}55${WHITE}.  Limit Bandwith Speed Server${NC}"
echo -e "${GREEN}56${WHITE}.  Check Usage of VPS Ram${NC}"
echo -e "${GREEN}57${WHITE}.  Reboot VPS${NC}"
echo -e "${GREEN}58${WHITE}.  Speedtest VPS${NC}"
echo -e "${GREEN}59${WHITE}.  Displaying System Information${NC}"
echo -e "${GREEN}60${WHITE}.  Info Script Auto Install${NC}"
echo -e "${GREEN}61${WHITE}.  🔄 Auto Update Script${NC}"
echo ""
echo -e "${CYAN}╔══════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║${BOLD}${WHITE}                     Select Option [1-61]                        ${NC}${CYAN}║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════════╝${NC}"
echo ""
read -p "$(echo -e "${BOLD}${YELLOW}Enter your choice: ${NC}")" menu
echo -e ""
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
addhost
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
61)
autoupdate
;;
*)
clear
menu
;;
esac
