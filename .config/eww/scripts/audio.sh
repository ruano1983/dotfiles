#!/usr/bin/env bash
# Muestra volumen e interfaz por defecto (PipeWire)

get_audio_info() {
  # Volumen (sin símbolo de %)
  volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')

  # Estado (muteado o no)
  muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo "true" || echo "false")

  # Descripción legible del sink actual
  device=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep 'node.description' | cut -d '"' -f2)

  # Fallback por si no devuelve nada
  device=${device:-"Desconocido"}

  jq -c -n \
    --argjson vol "$volume" \
    --arg device "$device" \
    --argjson muted "$muted" \
    '{volume:$vol, device:$device, muted:$muted}'
}

while true; do
  get_audio_info
  sleep 1
done

