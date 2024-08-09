
 [[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    #dbus-run-session qtile start -b wayland
     
     dbus-run-session river
     #dbus-run-session sway
     #dbus-run-session startplasma-wayland
fi
LANG=es_ES.UTF-8
export LFS=/mnt/lfs
export MOZ_ENABLE_WAYLAND=1

