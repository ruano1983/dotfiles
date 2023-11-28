case $- in
  *i*) ;;
    *) return;;
esac
##### Variables
export PATH="$HOME/.cargo/bin:$HOME/scripts:$HOME/.local/bin:$PATH"
export EDITOR="/usr/bin/vim"
export LFS="/mnt/lfs"
###### Alias
alias exway="dbus-run-session sway"
alias xfce="startx"
alias tarx="tar xvf"
alias rmla="/usr/sbin/remove-la-files.sh"
alias gl="git pull"
alias updb="updatedb  --prunepaths=/run"
alias kde="dbus-run-session startplasma-wayland"
alias trim="sudo fstrim -a"
alias cash="sh cash.sh"
alias buildlinux="sh /home/ivanruano83/scripts/linux_lfs.sh"
alias sdmesg="sudo dmesg"
alias clima="curl wttr.in/Fuenlabrada"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cdblfs="cd /build/lfs-12.0-d/blfs"
alias cdbuild="cd /build/lfs-12.0-d"
alias cdsspm="cd /build/lfs-12.0-d/sspm"
alias cdkde="cd /build/lfs-12.0-d/kde"
alias makepkg="fakeroot pkgmk -d"
alias apk="python3 ~/scripts/apk.py"
alias vimpy="nvim"
export makeopts="-j16"

##### Prompt
#export PS1='\[\e[38;5;134m\]\u \[\e[38;5;231m\]\w \[\e[0m\]'
export PS1='\[\e[38;5;202;1m\]\u [ \[\e[97m\]\w \[\e[38;5;202m\]] \\$ \[\e[0m\]'
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND}'printf "\033]0;%s@%s:%s\007" "${LOGNAME}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
source /build/lfs-11.3/extra/alacritty-0.12.3/extra/completions/alacritty.bash

#### Greeting message
#echo -e 'Bienvenido a FrikiOS 2023.9'
eval "$(zoxide init bash)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
