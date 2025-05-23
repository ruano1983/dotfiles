#### My fish shell config 
## Ivan Ruano Monjas (ivanruanomonjas@protonmail)
## https://github.com/ruano1983

if status is-interactive
    zoxide init fish | source
end
set -g fish_prompt_pwd_dir_length 80
# fish path
set -e fish_user_paths
set -U fish_user_paths  $HOME/.local/bin  $HOME/Applications  $HOME/Aplicaciones/Telegram $HOME/scripts  $fish_user_paths
set fish_greeting	    # welcome message
set TERM "xterm-256color"   # getting proper colors
set EDITOR "vim"	    # $EDITOR use vim
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
alias playrne="mpv --no-video 'https://rtvelivestream.akamaized.net/rtvesec/rne/rne_r1_main.m3u8?idasset=1712486'"
alias playcero="mpv --no-video 'https://atres-live.ondacero.es/live/ondacero/bitrate_1.m3u8'"
# iptv
alias play24h="mpv 'https://ztnr.rtve.es/ztnr/1694255.m3u8'"
alias playgol="mpv 'https://spa-ha-p004.cdn.masmediatv.es/SVoriginOperatorEdge/smil:5_HD.smil/manifest.m3u8'"
alias playla1="mpv 'https://ztnr.rtve.es/ztnr/1688877.m3u8'"
alias playmadridtv="mpv 'https://telemadrid-23-secure2.akamaized.net/master.m3u8'"
# tar compression
alias tarx="tar xvf"
alias tarc="tar cvJf" 
# mlocate updatedb
alias updb="updatedb  --prunepaths=/run"
# window manager start
alias qtilestart="dbus-run-session qtile start -b wayland"
alias dwlstart="dbus-run-session dwl -s waybar"
alias swaystart="dbus-run-session sway"
# plasma wayland start
alias kde="dbus-run-session startplasma-wayland"
# weather Fuenlabrada
alias clima="curl wttr.in/Fuenlabrada"
# greep colors
alias grep='grep --color=auto'
# vifm file manager
alias vifmp="vifm /build/ports /build/ports"
alias vifmc="vifm ~/.config ~/.config"
# ranger file manager
alias rangerh="ranger --cmd='set viewmode=multipane' ~/ ~/"
alias rangerp="ranger  /build/ports"
# eza 
alias eza="eza -G --group-directories-first"
# Changing "ls" to "eza"
alias ls='eza -G --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -al --color=always --group-directories-first ../' # ls on the PARENT directory
alias l..='eza -al --color=always --group-directories-first ../../' # ls on directory 2 levels up
alias l...='eza -al --color=always --group-directories-first ../../../' # ls on directory 3 levels up
# mpv play music
alias play="mpv --shuffle --no-video"
# wl-randr
alias wlrandr="wlr-randr --output DP-1 --mode 1920x1080@74.973000"
# cp verbose
alias cp="cp -v"
# rm verbose
alias rm="rm -v"
# curl -O
alias curlo="curl -O"
# rip trash
alias rip="rip --graveyard /tmp/trash"
# df human
alias df="df -H"
# sudo dmesg 
alias sdmesg="sudo dmesg"
# tock clock
alias clock="tock -s -C 4 -m -c"
# removes .la
alias rmla="sudo /usr/bin/remove-la-files.sh"
# fstrim
alias trim="sudo fstrim -a"
# smart nvme
alias smartnvme1="sudo smartctl -x /dev/nvme0n1"
alias smartnvme2="sudo smartctl -x /dev/nvme1n1"
# download LibreWolf
alias lwolfdown="fish ~/scripts/download_librewolf.fish ~/Aplicaciones"
# install firefox script
alias mozdown="sudo python3 ~/scripts/python/mozilla-download.py"
# dowload brave
alias bravedown="fish ~/scripts/download_brave.fish ~/Aplicaciones"
# rename files 
alias renove="python3 ~/scripts/python/rename.py"
# clean ports (.md5sum .footprint)
alias cleanports="fish ~/scripts/clean_ports.fish"
# build apps script
alias buildlinux="fish /home/ivanruano83/scripts/build_linux.fish -f /linux -i vmlinuz-frikios"
alias buildqtile="fish ~/scripts/build_qtile.fish -f qtile_env -b wayland"
alias builddarktable="fish ~/scripts/build_darktable.fish"
alias buildkde="fish ~/scripts/build_kde.fish"
# git
alias pull="git pull"
alias addall="git add ."
alias add="git add"
alias commit="git commit -m"
alias push="git push"
alias clone='git clone'
# prt-get
alias prtin="prt-get install"
alias prtup="prt-get update -fr"
alias prtid="prt-get depinst -g"
alias prtdep="prt-get depends"
alias prtinfo="prt-get info"
alias prtrem="prt-get remove"
# pkgutils
alias makepkg="fakeroot pkgmk -d"
alias pkgin="pkgadd"
alias pkgup="pkgadd -u"
starship init fish | source
#if [ (tty) = "/dev/tty1" ]
#   exec dbus-run-session qtile start -b wayland
#end
