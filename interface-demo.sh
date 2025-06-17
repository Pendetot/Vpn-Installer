#!/bin/bash

# ==========================================
# Athena Project - Interface Demo
# Showcase the beautiful interface design
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

# Demo functions
print_banner() {
    clear
    echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${WHITE}                        ATHENA PROJECT                        ${CYAN}║${NC}"
    echo -e "${CYAN}║${YELLOW}                   Custom Domain Setup                       ${CYAN}║${NC}"
    echo -e "${CYAN}║${GREEN}                  Enhanced by Athena Team                    ${CYAN}║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
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

demo_loading() {
    local text="$1"
    local chars="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
    
    for i in {1..20}; do
        local char_index=$((i % ${#chars}))
        printf "\r${CYAN}${chars:$char_index:1}${NC} $text"
        sleep 0.1
    done
    printf "\r${GREEN}✓${NC} $text\n"
}

demo_interface() {
    print_banner
    
    print_separator
    echo -e "${WHITE}${BOLD}Demo: Custom Domain Setup Interface${NC}"
    echo ""
    
    print_info "This is a demonstration of the enhanced interface"
    echo ""
    
    demo_loading "Initializing Athena Project interface..."
    echo ""
    
    print_separator
    echo -e "${WHITE}${BOLD}Domain Configuration${NC}"
    echo -e "${CYAN}Please enter your custom domain:${NC}"
    echo -e "${YELLOW}Examples: yourdomain.com, subdomain.yourdomain.com${NC}"
    echo ""
    echo -e "${GREEN}Domain: ${NC}example.com ${CYAN}(demo input)${NC}"
    echo ""
    
    demo_loading "Validating domain format..."
    print_success "Domain validation successful!"
    echo ""
    
    print_separator
    echo -e "${WHITE}${BOLD}Configuring Domain Settings${NC}"
    echo ""
    
    demo_loading "Getting server IP address..."
    print_info "Server IP: ${GREEN}192.168.1.100${NC} ${CYAN}(demo IP)${NC}"
    
    demo_loading "Creating domain configuration..."
    print_success "Domain configuration saved!"
    print_info "Domain: ${GREEN}example.com${NC}"
    print_info "Configuration files updated successfully"
    echo ""
    
    print_separator
    echo -e "${WHITE}${BOLD}DNS Configuration Instructions${NC}"
    echo ""
    echo -e "${YELLOW}Please configure your DNS records:${NC}"
    echo ""
    echo -e "${CYAN}Record Type: ${WHITE}A${NC}"
    echo -e "${CYAN}Name/Host: ${WHITE}example.com${NC}"
    echo -e "${CYAN}Value/IP: ${WHITE}192.168.1.100${NC}"
    echo -e "${CYAN}TTL: ${WHITE}300 (or default)${NC}"
    echo ""
    print_warning "Make sure DNS records are properly configured before proceeding!"
    echo ""
    
    print_separator
    echo -e "${GREEN}${BOLD}Domain Setup Complete!${NC}"
    echo ""
    echo -e "${WHITE}Your custom domain: ${GREEN}example.com${NC}"
    echo -e "${WHITE}Next steps:${NC}"
    echo -e "${CYAN}1.${NC} Configure DNS records as shown above"
    echo -e "${CYAN}2.${NC} Wait for DNS propagation (5-30 minutes)"
    echo -e "${CYAN}3.${NC} SSL certificates will be generated automatically"
    echo ""
    print_info "Configuration saved to: /etc/xray/domain"
    print_separator
    echo ""
    echo -e "${PURPLE}${BOLD}🎉 Demo Complete - Athena Project Interface 🎉${NC}"
    echo -e "${WHITE}This beautiful interface replaces the old automatic subdomain system${NC}"
    echo -e "${CYAN}Users can now input their own custom domains with full validation${NC}"
    echo ""
}

# Run demo
demo_interface
