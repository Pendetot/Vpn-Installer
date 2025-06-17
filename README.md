<p align="center">
<img src="https://readme-typing-svg.herokuapp.com?color=%2336BCF7&center=true&vCenter=true&lines=A+T+H+E+N+A+P+R+O+J+E+C+T" />
</p>

<p align='center'>
width="120" alt="AthenaProject"/>
</p>

<h1 align="center">🚀 AthenaProject VPN Installer</h1>
<h3 align="center">Premium Auto Script Install All VPN Services</h3>
<h4 align="center">Recode By AthenaProject | Powered by MasVentot</h4>

<p align="center">
<img src="https://img.shields.io/badge/Version-2.0.0-blue.svg">
<img src="https://img.shields.io/badge/License-MIT-green.svg">
<img src="https://img.shields.io/badge/Platform-Linux-orange.svg">
</p>

---

## 📋 Supported Operating Systems

<p align="center">
<img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%209&message=Stretch&color=purple">
<img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%2010&message=Buster&color=purple">
<img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2018&message=LTS&color=red">
<img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2020&message=LTS&color=red">
</p>

## 🛠️ Services Included

<details>
<summary><b>🔐 SSH & VPN Services</b></summary>

- **SSH OpenSSH** - Port: 22, 2253
- **SSH Dropbear** - Port: 443, 109, 143, 1153  
- **OpenVPN** - TCP: 1194, UDP: 2200, SSL: 990
- **Stunnel5** - Port: 443, 445, 777
- **SSLH** - Multi-protocol support
- **BadVPN** - Port: 7100, 7200, 7300

</details>

<details>
<summary><b>🌐 WebSocket & Proxy</b></summary>

- **SSH WebSocket TLS** - Port: 443
- **SSH WebSocket HTTP** - Port: 8880  
- **OpenVPN WebSocket** - Port: 2086
- **SSH Over DNS (SlowDNS)** - All SSH Ports
- **OHP (Open HTTP Puncher)** - SSH: 8181, Dropbear: 8282, OpenVPN: 8383

</details>

<details>
<summary><b>⚡ XRAY Services</b></summary>

- **XRAY VMESS** - TLS: 8443, Non-TLS: 80
- **XRAY VLESS** - TLS: 8443, Non-TLS: 80  
- **XRAY TROJAN** - Port: 2083
- **XRAY VMESS gRPC** - Port: 1180, 3380
- **XRAY VLESS gRPC** - Port: 2280, 4480

</details>

<details>
<summary><b>🔒 Additional VPN Protocols</b></summary>

- **WireGuard** - Port: 7070
- **L2TP/IPSec VPN** - Port: 1701
- **PPTP VPN** - Port: 1732  
- **SSTP VPN** - Port: 444
- **Shadowsocks** - Various ports
- **ShadowsocksR** - Port: 1443-1543
- **Trojan Go** - Port: 2087

</details>

## 🚀 Quick Installation

### Prerequisites
- Fresh VPS with **minimum 1GB RAM**
- **Root access** required
- Supported OS: Debian 9/10, Ubuntu 18.04/20.04

### Step 1: Update System
```bash
apt-get update && apt-get upgrade -y && update-grub && sleep 2 && reboot
```

### Step 2: Enable Root Access
```bash
sudo su
cd ~
```

### Step 3: Configure Root Login (For Cloud VPS)
```bash
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
service ssh restart
passwd root
```

### Step 4: Install AthenaProject VPN
```bash
wget -O setup.sh https://raw.githubusercontent.com/Pendetot/Vpn-Installer/main/setup.sh && chmod +x setup.sh && ./setup.sh
```

## 🎯 Features

- ✅ **Auto Installation** - One command setup
- ✅ **Multi-Protocol Support** - 15+ VPN protocols
- ✅ **Auto Update** - Automatic script updates from GitHub
- ✅ **User Management** - Create, delete, extend accounts
- ✅ **Monitoring Tools** - Check active users, bandwidth usage
- ✅ **Backup & Restore** - Full data backup functionality
- ✅ **Auto Reboot** - Scheduled system maintenance
- ✅ **Fail2Ban Protection** - Security against brute force
- ✅ **Custom Domain** - Use your own domain
- ✅ **WebSocket Support** - Bypass network restrictions

## 📊 System Information

| Feature | Status |
|---------|--------|
| **Timezone** | Asia/Jakarta (GMT +7) |
| **Fail2Ban** | ✅ Enabled |
| **DFlate** | ✅ Enabled |
| **IPTables** | ✅ Enabled |
| **Auto-Reboot** | ✅ Enabled (05:00, 12:00, 18:00, 00:00 GMT+7) |
| **IPv6** | ❌ Disabled |
| **Auto Delete Expired** | ✅ Enabled |

## 🔧 Post Installation

After installation, access the menu by typing:
```bash
menu
```

## 🆘 Troubleshooting

<details>
<summary><b>SSLH Issues</b></summary>

If SSLH service fails:
```bash
systemctl stop ws-tls
echo "sslh:x:109:114::/nonexistent:/usr/sbin/nologin" >> /etc/passwd
systemctl start sslh
systemctl start ws-tls
reboot
```

</details>

## 📞 Support

- **GitHub**: [Pendetot](https://github.com/Pendetot)
- **Issues**: [Report Here](https://github.com/Pendetot/Vpn-Installer/issues)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Credits

- **AthenaProject Team**
- **MasVentot** - Project Lead
- **Original Contributors**

---

<p align="center">
<img src="https://komarev.com/ghpvc/?username=Pendetot&color=blue">
</p>

<p align="center">
<b>⭐ Star this repository if you find it helpful!</b>
</p>
