#!/bin/bash
# ================================================
#  Red Lodge VPN - Access Grant Script
#  Allows a specific VPN client IP to reach Jellyfin
# ================================================

set -e

CLIENT_IP="$1"
JELLYFIN_IP="192.168.199.193"
JELLYFIN_PORT="8096"

if [ -z "$CLIENT_IP" ]; then
  echo "Usage: $0 <client_ip>"
  exit 1
fi

# Add UFW rule
ufw allow from "$CLIENT_IP" to "$JELLYFIN_IP" port "$JELLYFIN_PORT" comment "RedLodge: temporary access for $CLIENT_IP"

echo "✅ Access granted to Jellyfin for $CLIENT_IP"
