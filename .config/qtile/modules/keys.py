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
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "control"], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # layout MonadWide
    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.reset()),
    # Toggle between split and unsplit sides of stack.
    Key([mod, "shift"],"Return",lazy.layout.toggle_split(),desc="Toggle between split and unsplit sides of stack"),
    # Rofi
    Key([mod , "shift"], "m", lazy.spawn(rofi), desc="Launch rofi"),
    # power menu
    Key([mod , "shift"], "p", lazy.spawn(power), desc="Launch rofi"),
    # pavucontrol
    Key([mod , "shift"], "v", lazy.spawn("pavucontrol"), desc="Launch pavucontrol"),
    # Terminal
    Key([mod], "Return", lazy.spawn(myTerm), desc="Launch Terminal"),
    # play Media
    Key([], "XF86AudioPlay", lazy.spawn("wl-script pause_player")),
    Key([], "XF86AudioNext", lazy.spawn("wl-script next_player")),
    Key([], "XF86AudioPrev", lazy.spawn("wl-script previous_player")),
    # volumen
    Key([], "XF86AudioRaiseVolume", lazy.spawn("wl-script volume_up")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("wl-script volume_down")),
    # Mute
    Key([], "XF86AudioMute", lazy.spawn("wl-script volume-mute")),
    # Firefox
    Key([mod , "shift"] ,"y", lazy.spawn(myBrowser),desc="Launch Web Browser"),
    # Telegram
    Key([mod , "shift"] ,"t", lazy.spawn("Telegram"),desc="Launch telegram"),
    # screenshot
    Key([],"print", lazy.spawn("wl-script print_screenshot"),desc="Screenshot"),
    # keychord file manager 
    KeyChord([mod],"v", [
    # vifm
    Key([] ,"h", lazy.spawn(myTerm + ' -e ' + myfm + ' ' + home_dir + ' ' + home_dir),desc="Launch vifm"),
    # vifmp (ports)
    Key([] ,"p", lazy.spawn(myTerm + ' -e '+ myfm + ' /build/ports /build/ports'),desc="Launch vifm"),
    # vifmc (.config)
    Key([] ,"c", lazy.spawn(myTerm + ' -e '+ myfm + ' .config .config'),desc="Launch vifm "),
    ]),
    # keychord power
    KeyChord([mod],"p", [
    # exit qtile
    Key([], "q", lazy.shutdown(), desc="quit qtile"),
    ### shutdown 
    Key([], "s", lazy.spawn("wl-script power_off"),desc="shutdown"), 
    ### Reboot 
    Key([], "r", lazy.spawn("wl-script power_reboot"),desc="reboot"), 
    ]),
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

