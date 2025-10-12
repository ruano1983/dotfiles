#!/usr/bin/env bash
# Genera JSON de los tags a partir de "dwlmsg -g" con clases incluidas en tiempo real

monitor="DP-1"  # cámbialo si usas otro monitor

get_tags() {
  dwlmsg -g | awk -v mon="$monitor" '
  $1 == mon && $2 == "tag" {
    tag=$3; sel=$4; win=$5; occ=$6;
    printf "{\"id\":%d,\"focused\":%d,\"windows\":%d,\"occupied\":%d}\n", tag, sel, win, occ;
  }' \
  | jq -s -c '[.[] | .class = (if .focused == 1 then "tag-focused" elif .windows >= 1 then "tag-occupied" else "tag" end)]'
}

# Función para emitir JSON inicial y luego escuchar cambios en tiempo real
emit_state() {
  get_tags
  # Escucha eventos en tiempo real: cada vez que dwlmsg emite algo, actualizamos
  dwlmsg -w | while read -r _; do
    get_tags
  done
}

emit_state

