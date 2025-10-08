#!/usr/bin/env bash
# ===========================================
# 🧩 Interactive Dotfiles Installer (with Waybar selection)
# ===========================================
# Author: Ivan Ruano
# Repository: https://github.com/ruano1983/dotfiles
# Description:
#   - Clones or updates your dotfiles repo
#   - Interactively copies files and folders to $HOME
#   - Makes automatic backups (.bak)
#   - Lets you choose which Waybar config to install
#   - Shows a final summary
# ===========================================

set -e

DOTFILES_REPO="https://github.com/ruano1983/dotfiles.git"
DOTFILES_DIR="${HOME}/dotfiles"

# --- Colors and helpers ----------------------------------
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
RESET="\033[0m"

msg()  { echo -e "${GREEN}==>${RESET} $*"; }
warn() { echo -e "${YELLOW}⚠️  $*${RESET}"; }

# Ask the user for confirmation (yes/no)
ask() {
  local prompt="$1"
  local response
  read -rp "$prompt [y/n]: " response
  [[ "$response" =~ ^[Yy]$ ]]
}

# --- Counters --------------------------------------------
COPIED=0
BACKED_UP=0
SKIPPED=0

# --- Backup and copy function -----------------------------
backup_and_copy() {
  local src="$1"
  local dest="$2"

  # If the destination already exists, ask whether to back it up
  if [ -e "$dest" ]; then
    warn "Exists: $dest"
    if ask "Make a backup and replace it?"; then
      msg "📦 Backup: $dest → ${dest}.bak"
      mv "$dest" "${dest}.bak"
      ((BACKED_UP++))
    else
      warn "Skipped: $dest"
      ((SKIPPED++))
      return
    fi
  fi

  # Ensure the destination directory exists
  mkdir -p "$(dirname "$dest")"

  # Copy the file or directory
  cp -r "$src" "$dest"
  msg "✅ Copied: $src → $dest"
  ((COPIED++))
}

# --- Clone or update repo --------------------------------
if [ ! -d "$DOTFILES_DIR" ]; then
  msg "Cloning repository into $DOTFILES_DIR..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
  msg "Repository already exists: $DOTFILES_DIR"
  if ask "Do you want to update it (git pull)?"; then
    (cd "$DOTFILES_DIR" && git pull --quiet)
    msg "🔄 Repository updated."
  fi
fi

echo
msg "🚀 Starting interactive dotfiles installation..."
echo

cd "$DOTFILES_DIR"

# --- Waybar configuration selection ----------------------
WAYBAR_OPTION=""
echo -e "${BLUE}Select your Waybar configuration:${RESET}"
echo "1) waybar-dwl"
echo "2) waybar-sway"
echo "3) waybar-river"
echo "4) None / skip"
read -rp "Option [1-4]: " waybar_choice

case "$waybar_choice" in
  1) WAYBAR_OPTION=".config/waybar-dwl" ;;
  2) WAYBAR_OPTION=".config/waybar-sway" ;;
  3) WAYBAR_OPTION=".config/waybar-river" ;;
  4) WAYBAR_OPTION="" ;;
  *) warn "Invalid option. Waybar will be skipped."; WAYBAR_OPTION="" ;;
esac

if [ -n "$WAYBAR_OPTION" ]; then
  msg "Using Waybar config: ${WAYBAR_OPTION}"
  backup_and_copy "${DOTFILES_DIR}/${WAYBAR_OPTION}" "${HOME}/.config/waybar"
  # Ask if the user wants to restart Waybar automatically
  if ask "Do you want to restart Waybar now?"; then
    if pgrep -x "waybar" >/dev/null; then
      msg "Restarting Waybar..."
      pkill -x waybar && nohup waybar >/dev/null 2>&1 &
    else
      msg "Starting Waybar..."
      nohup waybar >/dev/null 2>&1 &
    fi
  fi
fi

# --- Copy all other dotfiles ------------------------------
find . -mindepth 1 -not -path './.git*' \
    -not -path './.config/waybar-*' \
    -not -name 'install.sh' | while read -r path; do
  src="${DOTFILES_DIR}/${path#./}"
  dest="${HOME}/${path#./}"

  echo
  msg "Detected item:"
  echo "   Source: $src"
  echo "   Target: $dest"

  if ask "Copy this item?"; then
    backup_and_copy "$src" "$dest"
  else
    warn "Skipped: $src"
    ((SKIPPED++))
  fi
done

# --- Final summary ----------------------------------------
echo
echo -e "${BLUE}============================================${RESET}"
echo -e "${GREEN}✨ Installation complete${RESET}"
echo -e "${BLUE}--------------------------------------------${RESET}"
echo -e "✅ Copied:      ${COPIED}"
echo -e "📦 Backed up:   ${BACKED_UP}"
echo -e "⚠️  Skipped:     ${SKIPPED}"
echo -e "${BLUE}============================================${RESET}"

if [ -n "$WAYBAR_OPTION" ]; then
  msg "💡 Active Waybar config: ${WAYBAR_OPTION}"
fi

msg "Done! Check your .bak backups if needed."

