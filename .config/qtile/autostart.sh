#!/bin/sh
kanshi &
dbus-update-activation-environment --all &
/usr/libexec/pipewire-launch.sh &
/usr/libexec/polkit-kde-authentication-agent-1 &
/usr/bin/dunst -config ~/.config/dunst/dunstrc-qtile &
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita' &
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark' &
gsettings set org.gnome.desktop.interface font-name 'Noto Sans 8' &
