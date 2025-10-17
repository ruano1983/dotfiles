#!/usr/bin/env bash
# Muestra la versión del kernel y del sistema operativo

KERNEL=$(uname -r)

# Extrae la información principal del sistema
OS_NAME=$(grep '^NAME=' /etc/os-release | cut -d'=' -f2 | tr -d '"' )
OS_VERSION=$(grep '^VERSION=' /etc/os-release | cut -d'=' -f2 | tr -d '"' )
OS_HOSTNAME=$(hostname)

jq -n -c --arg kernel "$KERNEL" \
       --arg os "$OS_NAME" \
       --arg version "$OS_VERSION" \
       --arg hostname "$OS_HOSTNAME" \
       '{kernel:$kernel, os:$os, version:$version, hostname:$hostname}'

