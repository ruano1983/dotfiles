#!/usr/bin/env bash

# Obtiene el layout activo del primer teclado en sway
layout=$(swaymsg -t get_inputs \
  | jq -r '.[] | select(.type=="keyboard") | .xkb_active_layout_name' \
  | head -n 1)

# Normaliza el nombre a 2 letras
case "$layout" in
  *English* ) echo "ansi" ;;
  *Spanish* ) echo "ES" ;;
  *French*  ) echo "FR" ;;
  *German*  ) echo "DE" ;;
  *Italian* ) echo "IT" ;;
  *Portuguese* ) echo "PT" ;;
  * ) echo "$layout" ;; # fallback: muestra el nombre completo
esac

