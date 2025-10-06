#!/usr/bin/env bash
# Muestra el estado del WiFi + IP local en JSON para Eww

# Cambia esto por tu interfaz correcta
IFACE="wlp4s0"

# Verificar si la interfaz existe
if ! iw dev "$IFACE" info &>/dev/null; then
  jq -n --arg iface "$IFACE" \
        '{"iface":$iface,"ssid":"No disponible","signal":0,"ip":"-"}'
  exit 0
fi

# Obtener información del enlace
INFO=$(iw dev "$IFACE" link)

SSID=$(echo "$INFO" | awk -F'SSID: ' '/SSID/ {print $2}')
SIGNAL=$(echo "$INFO" | awk -F'signal: ' '/signal/ {print $2}' | awk '{print $1}')
IP=$(ip addr show "$IFACE" | awk '/inet / {print $2}' | cut -d'/' -f1 | head -n1)

# Si no hay conexión
if [[ -z "$SSID" || "$SSID" == "Not-Associated" ]]; then
  jq -n --arg iface "$IFACE" \
        '{"iface":$iface,"ssid":"Desconectado","signal":0,"ip":"-"}'
  exit 0
fi

# Convertir dBm a porcentaje aproximado
PERC=$((2 * (SIGNAL + 100)))
(( PERC > 100 )) && PERC=100
(( PERC < 0 )) && PERC=0

# Si no hay IP (por ejemplo, conectando)
[[ -z "$IP" ]] && IP="-"

jq -n --arg iface "$IFACE" \
       --arg ssid "$SSID" \
       --arg ip "$IP" \
       --argjson signal "$PERC" \
       '{iface:$iface, ssid:$ssid, ip:$ip, signal:$signal}'

