#!/bin/bash

# Color definitions for service status
GREEN="[92m"
YELLOW="[93m"
RED="[91m"
WHITE="[97m"
BOLD="[1m"
RESET="[0m"

# Function to check service status
check_service_status() {
    local service_name=$1
    local display_name=$2
    local port=$3
    
    if systemctl is-active --quiet "$service_name" 2>/dev/null; then
        if [ -n "$port" ]; then
            echo -e "${GREEN}[ACTIVE]${RESET}  ${display_name} (Port: ${port})"
        else
            echo -e "${GREEN}[ACTIVE]${RESET}  ${display_name}"
        fi
    elif systemctl is-enabled --quiet "$service_name" 2>/dev/null; then
        if [ -n "$port" ]; then
            echo -e "${YELLOW}[STOPPED]${RESET} ${display_name} (Port: ${port})"
        else
            echo -e "${YELLOW}[STOPPED]${RESET} ${display_name}"
        fi
    else
        if [ -n "$port" ]; then
            echo -e "${RED}[OFF]${RESET}     ${display_name} (Port: ${port})"
        else
            echo -e "${RED}[OFF]${RESET}     ${display_name}"
        fi
    fi
}

# Function to display running services
show_running_services() {
    echo -e "${WHITE}${BOLD}Service Status${RESET}"
    echo "=================================================================="
    
    # Core SSH & Web Services
    echo -e "${WHITE}Core Services:${RESET}"
    check_service_status "ssh" "SSH Server" "22, 2253"
    check_service_status "nginx" "Nginx Web Server" "89"
    check_service_status "squid" "Squid Proxy" "3128, 8080"
    check_service_status "fail2ban" "Fail2Ban Security"
    echo ""
    
    # OpenVPN & Stunnel
    echo -e "${WHITE}OpenVPN & SSL Services:${RESET}"
    check_service_status "openvpn" "OpenVPN" "TCP 1194, UDP 2200, SSL 990"
    check_service_status "stunnel4" "Stunnel SSL" "443, 445"
    check_service_status "dropbear" "Dropbear SSH" "443, 109, 143"
    echo ""
    
    # VPN Protocols
    echo -e "${WHITE}VPN Protocols:${RESET}"
    check_service_status "xl2tpd" "L2TP/IPsec" "1701"
    check_service_status "pptpd" "PPTP VPN" "1732"
    check_service_status "sstp" "SSTP VPN" "444"
    check_service_status "wg-quick@wg0" "WireGuard" "7070"
    echo ""
    
    # Advanced Tunneling
    echo -e "${WHITE}Advanced Tunneling:${RESET}"
    check_service_status "shadowsocks-libev" "Shadowsocks" "2443-2543, 3443-3543"
    check_service_status "shadowsocksr" "ShadowsocksR" "1443-1543"
    check_service_status "trojan-go" "Trojan GO" "2087"
    echo ""
    
    # XRAY Services
    echo -e "${WHITE}XRAY Services:${RESET}"
    check_service_status "xray" "XRAY Core" "8443, 80, 2083"
    echo ""
    
    # Websocket & Additional
    echo -e "${WHITE}Additional Services:${RESET}"
    check_service_status "ws-tls" "Websocket TLS" "443"
    check_service_status "ws-nontls" "Websocket HTTP" "8880"
    check_service_status "ws-ovpn" "Websocket OpenVPN" "2086"
    echo ""

    # OHP Services
    echo -e "${WHITE}OHP Services:${RESET}"
    check_service_status "ohp-ssh" "OHP SSH" "8181"
    check_service_status "ohp-dropbear" "OHP Dropbear" "8282"
    check_service_status "ohp-openvpn" "OHP OpenVPN" "8383"
    echo ""

    # Proxy & Load Balancer
    echo -e "${WHITE}Proxy & Load Balancer:${RESET}"
    check_service_status "haproxy" "HAProxy" "80, 443"
    echo ""
    
    echo "=================================================================="
    echo ""
}
