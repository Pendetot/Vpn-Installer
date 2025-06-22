# VPN Installer REST API

This simple REST API allows you to create VPN accounts remotely.
The API listens on port **3000** on all interfaces (`0.0.0.0`).
Use the domain you set during installation to access it.

Authentication uses a bearer token stored in `/root/api_token`.

## Start/Status
The API server runs as a systemd service named `vpn-api.service`.
It starts automatically after installation:

```bash
systemctl status vpn-api.service
```

## Example Request
```bash
TOKEN=$(cat /root/api_token)
curl -X POST \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"username":"test","password":"test123","days":1}' \
  http://yourdomain.com:3000/ssh
```

Endpoints correspond to service names:
- `/ssh` create SSH account
- `/wireguard` create WireGuard account
- `/sstp` create SSTP account
- `/shadowsocks` create Shadowsocks account
- `/ssr` create ShadowsocksR account
- `/trojongo` create TrojanGO account
- `/vless` create VLESS account
- `/vmess` create VMESS account
- `/trojan` create Trojan account

The JSON response contains the script output.
