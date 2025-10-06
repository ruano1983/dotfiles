#!/bin/bash
# cpu_temp.sh
while true; do
  if [ -r /dev/cpu_temp ]; then
    temp=$(cat /dev/cpu_temp)
    # Si el valor es muy grande, asumimos que viene en miligrados (ej: 42000)
    if [ "$temp" -gt 1000 ]; then
      temp=$((temp / 1000))
    fi
    echo "$temp"
  else
    echo "N/A"
  fi
  sleep 2
done
