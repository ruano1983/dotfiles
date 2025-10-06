#!/bin/bash

# Este script debe ejecutarse cuando el ratón entra en el widget.
# Necesitas una herramienta que pueda obtener la posición del cursor en Wayland.
# Ejemplo usando 'ydotool' o una herramienta de Hyprland/Sway para obtener la posición.

# NOTA: En la práctica, obtener la posición del cursor directamente
# desde un script es complejo en Wayland. A menudo es más fácil
# hardcodear la posición relativa al widget.

# Opción 1: Posición fija relativa a un widget conocido
TARGET_X=200
TARGET_Y=500

# Opción 2: Intentar obtener la posición del cursor (Requiere herramientas de Wayland)
# X_POS=$(get_wayland_cursor_x)
# Y_POS=$(get_wayland_cursor_y)
# TARGET_X=$((X_POS + 10)) # 10px a la derecha del cursor
# TARGET_Y=$((Y_POS - 40)) # 40px arriba del cursor

# 2. Abre la ventana (Ahora la geometría usa la variable actualizada)
eww open ram-tooltip
# 1. Actualiza la variable de posición
eww update ram-tooltip "x=${TARGET_X}px,y=${TARGET_Y}px"


