###### Keys Module ######

from libqtile.config import Key
from libqtile.lazy import lazy
from .globals import * 
import os

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    #ey([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "control"], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # layout MonadWide
    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.reset()),
    # layout tile 
    Key([mod], "o", lazy.layout.increase_ratio()),
    Key([mod], "p", lazy.layout.decrease_ratio()),

    # Toggle between split and unsplit sides of stack.
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),

    # Rofi
    Key([mod , "shift"], "m", lazy.spawn(rofi), desc="Launch Rofi"),
    # power menu
    Key([mod , "shift"], "p", lazy.spawn(power), desc="Launch Rofi"),
    # lock screen
    Key([mod , "shift"], "F12", lazy.spawn(lock), desc="lock screen"),
    # Calculator
    Key([mod , "shift"], "a", lazy.spawn("kcalc"), desc="calculator"),
    # pavucontrol
    Key([mod , "shift"], "v", lazy.spawn("pavucontrol"), desc="Launch pavucontrol"),
    # Darktable
    Key([mod , "shift"], "f", lazy.spawn("darktable"), desc="Launch darktable"),
    # libreoffice writer 
    Key([mod , "shift"], "o", lazy.spawn("libreoffice --writer"), desc="Launch libreoffice writer"),
    ### Terminal Alacritty
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # play Music
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    ### volumen
    Key([], "XF86AudioRaiseVolume", lazy.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")),
    ### Mute
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
    ### Firefox
    Key([mod , "shift"] ,"y", lazy.spawn("firefox"),desc="Launch Firefox"),
    ### Thunderbird
    Key([mod , "shift"] ,"t", lazy.spawn("thunderbird"),desc="Launch thunderbird"),
    ### Dolphin
    Key([mod , "shift"] ,"d", lazy.spawn("dolphin"),desc="Launch dolphin"),
    ### Kate
    Key([mod , "shift"] ,"i", lazy.spawn("kate"),desc="Launch kate"),
    ### Kate
    ### shutdown 
    Key([mod , "shift"] ,"s", lazy.spawn("loginctl  poweroff"),desc="shutdown"), 
    ### Reboot 
    Key([mod , "shift"] ,"r", lazy.spawn("loginctl reboot"),desc="reboot"), 

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod , "shift"], "n", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    # Tile off on
    Key([mod], "space", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    # Reload config
    Key([mod, "shift"], "c", lazy.reload_config(), desc="Reload the config"),
    # Salir qtile
    Key([mod, "shift"], "e", lazy.spawn(logoutuser), desc="Logout user"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
]

# Add key bindings to switch VTs in Wayland.
for vt in range(1, 9):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )

