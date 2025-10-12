#!/usr/bin/env bash
# Muestra el layout de teclado inicial en JSON (solo al inicio)

# Intentamos obtener layout por localectl
layout=${XKB_DEFAULT_LAYOUT}

# Abreviaturas comunes
case "$layout" in
  "us") layout="Ansi" ;;
  "es") layout="ES" ;;
  "de") layout="DE" ;;
esac

# Emitimos JSON
jq -n -c --arg layout "$layout" '{layout:$layout}'

