#!/bin/bash
# Mod By SL
#echo "$crot    ALL=(ALL:ALL) ALL" >> /etc/sudoers;
wget -qO- -O /etc/ssh/sshd_config https://raw.githubusercontent.com/Pendetot/Vpn-Installer/main/sshd_config;
systemctl restart sshd;
clear;
echo -e "Masukkan Password:";
read -e pwe;
usermod -p `perl -e "print crypt("$pwe","Q4")"` root;
clear;
printf "Mohon Simpan Informasi Akun VPS Ini"
printf "============================================\n"
printf "Akun Root (Akun Utama)\n"
printf "Username   = root\n"
printf "Password   = \n"
printf "============================================\n"
echo "";
exit;
