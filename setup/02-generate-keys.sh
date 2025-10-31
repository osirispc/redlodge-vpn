#!/bin/bash
# ===================================================
#  Red Lodge VPN – Key Generator
#  Creates server and client WireGuard keys.
# ===================================================

set -e
KEY_DIR="/etc/wireguard"
PEER_DIR="$(pwd)/wg/peers"

echo "🪄 Generating WireGuard keys..."

# make sure we’re root or have sudo
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo bash $0)"
  exit 1
fi

mkdir -p "$KEY_DIR" "$PEER_DIR"

# --- Server keys ---
if [ ! -f "$KEY_DIR/server_private.key" ]; then
  wg genkey | tee "$KEY_DIR/server_private.key" | wg pubkey | tee "$KEY_DIR/server_public.key" >/dev/null
  chmod 600 "$KEY_DIR/server_private.key"
  echo "✅  Server keys created in $KEY_DIR"
else
  echo "ℹ️  Server keys already exist; skipping."
fi

# --- Optional client key creation ---
read -p "Generate a client keypair now? (y/n): " ans
if [[ "$ans" =~ ^[Yy]$ ]]; then
  read -p "Client name (no spaces): " name
  wg genkey | tee "$PEER_DIR/${name}_private.key" | wg pubkey | tee "$PEER_DIR/${name}_public.key" >/dev/null
  echo "✅  Client keys saved under wg/peers/${name}_*.key"
else
  echo "Skipping client key creation for now."
fi

echo "Done. You can view the public keys with: cat $KEY_DIR/server_public.key"
