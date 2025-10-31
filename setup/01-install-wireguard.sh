#!/bin/bash
# ================================================
#  Red Lodge VPN - WireGuard Install Script
#  Author: Osiris Ortiz
#  Description: Installs WireGuard, dnsmasq, nginx,
#               iptables-persistent on Ubuntu 24.04
# ================================================

set -e

echo "🦉 Starting Red Lodge WireGuard setup..."

sudo apt update
sudo apt install -y wireguard qrencode dnsmasq nginx iptables-persistent python3

# enable IP forwarding
echo 'net.ipv4.ip_forward=1' | sudo tee /etc/sysctl.d/99-redlodge.conf >/dev/null
sudo sysctl --system

echo "✅ Base packages installed and IP forwarding enabled."
echo "Next step: create wg0.conf and firewall rules."
