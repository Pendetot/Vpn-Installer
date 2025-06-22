#!/bin/bash
DOMAIN=$(cat /root/domain 2>/dev/null)
PORT=3000
TOKEN=$(cat /root/api_token 2>/dev/null)

clear
echo "============================"
echo "      VPN API INFO"
echo "============================"
echo "Domain : $DOMAIN"
echo "Port   : $PORT"
echo "Token  : $TOKEN"
echo ""
echo "Refer to /root/API-README.md for examples."
