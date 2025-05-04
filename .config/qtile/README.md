# My qtile settings.
My setup is based on modules: keys, groups, screen, globals, floating, hooks, layouts, mouse, and widgets.
![desktop qtile](/images/1746388805.png)

## config.py

This is the main file, it imports all modules and adds basic qtile configuration.

```from libqtile.utils import guess_terminal
from libqtile.backend.wayland import *
from modules.keys import *
from modules.groups import *
from modules.layouts import *
from modules.screens import *
from modules.mouse import * 
from modules.hooks import *  
from modules.floating import *
from modules.globals import *
import shlex
import os
from subprocess import Popen, PIPE

wl_xcursor_theme = "Quintom_Snow"
wl_xcursor_size = 24

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True

wl_input_rules = {
 "type:keyboard": InputConfig(kb_repeat_rate=30,kb_repeat_delay=350,kb_layout='us',kb_variant='altgr-intl'),
 "2362:9488:PixArt USB Optical Mouse": InputConfig(pointer_accel=0.2,accel_profile='adaptive'),
}

command=shlex.split("swaybg -m fill -i " + wallpaper)
Popen(command, stdout=PIPE, stderr=PIPE)

wmname = "LG3D"

```
## globals.py 

This file is for global variables such as wallpaper, web browser, chat application, etc.

**Note that the wallpaper URL is split in two to make it easier to change the wallpaper in the Python code.**

```import os
mod = "mod4"
myTerm = "alacritty"
myBrowser = "LibreWolf.x86_64.AppImage"
myfm = "vifm"
myfm2 = "ranger"
myChat = "session-desktop.AppImage"
file_wallpaper = "arquitectura/508887.jpg"
wallpaper = os.path.join(os.path.expanduser('~/Imágenes/wallpapers/'), file_wallpaper)
rofi = os.path.expanduser('~/.config/rofi/launchers/type-2/launcher.sh')
power = os.path.expanduser('~/.config/rofi/powermenu/type-2/powermenu.sh')
```
## hooks.py

This file launches autostart.sh at startup.

```from libqtile import hook
import os
import subprocess
qtile_path = os.path.join(os.path.expanduser('~'), ".config", "qtile")
# Autostart
@hook.subscribe.startup_once
def autostart():
    subprocess.call([os.path.join(qtile_path, 'autostart.sh')])
```
## groups.py

This file creates and organizes the names of the groups and their respective layouts.

```from libqtile.config import Group, Match
from .keys import *

groups = [
    Group("1", label="1", layout='tile'),
    Group("2", label="2", layout='max'),
    Group("3", label="3", layout='max'),
    Group("4", label="4", layout='columns'),
    Group("5", label="5", layout='columns'),
    Group("6", label="6", layout='columns'),
    Group("7", label="7", layout='columns'),
    Group("8", label="8", layout='columns'),
    Group("9", label="9", layout='columns'),

]

for i in groups:
    keys.extend(
        [
            # mod1 + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )
```
## keys.py

This file records the key shortcuts for launching applications and special functions such as volume or shutting down and restarting the PC.

```keys = [
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
    Key([], "XF86AudioMute", lazy.spawn("wl-script volume_mute")),
    # Firefox
    Key([mod , "shift"] ,"y", lazy.spawn(myBrowser),desc="Launch Web Browser"),
    # session-desktop
    Key([mod , "shift"] ,"t", lazy.spawn(myChat),desc="Launch session-desktop"),
    # thunar
    Key([mod , "shift"] ,"f", lazy.spawn("thunar"),desc="Launch thunar file manager"),
    # screenshot
    Key([],"print", lazy.spawn("wl-script print_screenshot"),desc="Screenshot"),
    # keychord file manager
    KeyChord([mod],"v", [
     # vifm (ports)
    Key([] ,"p", lazy.spawn(myTerm + ' -e '+ myfm + ' /build/ports /build/ports'),desc="Launch vifm"),
    # ranger-fm (home)
    Key([] ,"h", lazy.spawn(myTerm + ' -e '+ myfm2 + ' ' + home_dir),desc="Launch ranger-fm"),
    # ranger-fm (.config)
    Key([] ,"c", lazy.spawn(myTerm + ' -e '+ myfm2 + ' .config'),desc="Launch ranger-fm"),
    # ranger-fm (scripts)
    Key([] ,"s", lazy.spawn(myTerm + ' -e '+ myfm2 + ' scripts'),desc="Launch ranger-fm"),
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
```
