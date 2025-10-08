#!/usr/bin/env bash
# Script Bluetooth instantáneo para Eww usando DBus y jq

prev=""

update() {
    # Lista de dispositivos conectados
    connected_names=()
    while read -r dev; do
        [ -z "$dev" ] && continue
        if bluetoothctl info "$dev" 2>/dev/null | grep -q "Connected: yes"; then
            name=$(bluetoothctl info "$dev" 2>/dev/null | awk -F': ' '/Alias/ {print $2; exit}')
            [ -z "$name" ] && name="$dev"
            connected_names+=("$name")
        fi
    done < <(bluetoothctl devices | awk '{print $2}')

    count=${#connected_names[@]}

    json=$(jq -n -c \
        --argjson count "$count" \
        --arg tooltip "$(IFS=,; echo "${connected_names[*]}")" \
        '{
            count: $count,
            tooltip: (if $count == 0 then "Sin dispositivos conectados" else $tooltip end)
        }'
    )

    if [[ "$json" != "$prev" ]]; then
        echo "$json"
        prev="$json"
    fi
}

# Salida inicial
update

# Escuchar eventos DBus de bluetooth
dbus-monitor --system "type='signal',interface='org.freedesktop.DBus.Properties',member='PropertiesChanged',path_namespace='/org/bluez'" \
| while read -r line; do
    # Solo reaccionar a cambios de Connected
    if [[ "$line" == *"Connected"* ]]; then
        update
    fi
done

