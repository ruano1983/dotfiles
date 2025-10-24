#!/usr/bin/env bash
# ===========================================
# Interactive Dotfiles Installer (files + folders)
# ===========================================
# Author: Ivan Ruano
# Description:
#   - Interactive prompts for every file and folder
#   - Replaces folders and files if confirmed
#   - eww configured for different wm
# ===========================================

set -e

DOTFILES_DIR="/home/ivanruano83/dotfiles"

GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RESET="\033[0m"

EWWCONF="${HOME}/.config/eww"

msg()  { echo -e "${GREEN}==>${RESET} $*"; }
warn() { echo -e "${YELLOW}⚠️  $*${RESET}"; }
ask()  {
    local prompt="$1"
    local response
    read -rp "$prompt [y/n]: " response
    [[ "$response" =~ ^[Yy]$ ]]
}

ask2()  {
    local prompt="$1"
    local response
    read -r -p "$(echo -e "${GREEN}==> ${RESET}$prompt [s/d]: ")" response
    echo "$response"
   
}
# --- Fancy banner ---
show_banner() {
  clear
  echo "==============================================="

  if command -v figlet >/dev/null 2>&1; then
    figlet "Ivan Ruano Install Dotfiles"
  elif command -v toilet >/dev/null 2>&1; then
    toilet "Ivan Ruano Install Dotfiles"
  else
    echo "🚀  DOTFILES INSTALL by Ivan Ruano  🚀"
  fi

  echo "==============================================="
  echo ""
  echo -e  "${YELLOW}This bash script will install all configurations for all dotfiles, including sway, eww, etc.
If there are files in your /home folder, it will back up that .bak file or folder. You'll also have the option to install it or not, depending on your needs. Just enter [y/n]${RESET}"
  sleep 1
}

profile_ask() {
    local response
    read -r -p "$(echo -e "Which profile do you want to install? ( sway , qtile ) [ s,q ] ")" response
    case $response in
	q)
	    FOLDER_PROFILE=(
		".config/qtile"
	    )
	;;

	s)
	    FOLDER_PROFILE=(
		".config/sway"
	    )
	;;
    esac
}


# --- Start banner ---
show_banner
profile_ask

# --- Files to copy -------------------------------------
FILES_TO_COPY=(
  ".bashrc"
  ".bash-alias"
  ".bash-stream"
  ".bash-path"
  ".config/mpv/scripts/notify-send.lua"
  ".local/share/color-schemes/Moon.colors"
  ".local/share/color-schemes/ArgylsDark.colors"
  ".nanorc"
  "scripts/wl-script"
  "scripts/autostart.sh"
  "scripts/start_eww.sh"
  ".config/starship.toml"
)

# --- Folders to copy -----------------------------------
FOLDERS_TO_COPY=(
  ".config/alacritty"
  ".config/bat"
  ".config/bottom"
  ".config/broot"
  ".config/cava"
  ".config/dunst"
  ".config/eww"
  ".config/fastfetch"
  ".config/fish"
  ".config/foot"
  ".config/kanshi"
  ".config/ranger"
  ".config/vim"
  ".config/vifm"
  ${FOLDER_PROFILE}
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

# --- eww configured for different wm -------------------
response=$(ask2 "which window manager do you want to use eww for? [Sway/Dwl]")

case $response in
    s)
	cd "${EWWCONF}"
	if [ -f "eww.yuck" ]; then
	    mv eww.yuck eww.yuck.bak
	fi
	ln -s eww.yuck.sway eww.yuck
	msg "eww configured for sway wm"
    ;;

    d)
	cd "${EWWCONF}"
	if [ -f "eww.yuck" ]; then
	    mv eww.yuck eww.yuck.bak
	fi
	ln -s eww.yuck.dwl eww.yuck
	msg "eww configured for dwl"
    ;;
esac

# --- dwl build and installation --------------------------
read -rp "$(echo -e "${GREEN}==>${RESET} Do you want to build and install dwl? [y/n]: ")" response
[[ "$response" =~ ^[Yy]$ ]]

if [response = "y"] ; then
    cp -r  ${DOTFILES_DIR}/dwl /tmp
    cd /tmp/dwl
    make clean
    make
    echo -e "${YELLOW}Installing dwl as root with sudo..${RESET}"
    sleep 1
    sudo make PREFIX=/usr install
    rm -fr /tmp/dwl
    msg "Dwl installation completed."
fi

msg "Dotfiles installation completed."
