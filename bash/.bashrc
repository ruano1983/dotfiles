# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac
##### Variables
export OSH='/home/ivanruano83/.oh-my-bash'
export PATH="/opt/android-tools/:$HOME/.cargo/bin:$HOME/scripts:$HOME/.local/bin:$PATH"
export EDITOR="/usr/bin/vim"
export LFS="/mnt/lfs"
export sources="/build/lfs-12.2-sysv/lfs"
export makeopts="-j16"
source .bash-aliases
source .bash-stream
OSH_THEME="sexy"

OMB_USE_SUDO=true

completions=(
  git
  composer
  ssh
)

aliases=(
  general
)

plugins=(
  git
  bashmarks
)

source "$OSH"/oh-my-bash.sh
source ~/.local/share/blesh/ble.sh
eval "$(zoxide init bash)"
eval "$(atuin init bash)"
echo -e 'Bienvenido a FrikiOS (Stormtrooper) 2024.7.2'


