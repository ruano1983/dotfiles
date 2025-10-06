#!/bin/bash
# ram.sh
# Muestra memoria usada/total en GB

while true; do
  mem_total=$(grep MemTotal /proc/meminfo | awk '{print $2}')   # en kB
  mem_available=$(grep MemAvailable /proc/meminfo | awk '{print $2}') # en kB
  mem_used=$((mem_total - mem_available))
  total_gb=$(awk "BEGIN {printf \"%.1f\", $mem_total/1024/1024}")
  used_gb=$(awk "BEGIN {printf \"%.1f\", $mem_used/1024/1024}")
  echo "${used_gb}G/${total_gb}"
  sleep 2
done

