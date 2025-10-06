#!/usr/bin/env bash
# ~/.scripts/bluetooth_watch.sh
# Emite cada 5s un JSON con {icon, count, tooltip}

# Necesita bluetoothctl y jq
while true; do
  if ! systemctl is-active --quiet bluetooth; then
    jq -n --arg icon "" --arg tooltip "Bluetooth apagado" --argjson count 0 \
      '{icon:$icon, count:$count, tooltip:$tooltip}'
    sleep 5
    continue
  fi

  # Recorremos los dispositivos conocidos y comprobamos si están conectados
  connected_names=()
  while read -r dev; do
    [ -z "$dev" ] && continue
    if bluetoothctl info "$dev" 2>/dev/null | grep -q "Connected: yes"; then
      name=$(bluetoothctl info "$dev" 2>/dev/null | awk -F': ' '/Alias/ {print $2; exit}')
      # si no hay Name, usar la MAC
      [ -z "$name" ] && name="$dev"
      connected_names+=("$name")
    fi
  done < <(bluetoothctl devices | awk '{print $2}')

  count=${#connected_names[@]}

  if [ "$count" -gt 0 ]; then
    # Convertir la lista a una cadena separada por comas y construir JSON seguro con jq
    printf '%s\n' "${connected_names[@]}" \
      | jq -R -s -c --arg icon "" --argjson count "$count" \
          '{icon:$icon, count:$count, tooltip:(split("\n")[:-1] | join(", "))}'
  else
    jq -n --arg icon "" --arg tooltip "Sin dispositivos conectados" --argjson count 0 \
      '{icon:$icon, count:$count, tooltip:$tooltip}'
  fi

  sleep 5
done

