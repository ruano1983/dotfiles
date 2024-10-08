# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac
source git-prompt.sh
# Variables
export OSH='/home/ivanruano83/.oh-my-bash'
export PATH="/opt/android-tools/:$HOME/.cargo/bin:$HOME/scripts:$HOME/.local/bin:$PATH"
export EDITOR="/usr/bin/vim"
export LFS="/mnt/lfs"
export sources="/build/lfs-12.2-sysv/lfs"
export makeopts="make -j$(nproc)"
# alias
source .bash-alias
source .bash-stream
# apps bash
source ~/.local/share/blesh/ble.sh
eval "$(zoxide init bash)"
eval "$(atuin init bash)"
# velcome
echo -e 'Bienvenido a FrikiOS (Stormtrooper) 2024.7.2'
# prompt
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;134;1m\]\u\[\e[0m\] \[\e[1m\]\w\[\e[0m\] \n\[\e[1m\]...\[\e[0m\] \[\e[1m\]\\$\[\e[38;5;44m\]${PS1_CMD1}\[\e[0m\] '
