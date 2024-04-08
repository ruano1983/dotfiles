#!/bin/sh
wlr-randr --output HDMI-A-1 --mode 1920x1080@74.973000 &
dbus-update-activation-environment --all &
/usr/lib/libexec/pipewire-launch.sh &
/usr/lib/libexec/polkit-kde-authentication-agent-1 &
/usr/bin/dunst -config ~/.config/dunst/dunstrc &
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita' &
gsettings set org.gnome.desktop.interface icon-theme  'Papirus' &
gsettings set org.gnome.desktop.interface cursor-theme 'Breeze_Snow' & 
gsettings set org.gnome.desktop.interface font-name 'Noto Sans 8' &
