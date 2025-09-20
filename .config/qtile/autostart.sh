#!/bin/bash
COLORSCHEME=qtile
kanshi &
dbus-update-activation-environment --all &
/usr/libexec/polkit-kde-authentication-agent-1 &


if [ -f /usr/libexec/pipewire-launch.sh  ]; then
    /usr/libexec/pipewire-launch.sh &
fi

if [ -d ~/.config/dunst ]; then
    /usr/bin/dunst -config ~/.config/dunst/dunstrc-$COLORSCHEME &
fi

gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita' &
gsettings set org.gnome.desktop.interface icon-theme 'Papirus' &
gsettings set org.gnome.desktop.interface font-name 'Noto Sans 8' &
gsettings set org.gnome.desktop.interface cursor-theme 'Quintom_Snow' &

sleep 1

if [ -f /usr/local/bin/pa-notify  ]; then
    /usr/local/bin/pa-notify &
fi
