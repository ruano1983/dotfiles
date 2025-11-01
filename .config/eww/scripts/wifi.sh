#!/usr/bin/env bash
# Estado Wi-Fi en JSON instantáneo para Eww
# Requiere: iw, iproute2, jq

IFACE="wlp4s0"  # cambia si tu interfaz es distinta

get_wifi_status() {
    # Si la interfaz no existe
    if ! iw dev "$IFACE" info &>/dev/null; then
        jq -n -c  --arg iface "$IFACE" \
              '{"iface":$iface,"ssid":"No disponible","signal":0,"ip":"-"}'
        return
    fi

    INFO=$(iw dev "$IFACE" link)
    SSID=$(echo "$INFO" | awk -F'SSID: ' '/SSID/ {print $2}' | xargs)
    SIGNAL=$(echo "$INFO" | awk -F'signal: ' '/signal/ {print $2}' | awk '{print $1}')
    IP=$(ip -4 addr show "$IFACE" | awk '/inet / {print $2}' | cut -d'/' -f1 | head -n1)

    if [[ -z "$SSID" || "$SSID" == "Not-Associated" ]]; then
        jq -n --arg iface "$IFACE" \
              '{"iface":$iface,"ssid":"Desconectado","signal":0,"ip":"-"}'
        return
    fi

    # Calcular porcentaje desde dBm
    if [[ -z "$SIGNAL" || "$SIGNAL" == "0" ]]; then
        SIGNAL=-100
    fi

    PERC=$(awk -v s="$SIGNAL" 'BEGIN {
        if (s > -50) p = 100;
        else if (s < -100) p = 0;
        else p = 2 * (s + 100);
        printf "%.0f", p
    }')

    [[ -z "$IP" ]] && IP="-"

    jq -n -c --arg iface "$IFACE" \
          --arg ssid "$SSID" \
          --arg ip "$IP" \
          --argjson signal "$PERC" \
          '{iface:$iface, ssid:$ssid, ip:$ip, signal:$signal}'
}

# Emitir estado inicial
get_wifi_status

# Escuchar eventos de red y WiFi
{
    iw event 2>/dev/null &
    ip monitor address dev "$IFACE" 2>/dev/null &
} | while read -r _; do
    get_wifi_status
done

