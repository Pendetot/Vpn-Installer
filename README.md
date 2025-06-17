# AthenaProject VPN Installer

<p align="center">
<img src="https://readme-typing-svg.herokuapp.com?color=%2336BCF7&center=true&vCenter=true&lines=A+T+H+E+N+A+P+R+O+J+E+C+T" />
</p>

<h2 align="center">Auto Script Install All VPN Services</h2>

<p align="center">
<img src="https://img.shields.io/badge/Version-2.0.0-blue.svg">
<img src="https://img.shields.io/badge/License-MIT-green.svg">
<img src="https://img.shields.io/badge/OS-Ubuntu%20|%20Debian-orange.svg">
</p>

## 🚀 Quick Installation

```bash
wget -O setup.sh https://raw.githubusercontent.com/Pendetot/Vpn-Installer/main/setup.sh && chmod +x setup.sh && ./setup.sh
```

## 📋 Requirements

- **OS**: Ubuntu 18.04/20.04/22.04 or Debian 9/10/11
- **RAM**: Minimum 1GB
- **Root Access**: Required
- **Fresh VPS**: Recommended

## 🛠️ Supported Services

### VPN Protocols
- **SSH & OpenVPN** - Secure Shell and OpenVPN tunneling
- **WireGuard** - Modern, fast VPN protocol
- **L2TP/IPSec** - Layer 2 Tunneling Protocol
- **PPTP** - Point-to-Point Tunneling Protocol
- **SSTP** - Secure Socket Tunneling Protocol

### Advanced Tunneling
- **XRAY** - VMESS, VLESS, Trojan protocols
- **Shadowsocks** - With various plugins (obfs, v2ray, xray)
- **ShadowsocksR** - Enhanced Shadowsocks
- **Trojan-Go** - Advanced Trojan implementation

### Additional Features
- **WebSocket** - SSH/OpenVPN over WebSocket
- **SlowDNS** - SSH over DNS tunneling
- **gRPC** - High-performance RPC framework support
- **Auto Backup/Restore** - Data management
- **Multi-port Support** - Various port configurations

## 🔧 Installation Steps

1. **Update System**
   ```bash
   apt update && apt upgrade -y && reboot
   ```

2. **Run Installation**
   ```bash
   wget -O setup.sh https://raw.githubusercontent.com/Pendetot/Vpn-Installer/main/setup.sh
   chmod +x setup.sh
   ./setup.sh
   ```

3. **Access Menu**
   ```bash
   menu
   ```

## 📊 Default Ports

| Service | Ports |
|---------|-------|
| SSH | 22, 2253 |
| Dropbear | 443, 109, 143 |
| OpenVPN | TCP 1194, UDP 2200, SSL 990 |
| Stunnel5 | 443, 445, 777 |
| WireGuard | 7070 |
| XRAY VMESS | 8443, 80 |
| XRAY VLESS | 8443, 80 |
| XRAY Trojan | 2083 |
| Shadowsocks | 2443-2543, 3443-3543 |
| L2TP/IPSec | 1701 |
| PPTP | 1732 |
| SSTP | 444 |

## 🎯 Features

- ✅ **Modern UI** - Clean, minimalist menu interface
- ✅ **Auto Management** - Account creation, deletion, renewal
- ✅ **Multi-Protocol** - Support for all major VPN protocols
- ✅ **WebSocket Support** - Bypass network restrictions
- ✅ **Auto Backup** - Scheduled data backup and restore
- ✅ **Monitoring** - Real-time connection monitoring
- ✅ **Auto Updates** - Keep services up to date
- ✅ **Security** - Fail2ban, iptables, auto-reboot

## 🔒 Security Features

- **Fail2Ban** - Intrusion prevention
- **IPTables** - Firewall configuration
- **Auto-Reboot** - System maintenance
- **Account Expiry** - Automatic cleanup
- **SSL/TLS** - Encrypted connections

## 📱 Management

Access the management menu anytime by typing:
```bash
menu
```

## 🆘 Troubleshooting

### Common Issues

1. **SSLH Not Working**
   ```bash
   systemctl stop ws-tls
   echo "sslh:x:109:114::/nonexistent:/usr/sbin/nologin" >> /etc/passwd
   systemctl start sslh
   systemctl start ws-tls
   ```

2. **Service Status Check**
   ```bash
   systemctl status [service-name]
   ```

## 📞 Support

- **GitHub**: [Issues](https://github.com/Pendetot/Vpn-Installer/issues)
- **Documentation**: [Wiki](https://github.com/Pendetot/Vpn-Installer/wiki)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ⭐ Star History

If this project helped you, please give it a ⭐!

---

<p align="center">Made with ❤️ for the VPN community</p>
