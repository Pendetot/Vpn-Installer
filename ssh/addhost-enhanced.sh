#!/bin/bash

# ==========================================
# Athena Project - Enhanced Domain Manager
# Beautiful Interface for Domain Changes
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

# Get current IP
MYIP=$(wget -qO- ipinfo.io/ip);

# UI Functions
print_banner() {
    clear
    echo -e "${PURPLE}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║${WHITE}                        ATHENA PROJECT                        ${PURPLE}║${NC}"
    echo -e "${PURPLE}║${CYAN}                    Domain Manager v2.0                      ${PURPLE}║${NC}"
    echo -e "${PURPLE}║${GREEN}                  Change Your Domain Easily                  ${PURPLE}║${NC}"
    echo -e "${PURPLE}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_separator() {
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
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

show_current_config() {
    print_separator
    echo -e "${WHITE}${BOLD}Current Configuration${NC}"
    echo ""
    
    if [ -f "/etc/xray/domain" ]; then
        local current_domain=$(cat /etc/xray/domain)
        print_info "Current Domain: ${GREEN}$current_domain${NC}"
    else
        print_warning "No domain configured yet"
    fi
    
    print_info "Server IP: ${GREEN}$MYIP${NC}"
    echo ""
}

validate_domain() {
    local domain="$1"
    
    # Basic domain format validation
    if [[ ! "$domain" =~ ^[a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?(\.[a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)*$ ]]; then
        return 1
    fi
    
    return 0
}

get_new_domain() {
    local domain=""
    local valid=false
    
    while [ "$valid" = false ]; do
        print_separator
        echo -e "${WHITE}${BOLD}Enter New Domain${NC}"
        echo -e "${CYAN}Please enter your new domain:${NC}"
        echo -e "${YELLOW}Examples: yourdomain.com, sub.yourdomain.com${NC}"
        echo ""
        read -p "$(echo -e ${GREEN}New Domain: ${NC})" domain
        
        if [ -z "$domain" ]; then
            print_error "Domain cannot be empty!"
            echo ""
            continue
        fi
        
        if validate_domain "$domain"; then
            print_success "Domain format is valid!"
            valid=true
        else
            print_error "Invalid domain format!"
            print_info "Please enter a valid domain (e.g., example.com)"
            echo ""
        fi
    done
    
    echo "$domain"
}

update_domain_config() {
    local new_domain="$1"
    
    print_separator
    echo -e "${WHITE}${BOLD}Updating Domain Configuration${NC}"
    echo ""
    
    # Update configuration files
    # overwrite stored domain with the new value
    printf 'IP=%s\n' "$new_domain" > /var/lib/crot/ipvps.conf
    rm -rf /etc/xray/domain
    echo "$new_domain" > /etc/xray/domain
    echo "$new_domain" > /root/domain
    
    print_success "Domain configuration updated!"
    print_info "New Domain: ${GREEN}$new_domain${NC}"
    
    # Show DNS instructions
    echo ""
    print_separator
    echo -e "${WHITE}${BOLD}DNS Configuration Required${NC}"
    echo ""
    echo -e "${YELLOW}Please update your DNS records:${NC}"
    echo ""
    echo -e "${CYAN}Record Type: ${WHITE}A${NC}"
    echo -e "${CYAN}Name/Host: ${WHITE}$new_domain${NC}"
    echo -e "${CYAN}Value/IP: ${WHITE}$MYIP${NC}"
    echo -e "${CYAN}TTL: ${WHITE}300${NC}"
    echo ""
    print_warning "DNS propagation may take 5-30 minutes"
}

regenerate_certificates() {
    print_separator
    echo -e "${WHITE}${BOLD}SSL Certificate Management${NC}"
    echo ""
    
    echo -e "${YELLOW}Do you want to regenerate SSL certificates? (y/n):${NC} "
    read -r regen_cert
    
    if [[ "$regen_cert" =~ ^[Yy]$ ]]; then
        print_info "Regenerating SSL certificates..."
        if command -v certv2ray &> /dev/null; then
            certv2ray
            print_success "SSL certificates regenerated!"
        else
            print_warning "Certificate regeneration script not found"
            print_info "Please run 'certv2ray' manually after DNS propagation"
        fi
    else
        print_info "Skipping certificate regeneration"
        print_warning "Remember to regenerate certificates after DNS propagation"
    fi
}

main() {
    # Check if running as root
    if [ "${EUID}" -ne 0 ]; then
        print_error "This script must be run as root!"
        exit 1
    fi
    
    print_banner
    show_current_config
    
    # Get new domain from user
    NEW_DOMAIN=$(get_new_domain)
    
    # Confirm the change
    print_separator
    echo -e "${WHITE}${BOLD}Confirm Domain Change${NC}"
    echo ""
    echo -e "${CYAN}New Domain: ${WHITE}$NEW_DOMAIN${NC}"
    echo -e "${CYAN}Server IP: ${WHITE}$MYIP${NC}"
    echo ""
    echo -e "${YELLOW}Are you sure you want to change the domain? (y/n):${NC} "
    read -r confirm
    
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        print_info "Domain change cancelled"
        exit 0
    fi
    
    # Update domain configuration
    update_domain_config "$NEW_DOMAIN"
    
    # Ask about certificate regeneration
    regenerate_certificates
    
    # Final success message
    print_separator
    echo -e "${GREEN}${BOLD}Domain Change Complete!${NC}"
    echo ""
    echo -e "${WHITE}Your new domain: ${GREEN}$NEW_DOMAIN${NC}"
    echo -e "${WHITE}Next steps:${NC}"
    echo -e "${CYAN}1.${NC} Update DNS records as shown above"
    echo -e "${CYAN}2.${NC} Wait for DNS propagation"
    echo -e "${CYAN}3.${NC} Test your services"
    echo ""
    print_info "Domain configuration saved successfully"
    print_separator
}

# Run main function
main "$@"
