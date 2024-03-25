
 [[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    dbus-run-session sway
fi
LANG=es_ES.UTF-8
export LFS=/mnt/lfs
