#!/bin/bash

# ==========================================
# Athena Project - Custom Domain Setup
# Enhanced Domain Configuration Script
# ==========================================

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Animation and UI functions
print_banner() {
    clear
    echo -e "${CYAN}${BOLD}ATHENA PROJECT - Domain Setup${NC}"
    echo -e "${CYAN}----------------------------------------${NC}"
    echo ""
}

print_separator() {
    echo -e "${CYAN}----------------------------------------${NC}"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

loading_animation() {
    local text="$1"
    local duration="$2"
    local chars="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
    local delay=0.1
    local iterations=$((duration * 10))
    
    for ((i=0; i<iterations; i++)); do
        local char_index=$((i % ${#chars}))
        printf "\r${CYAN}${chars:$char_index:1}${NC} $text"
        sleep $delay
    done
    printf "\r${GREEN}✓${NC} $text\n"
}

validate_domain() {
    local domain="$1"
    
    # Basic domain format validation
    if [[ ! "$domain" =~ ^[a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?(\.[a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)*$ ]]; then
        return 1
    fi
    
    # Check if domain resolves
    if ! nslookup "$domain" >/dev/null 2>&1; then
        return 2
    fi
    
    return 0
}

get_user_domain() {
    local domain=""
    local valid=false
    
    while [ "$valid" = false ]; do
        print_separator
        echo -e "${WHITE}${BOLD}Domain Configuration${NC}"
        echo -e "${CYAN}Please enter your custom domain:${NC}"
        echo -e "${YELLOW}Examples: yourdomain.com, subdomain.yourdomain.com${NC}"
        echo ""
        read -p "$(echo -e ${GREEN}Domain: ${NC})" domain
        
        if [ -z "$domain" ]; then
            print_error "Domain cannot be empty!"
            echo ""
            continue
        fi
        
        echo ""
        loading_animation "Validating domain format..." 2
        
        validate_domain "$domain"
        case $? in
            0)
                print_success "Domain validation successful!"
                valid=true
                ;;
            1)
                print_error "Invalid domain format!"
                print_info "Please enter a valid domain (e.g., example.com)"
                echo ""
                ;;
            2)
                print_warning "Domain does not resolve to any IP address"
                echo -e "${YELLOW}Do you want to continue anyway? (y/n):${NC} "
                read -r continue_anyway
                if [[ "$continue_anyway" =~ ^[Yy]$ ]]; then
                    print_info "Continuing with unresolved domain..."
                    valid=true
                else
                    echo ""
                fi
                ;;
        esac
    done
    
    echo "$domain"
}

get_user_ns() {
    local ns=""
    local valid=false

    while [ "$valid" = false ]; do
        print_separator
        echo -e "${WHITE}${BOLD}Nameserver Configuration${NC}"
        echo -e "${CYAN}Please enter your NS domain:${NC}"
        echo -e "${YELLOW}Example: ns.yourdomain.com${NC}"
        echo ""
        read -p "$(echo -e ${GREEN}NS Domain: ${NC})" ns

        if [ -z "$ns" ]; then
            print_error "NS domain cannot be empty!"
            echo ""
            continue
        fi

        if validate_domain "$ns"; then
            print_success "NS domain format is valid!"
            valid=true
        else
            print_error "Invalid domain format!"
            echo ""
        fi
    done

    echo "$ns"
}

setup_domain_config() {
    local domain="$1"
    local ns="$2"
    local ip=$(wget -qO- icanhazip.com)
    
    print_separator
    echo -e "${WHITE}${BOLD}Configuring Domain Settings${NC}"
    echo ""
    
    loading_animation "Getting server IP address..." 1
    print_info "Server IP: ${GREEN}$ip${NC}"
    
    loading_animation "Creating domain configuration..." 2
    
    # Clean up old configurations
    rm -f /root/domain
    rm -f /etc/v2ray/domain
    rm -f /etc/xray/domain
    rm -rf /etc/xray/domain
    rm -rf /root/nsdomain
    rm -rf /var/lib/crot/ipvps.conf
    
    # Create directories
    mkdir -p /usr/bin/xray
    mkdir -p /usr/bin/v2ray
    mkdir -p /etc/xray
    mkdir -p /etc/v2ray
    mkdir -p /var/lib/crot
    
    # Set domain configurations
    echo "$domain" > /root/domain
    echo "$domain" > /etc/xray/domain
    echo "$domain" > /etc/v2ray/domain
    echo "$ns" > /root/nsdomain
    echo "IP=$domain" > /var/lib/crot/ipvps.conf
    
    print_success "Domain configuration saved!"
    print_info "Domain: ${GREEN}$domain${NC}"
    print_info "NS: ${GREEN}$ns${NC}"
    print_info "Configuration files updated successfully"
}

show_dns_instructions() {
    local domain="$1"
    local ns="$2"
    local ip=$(wget -qO- icanhazip.com)
    
    print_separator
    echo -e "${WHITE}${BOLD}DNS Configuration Instructions${NC}"
    echo ""
    echo -e "${YELLOW}Please configure your DNS records:${NC}"
    echo ""
    echo -e "${CYAN}Record Type: ${WHITE}A${NC}"
    echo -e "${CYAN}Name/Host: ${WHITE}$domain${NC}"
    echo -e "${CYAN}Value/IP: ${WHITE}$ip${NC}"
    echo -e "${CYAN}TTL: ${WHITE}300${NC}"
    echo ""
    echo -e "${CYAN}Record Type: ${WHITE}NS${NC}"
    echo -e "${CYAN}Name/Host: ${WHITE}$ns${NC}"
    echo -e "${CYAN}Value: ${WHITE}$domain${NC}"
    echo ""
    print_warning "Make sure DNS records are properly configured before proceeding!"
}

main() {
    # Check if running as root
    if [ "${EUID}" -ne 0 ]; then
        print_error "This script must be run as root!"
        exit 1
    fi
    
    print_banner
    
    # Get custom domain from user
    CUSTOM_DOMAIN=$(get_user_domain)

    # Get NS domain from user
    CUSTOM_NS=$(get_user_ns)

    # Setup domain configuration
    setup_domain_config "$CUSTOM_DOMAIN" "$CUSTOM_NS"

    # Show DNS instructions
    show_dns_instructions "$CUSTOM_DOMAIN" "$CUSTOM_NS"
    
    print_separator
    echo -e "${GREEN}${BOLD}Domain Setup Complete!${NC}"
    echo ""
    echo -e "${WHITE}Domain : ${GREEN}$CUSTOM_DOMAIN${NC}"
    echo -e "${WHITE}NS     : ${GREEN}$CUSTOM_NS${NC}"
    echo -e "${WHITE}Next steps:${NC}"
    echo -e "${CYAN}1.${NC} Configure DNS records as shown above"
    echo -e "${CYAN}2.${NC} Wait for DNS propagation (5-30 minutes)"
    echo -e "${CYAN}3.${NC} SSL certificates will be generated automatically"
    echo ""
    print_info "Configuration saved to: /etc/xray/domain"
    print_separator
    
    # Ask if user wants to continue with installation
    echo ""
    echo -e "${YELLOW}Continue with the installation? (y/n):${NC} "
    read -r continue_install
    if [[ ! "$continue_install" =~ ^[Yy]$ ]]; then
        print_info "Installation paused. Run this script again when ready."
        exit 0
    fi
}

# Run main function
main "$@"
