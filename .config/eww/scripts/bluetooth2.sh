#!/usr/bin/env bash
# Script Bluetooth optimizado para Eww usando jq

prev=""

update() {
    # Obtener dispositivos conectados
    connected_names=()
    while read -r dev; do
        [ -z "$dev" ] && continue
        if bluetoothctl info "$dev" 2>/dev/null | grep -q "Connected: yes"; then
            name=$(bluetoothctl info "$dev" 2>/dev/null | awk -F': ' '/Alias/ {print $2; exit}')
            [ -z "$name" ] && name="$dev"
            connected_names+=("$name")
        fi
    done < <(bluetoothctl devices | awk '{print $2}')

    # Crear JSON usando jq
    json=$(jq -n -c  \
        --argjson count "${#connected_names[@]}" \
        --arg tooltip "$(IFS=,; echo "${connected_names[*]}")" \
        '{
            count: $count,
            tooltip: (if $count == 0 then "Sin dispositivos conectados" else $tooltip end)
        }'
    )

    # Emitir sólo si cambió
    if [[ "$json" != "$prev" ]]; then
        echo "$json"
        prev="$json"
    fi
}

# Salida inicial
update

# Loop eficiente
while true; do
    update
    sleep 3
done

