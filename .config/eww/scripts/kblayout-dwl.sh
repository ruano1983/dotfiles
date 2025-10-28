#!/usr/bin/env bash

layout_full=$(cat /tmp/dwl-keymap 2>/dev/null | tr -d '\n')

# Determina el código corto según el idioma detectado
case "$layout_full" in
  *"English"*) layout="US" ;;
  *"Spanish"*) layout="ES" ;;
  *"French"*) layout="FR" ;;
  *"German"*) layout="DE" ;;
  *"Italian"*) layout="IT" ;;
  *"Portuguese"*) layout="PT" ;;
  *) layout="??" ;;
esac

# Genera JSON limpio con jq
jq -n -c \
  --arg layout "$layout" \
  --arg tooltip "$layout_full" \
  '{layout: $layout, tooltip: $tooltip}'

