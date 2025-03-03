#!/bin/bash
# AgiSiberShield Advanced Linux Security Script

echo "🔒 Applying advanced security settings for Linux..."

# Update system and remove unnecessary packages
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y

# Set strong password policy
echo "minlen = 12" | sudo tee -a /etc/security/pwquality.conf
echo "dcredit = -1" | sudo tee -a /etc/security/pwquality.conf

# Enable firewall and logging
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo ufw logging on

# Kernel Hardening
echo "kernel.randomize_va_space = 2" | sudo tee -a /etc/sysctl.conf
echo "net.ipv4.conf.all.rp_filter = 1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Disable root login and enforce SSH key authentication
sudo passwd -l root
sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

echo "✅ Linux hardening completed!"
