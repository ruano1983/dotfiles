#!/usr/bin/env bash
# ~/.config/eww/scripts/disk.sh
# Muestra el uso de / y /home en GB y porcentaje, en formato JSON compacto

get_disk_info() {
  part="$1"
  if df -BG --output=size,used,pcent,target "$part" &>/dev/null; then
    read -r size used percent mount <<<$(df -BG --output=size,used,pcent,target "$part" | tail -n 1)
    size_gb=${size%G}
    used_gb=${used%G}
    percent_val=${percent%\%}
    jq -n \
      --arg part "$mount" \
      --argjson size "$size_gb" \
      --argjson used "$used_gb" \
      --argjson percent "$percent_val" \
      '{part:$part, size:$size, used:$used, percent:$percent}'
  else
    jq -n \
      --arg part "$part" \
      '{part:$part, size:0, used:0, percent:0}'
  fi
}

while true; do
  root=$(get_disk_info "/")
  home=$(get_disk_info "/home")

  jq -c -n --argjson root "$root" --argjson home "$home" \
    '{root:$root, home:$home}'

  sleep 7
done

