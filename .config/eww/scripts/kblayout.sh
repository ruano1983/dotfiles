#!/usr/bin/env bash
# Script para obtener el layout del teclado en sway, con tooltip detallado

get_layout_full() {
  swaymsg -t get_inputs \
    | jq -r '.[] | select(.type=="keyboard") | .xkb_active_layout_name' \
    | head -n 1
}

get_layout_short() {
  full="$1"
  case "$full" in
    *English* ) echo "US" ;;
    *Spanish* ) echo "ES" ;;
    *French*  ) echo "FR" ;;
    *German*  ) echo "DE" ;;
    *Italian* ) echo "IT" ;;
    *Portuguese* ) echo "PT" ;;
    * ) echo "??" ;;
  esac
}

send_json() {
  full=$(get_layout_full)
  short=$(get_layout_short "$full")

  jq -nc --arg short "$short" --arg full "$full" \
    '{layout: $short, tooltip: $full}'
}

# salida inicial
send_json

# escucha en tiempo real los cambios de layout
swaymsg -m -t subscribe '["input"]' | while read -r _; do
  send_json
done

