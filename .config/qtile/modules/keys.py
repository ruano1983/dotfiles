###### Keys Module ######
from libqtile import qtile
from libqtile.config import Key, KeyChord
from libqtile.lazy import lazy
from .globals import * 
import os
home_dir = os.path.expanduser( '~' )
# A function for toggling between MAX and title layouts
@lazy.function
def maximize_by_switching_layout(qtile):
    current_layout_name = qtile.current_group.layout.name
    if current_layout_name == 'tile':
        qtile.current_group.layout = 'max'
    elif current_layout_name == 'max':
        qtile.current_group.layout = 'tile'

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
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
    Key([mod , "shift"], "m", lazy.spawn(rofi), desc="Launch rofi"),
    # power menu
    Key([mod , "shift"], "p", lazy.spawn(power), desc="Launch rofi"),
    # Calculator
    Key([mod , "shift"], "a", lazy.spawn("qalculate-gtk"), desc="Launch Calculator"),
    # pavucontrol
    Key([mod , "shift"], "v", lazy.spawn("pavucontrol"), desc="Launch pavucontrol"),
    # libreoffice writer 
    Key([mod , "shift"], "o", lazy.spawn("libreoffice --writer"), desc="Launch libreoffice writer"),
    # Terminal
    Key([mod], "Return", lazy.spawn(myTerm), desc="Launch Terminal"),
    # play Media
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    # volumen
    Key([], "XF86AudioRaiseVolume", lazy.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")),
    # Mute
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
    # Firefox
    Key([mod , "shift"] ,"y", lazy.spawn(myBrowser),desc="Launch Web Browser"),
    # Telegram
    Key([mod , "shift"] ,"t", lazy.spawn("Telegram"),desc="Launch telegram"),
    # keychord file manager 
    KeyChord([mod],"v", [
    # vifm
    Key([] ,"f", lazy.spawn(myTerm + ' -e ' + myfm + ' ' + home_dir + ' ' + home_dir),desc="Launch vifm"),
    # vifmp (pkgmk)
    Key([] ,"p", lazy.spawn(myTerm + ' -e '+ myfm + ' /build/pkgmk /build/pkgmk'),desc="Launch vifm"),
    # vifmc (.config)
    Key([] ,"c", lazy.spawn(myTerm + ' -e '+ myfm + ' .config .config'),desc="Launch vifm "),
    ]),
    ### shutdown 
    Key([mod , "shift"] ,"s", lazy.spawn("loginctl  poweroff"),desc="shutdown"), 
    ### Reboot 
    Key([mod , "shift"] ,"r", lazy.spawn("loginctl reboot"),desc="reboot"), 
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    # kill window
    Key([mod , "shift"], "n", lazy.window.kill(), desc="Kill focused window"),
    # Fullscreen
    Key([mod], "f", maximize_by_switching_layout(),lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window",
    ),
    # Tile off on
    Key([mod], "space", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    # Reload config
    Key([mod, "shift"], "c", lazy.reload_config(), desc="Reload the config"),
    # Salir qtile
    Key([mod, "shift"], "e", lazy.shutdown(), desc="quit qtile"),
    # prompt run widget
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

