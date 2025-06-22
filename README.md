# AthenaProject VPN Installer

**Script simpel buat install semua layanan VPN di server kamu.**

![Version](https://img.shields.io/badge/Version-2.0.0-blue.svg) ![License](https://img.shields.io/badge/License-MIT-green.svg) ![OS](https://img.shields.io/badge/OS-Ubuntu%20%7C%20Debian-orange.svg)

## 🚀 Cara Cepat Install

```bash
wget -O setup.sh https://raw.githubusercontent.com/Pendetot/Vpn-Installer/main/setup.sh
chmod +x setup.sh
./setup.sh
```

## 🎯 Kebutuhan

- **OS**: Ubuntu 18.04/20.04/22.04 atau Debian 9/10/11
- **RAM**: Minimal 1GB
- **Akses root**
- **VPS fresh** biar gak bentrok sama konfigurasi lain

## 🔥 Layanan yang Didukung

### Protokol VPN
- **SSH & OpenVPN**
- **WireGuard**
- **L2TP/IPSec**
- **PPTP**
- **SSTP**

### Tunneling Lanjutan
- **XRAY** (VMESS, VLESS, Trojan)
- **Shadowsocks & ShadowsocksR**
- **Trojan-Go**

### Fitur Tambahan
- WebSocket untuk SSH/OpenVPN
- SlowDNS
- gRPC support
- Backup & restore otomatis
- Pilihan banyak port

## 🔧 Langkah Install

1. **Update sistem**
   ```bash
   apt update && apt upgrade -y && reboot
   ```
2. **Jalankan installer**
   ```bash
   wget -O setup.sh https://raw.githubusercontent.com/Pendetot/Vpn-Installer/main/setup.sh
   chmod +x setup.sh
   ./setup.sh
   ```
3. **Buka menu**
   ```bash
   menu
   ```

## ⚙️ Port Default

| Layanan | Port |
|---------|------|
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

## ✨ Fitur Keren

- Tampilan menu simpel
- Buat/hapus/perpanjang akun gampang
- Support banyak protokol
- WebSocket ready
- Backup otomatis
- Monitoring koneksi real time
- Auto update tiap login
- Fitur keamanan: Fail2ban, iptables, auto reboot
- API bawaan di port 3000 (token ada di `/root/api_token`)

## 🔒 Keamanan

- Fail2Ban buat cegah brute force
- IPTables sebagai firewall
- Sistem auto reboot
- Akun kadaluarsa dihapus otomatis
- SSL/TLS untuk koneksi aman

## 📱 Cara Pakai

Setelah install, cukup ketik `menu` buat ngelihat semua opsi. Ada juga command `api-info` buat nunjukin detail API (domain, port, dan token).

## ❓ Troubleshooting

Beberapa masalah umum:
1. **SSLH error**
   ```bash
   systemctl stop ws-tls
   echo "sslh:x:109:114::/nonexistent:/usr/sbin/nologin" >> /etc/passwd
   systemctl start sslh
   systemctl start ws-tls
   ```
2. **Cek status service**
   ```bash
   systemctl status <nama-service>
   ```

## 🤝 Dukungan

Kalau ada masalah atau mau request fitur, buka saja issue di GitHub.

## 📄 Lisensi

Proyek ini pakai lisensi MIT.

---

<p align="center">Dibuat dengan ❤️ buat komunitas VPN</p>
