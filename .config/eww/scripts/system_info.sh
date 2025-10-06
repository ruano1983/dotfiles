#!/usr/bin/env bash
# Muestra la versión del kernel y del sistema operativo

KERNEL=$(uname -r)

# Extrae la información principal del sistema
OS_NAME=$(grep '^NAME=' /etc/os-release | cut -d'=' -f2 | tr -d '"' )
OS_VERSION=$(grep '^VERSION=' /etc/os-release | cut -d'=' -f2 | tr -d '"' )

jq -n --arg kernel "$KERNEL" \
       --arg os "$OS_NAME" \
       --arg version "$OS_VERSION" \
       '{kernel:$kernel, os:$os, version:$version}'

