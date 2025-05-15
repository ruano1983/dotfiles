###### Keys Module ######
from libqtile import qtile
from libqtile.config import Key, KeyChord
from libqtile.lazy import lazy
from .globals import * 
import os
# A function for toggling between MAX and title layouts
@lazy.function
def maximize_by_switching_layout(qtile):
    current_layout_name = qtile.current_group.layout.name
    if current_layout_name == 'monadtall':
        qtile.current_group.layout = 'max'
    elif current_layout_name == 'columns':
        qtile.current_group.layout = 'max'
    elif current_layout_name == 'max':
        qtile.current_group.layout = 'monadtall'

@lazy.function
def change_layout(qtile):
    current_layout_name = qtile.current_group.layout.name
    if current_layout_name == 'columns':
        qtile.current_group.layout = 'tile'
    elif current_layout_name == 'tile':
        qtile.current_group.layout = 'columns'

home = os.path.expanduser('~')

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
    # layout monadtall
    Key([mod, "shift"], "space", lazy.layout.flip()),
    # layout MonadWide
    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.reset()),
    # Toggle between split and unsplit sides of stack.
    Key([mod, "shift"],"Return",lazy.layout.toggle_split(),desc="Toggle between split and unsplit sides of stack"),
    # Rofi
    Key([mod, "shift"], "m",  lazy.spawn(rofi), desc="Launch rofi"),
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
    Key([], "XF86AudioMute", lazy.spawn("wl-script volume_mute")),
    # Firefox
    Key([mod , "shift"] ,"y", lazy.spawn(myBrowser),desc="Launch Web Browser"),
    # session-desktop
    Key([mod , "shift"] ,"t", lazy.spawn(myChat),desc="Launch session-desktop"),
    # thunar
    Key([mod , "shift"] ,"f", lazy.spawn(myfm[0]),desc="Launch thunar file manager"),
    # screenshot
    Key([],"print", lazy.spawn("wl-script print_screenshot"),desc="Screenshot"),
    # keychord file manager 
    KeyChord([mod],"v", [
     # vifm (ports)
    Key([] ,"p", lazy.spawn(myTerm + ' -e '+ myfm[2] + ' /build/ports /build/ports'),desc="Launch vifm"),
    # ranger-fm (home)
    Key([] ,"h", lazy.spawn(myTerm + ' -e '+ myfm[1] + ' ' + home),desc="Launch ranger-fm"),
    # ranger-fm (.config)
    Key([] ,"c", lazy.spawn(myTerm + ' -e '+ myfm[1] + ' .config'),desc="Launch ranger-fm"),
    # ranger-fm (scripts)
    Key([] ,"s", lazy.spawn(myTerm + ' -e '+ myfm[1] + ' scripts'),desc="Launch ranger-fm"),
    ]),
    # exit qtile
    Key([mod], "q", lazy.shutdown(), desc="quit qtile"),
    # keychord power
    KeyChord([mod],"p", [
    ### shutdown 
    Key([], "s", lazy.spawn("wl-script power_off"),desc="shutdown"), 
    ### Reboot 
    Key([], "r", lazy.spawn("wl-script power_reboot"),desc="reboot"), 
    ]),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    # kill window
    Key([mod , "shift"], "n", lazy.window.kill(), desc="Kill focused window"),
    # change layout
    Key([mod], "t", change_layout(), desc="Change layout"),
    # Fullscreen
    Key([mod], "f", maximize_by_switching_layout(),lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),
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

