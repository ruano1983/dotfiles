#!/usr/bin/env bash
# Muestra memoria usada, total y caché en GB y JSON

while true; do
  # Leemos valores de /proc/meminfo en kB
  mem_total=$(grep -m1 'MemTotal' /proc/meminfo | awk '{print $2}')
  mem_available=$(grep -m1 'MemAvailable' /proc/meminfo | awk '{print $2}')
  mem_cached=$(grep -m1 '^Cached:' /proc/meminfo | awk '{print $2}')

  # Calcular memoria usada (sin caché)
  mem_used=$((mem_total - mem_available))

  # Convertir a GB con 1 decimal
  total_gb=$(awk "BEGIN {printf \"%.1f\", ${mem_total}/1024/1024}")
  used_gb=$(awk "BEGIN {printf \"%.1f\", ${mem_used}/1024/1024}")
  cache_gb=$(awk "BEGIN {printf \"%.1f\", ${mem_cached}/1024/1024}")

  # Porcentaje de uso
  used_percent=$(awk "BEGIN {printf \"%.0f\", (${mem_used}/${mem_total})*100}")

  # Salida JSON limpia con jq
  jq -n -c \
    --argjson used "${used_gb}" \
    --argjson total "${total_gb}" \
    --argjson cache "${cache_gb}" \
    --argjson percent "${used_percent}" \
    '{used:$used, total:$total, cache:$cache, percent:$percent}'

  sleep 2
done

