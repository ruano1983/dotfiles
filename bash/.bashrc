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
alias rmla="sudo /usr/bin/remove-la-files.sh"
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
alias cdbuild="cd /build/lfs-12.1-sysv"
alias cdblfs="cd /build/lfs-12.1-sysv/blfs"
alias cdkde="cd /build/lfs-12.1-sysv/kde"
alias makepkg="fakeroot pkgmk -d"
alias apk="python3 ~/scripts/apk.py"
alias vifmp="vifm /build/pkgutils /build/pkgutils"
alias eza="eza -l"
alias play="mpv --shuffle --no-video"
export makeopts="-j16"

##### Prompt
export PS1='\[\e[38;5;32;2m\]\u\[\e[0m\] \[\e[1m\]\w\[\e[0m\] '
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND}'printf "\033]0;%s@%s:%s\007" "${LOGNAME}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

#### Greeting message
#echo -e 'Bienvenido a FrikiOS 2023.9'
eval "$(zoxide init bash)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#PF_INFO="ascii title os host kernel uptime memory shell"  SHELL="bash" PF_COL1=7  pfetch
figlet -f slant "#! FrikiOS"
