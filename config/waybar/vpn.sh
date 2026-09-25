#!/usr/bin/env bash
# Waybar custom module: name(s) of the active VPN connection(s) known to
# NetworkManager (wireguard, openvpn/vpn plugins, tun). Prints nothing when
# no VPN is up, which hides the module.
names=$(nmcli -t -f NAME,TYPE connection show --active 2>/dev/null |
  awk -F: '$2 ~ /^(vpn|wireguard|tun)$/ { print $1 }' | paste -sd, -)

if [ -z "$names" ]; then
  echo '{"text": "", "class": "disconnected"}'
  exit 0
fi

jq -cn --arg n "$names" '{text: (" (" + $n + ")"), tooltip: ("VPN: " + $n), class: "connected"}'
