# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac
# Variables
export PATH="/opt/android-tools/:$HOME/.cargo/bin:$HOME/scripts:$HOME/.local/bin:$PATH"
export EDITOR="/usr/bin/vim"
export LFS="/mnt/lfs"
export sources="/build/lfs-12.2-sysv/lfs"
export makeopts="make -j$(nproc)"
#eval "$(atuin init bash)"
eval "$(zoxide init bash)"
# alias
source ~/.bash-alias
source ~/.bash-stream
source /etc/profile.d/bash_completion.sh
#bind 'set show-all-if-ambiguous on'
#bind 'TAB:menu-complete'
HISTSIZE=10000
HISTFILESIZE=10000
PROMPT_COMMAND='history -a'
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White
Cnormal="\e[0m"		  # Normal
# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

#exec fish
# prompt
PS1="$BYellow \u$Cnormal \w\n... $ "
# greeting
echo -e "Hello friend!"
echo -e "Today is $BYellow$(date +'%A %d %b %Y %T')\e[0m and this machine is called $BYellow$HOSTNAME \e[0m with the kernel $BYellow$(uname -r)"
