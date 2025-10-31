#!/bin/bash
# ================================================
#  Red Lodge VPN - Access Revoke Script
#  Removes UFW rules for a VPN client IP
# ================================================

set -e

CLIENT_IP="$1"

if [ -z "$CLIENT_IP" ]; then
  echo "Usage: $0 <client_ip>"
  exit 1
fi

ufw delete allow from "$CLIENT_IP" comment "RedLodge: temporary access for $CLIENT_IP" || echo "ℹ️  No rule found for $CLIENT_IP"
echo "🔒 Access revoked for $CLIENT_IP"
