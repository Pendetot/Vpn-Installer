#!/bin/bash

# Function to check service status
check_service_status() {
    local service_name=$1
    local display_name=$2
    
    if systemctl is-active --quiet "$service_name" 2>/dev/null; then
        echo -e "${GREEN}●${RESET} ${display_name}"
    elif systemctl is-enabled --quiet "$service_name" 2>/dev/null; then
        echo -e "${YELLOW}●${RESET} ${display_name} (stopped)"
    else
        echo -e "${RED}●${RESET} ${display_name} (not installed)"
    fi
}

# Function to display running services
show_running_services() {
    echo -e "${WHITE}${BOLD}📊 Service Status${RESET}"
    echo -e "${GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    
    # Core Services
    check_service_status "ssh" "SSH Server"
    check_service_status "openvpn" "OpenVPN"
    check_service_status "nginx" "Nginx Web Server"
    check_service_status "squid" "Squid Proxy"
    
    # VPN Services
    check_service_status "xl2tpd" "L2TP/IPsec"
    check_service_status "pptpd" "PPTP"
    check_service_status "sstp" "SSTP"
    check_service_status "wg-quick@wg0" "WireGuard"
    
    # Advanced Services
    check_service_status "shadowsocks-libev" "Shadowsocks"
    check_service_status "shadowsocksr" "ShadowsocksR"
    check_service_status "xray" "XRAY Core"
    check_service_status "trojan-go" "Trojan GO"
    
    # Additional Services
    check_service_status "stunnel4" "Stunnel SSL"
    check_service_status "dropbear" "Dropbear SSH"
    check_service_status "fail2ban" "Fail2Ban"
    
    echo ""
}
