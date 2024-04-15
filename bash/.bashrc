case $- in
  *i*) ;;
    *) return;;
esac
##### Variables
export PATH="$HOME/.cargo/bin:$HOME/scripts:$HOME/.local/bin:$PATH"
export EDITOR="/usr/bin/vim"
export LFS="/mnt/lfs"
export makeopts="-j16"
source .bash-aliases
source .bash-stream
##### Prompt
export PS1='\[\e[38;5;32;1;2m\]\u\[\e[0m\] \[\e[1m\]\w\[\e[0m\] \n\[\e[1m\]...\[\e[0m\] '
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND}'printf "\033]0;%s@%s:%s\007" "${LOGNAME}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

#### Greeting message
#echo -e 'Bienvenido a FrikiOS 2023.9'
eval "$(zoxide init bash)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#PF_INFO="ascii title os host kernel uptime memory shell"  SHELL="bash" PF_COL1=7  pfetch
printf "\e[34m" 
figlet -f slant "#! FrikiOS" 
printf "\e[0m"
