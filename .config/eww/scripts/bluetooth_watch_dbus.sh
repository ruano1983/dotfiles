#!/usr/bin/env bash
prev=""

update() {
    devices=()
    while read -r dev; do
        [ -z "$dev" ] && continue
        if bluetoothctl info "$dev" 2>/dev/null | grep -q "Connected: yes"; then
            name=$(bluetoothctl info "$dev" 2>/dev/null | awk -F': ' '/Alias/ {print $2; exit}')
            [ -z "$name" ] && name="$dev"
            devices+=("$name")
        fi
    done < <(bluetoothctl devices | awk '{print $2}')

    count=${#devices[@]}
    if [ $count -eq 0 ]; then
        json=$(jq -n -c --argjson count 0 --arg tooltip "Sin dispositivos conectados" \
            '{count:$count, devices:[], tooltip:$tooltip}')
    else
        tooltip=$(IFS=,; echo "${devices[*]}")
        json=$(jq -n -c --argjson count "$count" --arg tooltip "$tooltip" --argjson devices "$(printf '%s\n' "${devices[@]}" | jq -R -s -c 'split("\n")[:-1]')" \
            '{count:$count, devices:$devices, tooltip:$tooltip}')
    fi

    if [[ "$json" != "$prev" ]]; then
        echo "$json"
        prev="$json"
    fi
}

update

dbus-monitor --system "type='signal',interface='org.freedesktop.DBus.Properties',member='PropertiesChanged',path_namespace='/org/bluez'" \
| while read -r line; do
    if [[ "$line" == *"Connected"* ]]; then
        update
    fi
done

