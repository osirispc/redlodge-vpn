#!/bin/bash
# ===================================================
#  Red Lodge VPN – Smart Key & Config Generator
#  Creates WireGuard keys and assigns static IPs.
# ===================================================

set -e
WG_DIR="/etc/wireguard"
PEER_DIR="$(pwd)/wg/peers"
SERVER_CONF="$(pwd)/wg/wg0.conf"
SUBNET_BASE="10.10.0"

echo "🪄 Generating WireGuard peer..."

# --- Ensure root privileges ---
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo bash $0)"
  exit 1
fi

mkdir -p "$WG_DIR" "$PEER_DIR"

# --- Check or create server keys ---
if [ ! -f "$WG_DIR/server_private.key" ]; then
  echo "🔑 Creating server keys..."
  wg genkey | tee "$WG_DIR/server_private.key" | wg pubkey | tee "$WG_DIR/server_public.key" >/dev/null
  chmod 600 "$WG_DIR/server_private.key"
fi

# --- Ask for new client name ---
read -p "Client name (no spaces): " NAME
CLIENT_PRIVATE="$PEER_DIR/${NAME}_private.key"
CLIENT_PUBLIC="$PEER_DIR/${NAME}_public.key"
CLIENT_CONF="$PEER_DIR/${NAME}.conf"

# --- Generate keys ---
wg genkey | tee "$CLIENT_PRIVATE" | wg pubkey | tee "$CLIENT_PUBLIC" >/dev/null
chmod 600 "$CLIENT_PRIVATE"

# --- Determine next free IP ---
LAST_IP=$(grep -oE "${SUBNET_BASE}\.[0-9]+" "$SERVER_CONF" 2>/dev/null | awk -F'.' '{print $4}' | sort -n | tail -1)
if [ -z "$LAST_IP" ]; then
  NEXT_IP=2
else
  NEXT_IP=$((LAST_IP + 1))
fi
CLIENT_IP="${SUBNET_BASE}.${NEXT_IP}"
echo "📡 Assigned IP: $CLIENT_IP"

# --- Add to server config ---
echo -e "\n[Peer]\n# ${NAME}\nPublicKey = $(cat $CLIENT_PUBLIC)\nAllowedIPs = ${CLIENT_IP}/32" | tee -a "$SERVER_CONF"

# --- Create client config ---
SERVER_PUB=$(cat "$WG_DIR/server_public.key")
SERVER_ENDPOINT="your.public.ip:51234"
cat > "$CLIENT_CONF" <<EOF
# ================================================
#  Red Lodge VPN - Client Config for ${NAME}
# ================================================
[Interface]
Address = ${CLIENT_IP}/32
PrivateKey = $(cat $CLIENT_PRIVATE)
DNS = 10.10.0.1

[Peer]
PublicKey = ${SERVER_PUB}
Endpoint = ${SERVER_ENDPOINT}
AllowedIPs = 10.10.0.1/32, 192.168.199.193/32
PersistentKeepalive = 25
EOF

echo "✅ Peer ${NAME} created!"
echo "🔑 Config saved to ${CLIENT_CONF}"

