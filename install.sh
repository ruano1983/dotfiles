#!/usr/bin/env bash
# ===========================================
# Interactive Dotfiles Installer (files + folders)
# ===========================================
# Author: Ivan Ruano
# Description:
#   - Interactive prompts for every file and folder
#   - Replaces folders and files if confirmed
# ===========================================

set -e

DOTFILES_DIR="/home/ivanruano83/dotfiles"

GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RESET="\033[0m"

msg()  { echo -e "${GREEN}==>${RESET} $*"; }
warn() { echo -e "${YELLOW}⚠️  $*${RESET}"; }
ask()  {
  local prompt="$1"
  local response
  read -rp "$prompt [y/n]: " response
  [[ "$response" =~ ^[Yy]$ ]]
}

# --- Fancy banner ---
show_banner() {
  clear
  echo -e "${CYAN}"
  echo "==============================================="

  if command -v figlet >/dev/null 2>&1; then
    figlet "Ivan Ruano"
  elif command -v toilet >/dev/null 2>&1; then
    toilet "Ivan Ruano"
  else
    echo "🚀  DOTFILES INSTALLER by Ivan Ruano  🚀"
  fi

  echo "==============================================="
  echo -e "${RESET}"
  sleep 1
}

# --- Start banner ---
show_banner

# --- Files to copy -------------------------------------
FILES_TO_COPY=(
  ".bashrc"
  ".bash-alias"
  ".bash-stream"
  ".bash-path"
  ".nanorc"
  "scripts/autostart.sh"
  "scripts/start_eww.sh"
  ".config/mpv/scripts/notify-send.lua"
  ".local/bin/wl-script"
  ".local/share/color-schemes/Moon.colors"
  ".local/share/color-schemes/ArgylsDark.colors"

  # add other files here
)

# --- Folders to copy -----------------------------------
FOLDERS_TO_COPY=(
  ".config/eww"
  ".config/fish"
  ".config/alacritty"
  ".config/vim"
  ".config/vifm"
  ".config/fastfetch"
  ".config/kanshi"
  ".config/cava"
  ".config/bottom"
  ".config/qtile"
  ".config/sway"
  ".config/ranger"
  ".config/dunst"
  ".config/broot"
  ".config/foot"
  ".config/waybar-dwl"
  ".config/waybar-sway"
  ".config/waybar-river"
  # add other folders here
)

# --- Copy files interactively -------------------------
for file in "${FILES_TO_COPY[@]}"; do
  src="${DOTFILES_DIR}/${file}"
  dest="${HOME}/${file}"

  if [ ! -f "$src" ]; then
    warn "File not found: $src"
    continue
  fi

  echo
  msg "File detected:"
  echo "   Source: $src"
  echo "   Target: $dest"

  if [ -e "$dest" ]; then
    if ask "File exists. Replace it?"; then
      cp "$src" "$dest"
      msg "Replaced file: $dest"
    else
      warn "Skipped file: $dest"
    fi
  else
    if ask "Copy this file?"; then
      mkdir -p "$(dirname "$dest")"
      cp "$src" "$dest"
      msg "Copied file: $dest"
    else
      warn "Skipped file: $dest"
    fi
  fi
done

# --- Copy folders interactively -----------------------
for folder in "${FOLDERS_TO_COPY[@]}"; do
  src="${DOTFILES_DIR}/${folder}"
  dest="${HOME}/${folder}"

  if [ ! -d "$src" ]; then
    warn "Folder not found: $src"
    continue
  fi

  echo
  msg "Folder detected:"
  echo "   Source: $src"
  echo "   Target: $dest"

  if [ -d "$dest" ]; then
    if ask "Folder exists. backup?"; then
      mv "$dest" "$dest.bak"
      msg "backup: $dest"
    else
      warn "Skipped folder: $dest"
      continue
    fi
  fi

  if ask "Copy this folder?"; then
    mkdir -p "$(dirname "$dest")"
    cp -r "$src" "$dest"
    msg "Copied folder: $dest"
  else
    warn "Skipped folder: $dest"
  fi
done

msg "Dotfiles installation completed."
