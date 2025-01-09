if status is-interactive
    zoxide init fish | source
end
set -g fish_prompt_pwd_dir_length 80
# fish path
set -e fish_user_paths
set -U fish_user_paths  $HOME/.local/bin  $HOME/Applications  $HOME/Aplicaciones/Telegram $HOME/scripts  $fish_user_paths
set fish_greeting	 # greeting	
# radiotunes
alias tuneslatino="mpv --no-video 'http://prem2.radiotunes.com:80/latinpophits?99fc5648cc8e87d633d28b0b'"
alias tunesdance="mpv --no-video 'http://prem2.radiotunes.com:80/dancehits?99fc5648cc8e87d633d28b0b'"
alias tunes90="mpv --no-video 'http://prem2.radiotunes.com:80/hit90s?99fc5648cc8e87d633d28b0b'"
alias tunestop="mpv --no-video 'http://prem2.radiotunes.com:80/tophits?99fc5648cc8e87d633d28b0b'"
# radio
alias playcope="mpv --no-video 'https://net1-cope-rrcast.flumotion.com/cope/net1-low.mp3'"
alias play40p="mpv --no-video 'https://25653.live.streamtheworld.com/LOS40_SC'"
alias playlaser="mpv --no-video 'https://23543.live.streamtheworld.com/CADENASER_SC'"
alias playdial="mpv --no-video 'https://25683.live.streamtheworld.com/CADENADIAL_SC'"
alias playondafuen="mpv --no-video 'https://radioserver12.profesionalhosting.com/proxy/pkg78581/stream'"
# iptv
alias play24h="mpv 'https://ztnr.rtve.es/ztnr/1694255.m3u8'"
alias playgol="mpv 'https://spa-ha-p004.cdn.masmediatv.es/SVoriginOperatorEdge/smil:5_HD.smil/manifest.m3u8'"
alias playla1="mpv 'https://ztnr.rtve.es/ztnr/1688877.m3u8'"
alias playmadridtv="mpv 'https://telemadrid-23-secure2.akamaized.net/master.m3u8'"
# tar xvf
alias tarx="tar xvf"
# mlocate updatedb
alias updb="updatedb  --prunepaths=/run"
# qtile wayland start
alias qtilestart="dbus-run-session qtile start -b wayland"
# plasma wayland start
alias kde="dbus-run-session startplasma-wayland"
# weather
alias clima="curl wttr.in/Fuenlabrada"
# greep colors
alias grep='grep --color=auto'
# vifm
alias vifmp="vifm /build/pkgmk /build/pkgmk"
alias vifmc="vifm ~/.config ~/.config"
# ranger
alias rangerv="ranger --cmd='set viewmode=multipane' ~/ ~/"
alias rangerp="ranger  /build/pkgmk"
# eza 
alias eza="eza -G"
# Changing "ls" to "eza"
alias ls="eza -G"
# mpv play
alias play="mpv --shuffle --no-video"
# wl-randr
alias wlrandr="wlr-randr --output DP-1 --mode 1920x1080@74.973000"
# cp 
alias cp="cp -v"
# rm
alias rm="rm -v"
# curl -o
alias curlo="curl -O"
# rip trash
alias rip="rip --graveyard /tmp/trash"
# df human
alias df="df -H"
# sudo dmesg 
alias sdmesg="sudo dmesg"
# clock
alias clock="tock -s -C 3 -m -c"
# remove .la
alias rmla="sudo /usr/bin/remove-la-files.sh"
# fstrim
alias trim="sudo fstrim -a"
# smart nvme
alias smartnvme="sudo smartctl -a /dev/nvme0n1"
# build linux script
alias buildlinux="sh /home/ivanruano83/scripts/build_linux.sh -f /build/linux"
# install firefox script
alias mozdown="sudo python3 ~/scripts/python/mozilla-download.py"
# rename files 
alias renove="python3 ~/scripts/python/rename.py"
# build qtile script
alias buildqtile="sh ~/scripts/build_qtile.sh -f qtile_env -b wayland"
# git
alias gl="git pull"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
# prt-get
alias prtin="prt-get install"
alias prtup="prt-get update"
alias prtid="prt-get depinst"
alias prtdep="prt-get depends"
alias prtinfo="prt-get info"
alias prtrem="prt-get remove"
# pkgutils
alias makepkg="fakeroot pkgmk -d"
alias pkgin="pkgadd"
alias pkgup="pkgadd -u"
set TERM "xterm-256color"	 # Sets the terminal type
set EDITOR "vim"		 # $EDITOR use vim
if [ (tty) = "/dev/tty1" ]
    exec dbus-run-session qtile start -b wayland
end
