# My Qtile Settings.
My setup is based on modules: globals, hooks, groups, keys, layouts, widgets, screen, mouse, floating, theme.

My environment uses Wayland for the Qtile session.

My setup uses apps like rofi, alacrity, swaybg, grim, vifm, ranger, bottom, kanshi.
make sure you have them available, you can still substitute them.

My Qtile layout has a status bar with real-time information widgets on the right and workspaces on the left, including the name of the focused app. The taskbar has a black background color, and the active workspace is colored according to color themes.

The font I use is Noto Sans. Make sure you have it on your system.

for the widget icons I use nerd typography.

![desktop qtile](/images/1746388805.png)

*Created and distributed by Ivan Ruano Monjas*\
[My Github](https://github.com/ruano1983)

## config.py

This is the main file, it imports all modules and adds basic qtile configuration.

*the `wl_xcursor_theme` option it is used to change the mouse cursor theme and `wl_xcursor_size` for the size in the Wayland session*\
*the `kb_layout` option changes the keyboard layout, modify it depending on your keyboard.*

### import modules
```
from libqtile.utils import guess_terminal
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
```
### general options
```
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
```
### keyboard options and layout
```
wl_input_rules = {
 "type:keyboard": InputConfig(kb_repeat_rate=30,kb_repeat_delay=350,kb_layout='us',kb_variant='altgr-intl'),
}
```
### wallpaper with swaybg
```
command=shlex.split("swaybg -m fill -i " + wallpaper)
Popen(command, stdout=PIPE, stderr=PIPE)
```
## globals.py 

This module is for global variables such as wallpaper, web browser, chat application, etc.

The `myTerm` variable is the default terminal.
The `myBrowser` variable is the web browser.
The `myChat` variable is the default messaging application for the user.

To launch Rofi I use [this collection of themes](https://github.com/adi1090x/rofi)

**Note that the wallpaper URL is split in two to make it easier to change the wallpaper in the Python code.**

### global variables
```
import os
mod = "mod4"
myTerm = "alacritty"
myBrowser = "LibreWolf.x86_64.AppImage"
myfm = "vifm"
myfm2 = "ranger"
myChat = "session-desktop.AppImage"
```
### wallpaper
```
wallpaper = os.path.join(os.path.expanduser('~/Imágenes/wallpapers/'),'arquitectura/508887.jpg')
```
### rofi
```
rofi = os.path.expanduser('~/.config/rofi/launchers/type-2/launcher.sh')
power = os.path.expanduser('~/.config/rofi/powermenu/type-2/powermenu.sh')
```
## hooks.py

This module launches autostart.sh at startup.

```
from libqtile import hook
import os
import subprocess
qtile_path = os.path.join(os.path.expanduser('~'), ".config", "qtile")
# Autostart
@hook.subscribe.startup_once
def autostart():
    subprocess.call([os.path.join(qtile_path, 'autostart.sh')])
```
## groups.py

This module creates and organizes workspace names and their respective layouts.

### name of the workspaces

```
from libqtile.config import Group, Match
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
```
### workspace keybindings
```
for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )
```
## keys.py

This module creates keyboard shortcuts for switching between workspaces, launching applications, and special functions such as volume and power management.

### keybindings

| IMPORTANT KEYBINDINGS   | ASSOCIATED ACTION                      |
|-------------------------|----------------------------------------|
| MODKEY + RETURN         | opens terminal (alacritty)             |
| MODKEY + SHIFT + RETURN | opens run launcher (rofi)              |
| MODKEY + SHIFT + y      | opens run web browser (librewolf)      |
| MODKEY + SHIFT + f      | opens run file manager (thunar)        |
| MODKEY + SHIFT + n      | closes window with focus               |
| MODKEY + TAB            | rotates through the available layouts  |
| MODKEY + f              | full screen                            |
| MODKEY + SHIFT + c      | restarts qtile                         |
| MODKEY + q              | quits qtile                            |
| MODKEY + 1-9            | switch focus to workspace (1-9)        |
| MODKEY + SHIFT + 1-9    | send focused window to workspace (1-9) |
| PRINT                   | screenshot                             |

```
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
    Key([mod, "shift"], "Return",  lazy.spawn(rofi), desc="Launch rofi"),
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
```
## layout.py

This module activates the layout types and their respective appearance.

### default layout options
```
from libqtile import layout
from .theme import *
layout_theme = {"border_width": 1,
                "margin": 0,
                "border_focus": colors[1],
                "border_normal": colors[3],
                "border_on_single":True
                }
```
### layouts
```
layouts = [
    layout.Max(
            **layout_theme),
    layout.Columns(
            **layout_theme,fair=True,insert_position=1),
    layout.Tile(
            **layout_theme,ratio=0.55),
    layout.MonadTall(
            **layout_theme),
    layout.MonadWide(
            **layout_theme),
]
```
## widgets.py

This module creates the widgets to then display them in the status bar.\
**For the WLAN widget, change the interface option to your system's. You can find it with the ifconfig or iwconfig commands.**

### widget functions
```
from libqtile import widget
from libqtile import qtile
from .theme import *
from .globals import *
# functions
def fc_separation(l=12):
    return  widget.Spacer(length=l)
def fc_textbox(icon,p=6):
    return widget.TextBox(fontsize=14,padding=p,text=icon)
def run_btm():
    qtile.spawn(myTerm + ' -e btm')
```
### default widget options
```
widget_defaults = dict(
    font="Noto Sans bold",
    fontsize=12,
    padding=5,
    foreground=colors[2],
)
extension_defaults = widget_defaults.copy()
```
### primary widgets
```
primary_widgets = [
        fc_separation(l=1),
        widget.GroupBox(highlight_method='block',
                               rounded=False,
                               this_current_screen_border=colors[1],
                               inactive=colors[3],
                               active=colors[4],
                               foreground=colors[2],
                               padding=6,
                               spacing=3,
                               borderwidth=4,
                               block_highlight_text_color=colors[0],
                               disable_drag=True,
                               hide_unused=True
                               ),
        widget.CurrentLayoutIcon(padding=6,scale=0.50),
        widget.CurrentLayout(padding=6),
        fc_separation(l=6),
        widget.Prompt(prompt="Run "),
        fc_textbox(icon='󰖲'),
        widget.WindowName(max_chars=77),
        fc_textbox(icon='󰧈'),
        widget.Net(format='{down:.0f}{up_suffix} ↑↓ {up:.0f}{down_suffix}',update_interval=2),
        fc_separation(),
        fc_textbox(icon='󰖩'),
        widget.Wlan(format='{percent:2.0%}',interface='wlan0'),
        fc_separation(),
        fc_textbox(icon=''),
        widget.CPU(format='{freq_current}GHz {load_percent}%',update_interval=1,mouse_callbacks = {'Button1': lambda: run_btm()}),
        fc_separation(),
        fc_textbox(icon=''),
        widget.Memory(format='{MemUsed: .1f}{mm}/{MemTotal: .1f}{mm}',measure_mem='G',mouse_callbacks = {'Button1': lambda: run_btm()}),
        fc_separation(),
        fc_textbox(icon='󰆼'),
        widget.DF(visible_on_warn=False,format='/ {r:.0f}%',partition='/',measure='G', mouse_callbacks = {'Button1': lambda: run_btm()}),
        fc_separation(),
        fc_textbox(icon='󰌽'),
        widget.GenPollCommand(cmd="uname -r", shell=True,update_interval=None),
        fc_separation(),
        fc_textbox(icon=''),
        widget.PulseVolume(),
        fc_separation(),
        fc_textbox(icon='󰌌'),
        widget.KeyboardLayout(configured_keyboards=['us altgr-intl','es'],display_map={ 'us altgr-intl': 'ansi', 'es':'es'}),
        fc_separation(),
        fc_textbox(icon='󰽢'),
        widget.OpenWeather(app_key="bb789b9c68ed3ee12c7f8d99d62f3c3b",location='Fuenlabrada', format='{weather} {main_temp:.0f}°{units_temperature}'),
        fc_separation(),
        fc_textbox(icon=''),
        widget.Clock(format="%A %d %B"),
        fc_separation(),
        fc_textbox(icon='󰥔'),
        widget.Clock(format="%H:%M"),
        fc_separation(l=1),
]
```
## screens.py

This module displays the status bar with all the widgets created with the widgets.py module.

```
from libqtile import bar
from .widgets import *
from .theme import *
from libqtile.config import Screen

# bar
def status_bar(widgets):
    return bar.Bar(widgets, 38,
            background=colors[0],
            border_width=0)

screens = [
    Screen(
        bottom=status_bar(primary_widgets))
]
```
## mouse.py

This module records the movement of floating windows.

```
from libqtile.config import Click, Drag
from libqtile.lazy import lazy
from .globals import *

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating().when(when_floating=True), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
```
## floating.py

This module creates the rules for floating windows.

```
from libqtile import layout
from libqtile.config import Match
from .theme import *

floating_layout = layout.Floating(
    border_focus=colors[1],
    border_width=1,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),   # gitk
        Match(wm_class="dialog"),         # dialog boxes
        Match(wm_class="download"),       # downloads
        Match(wm_class="error"),          # error msgs
    ]
)
```
## theme.py

This module selects the color theme.

```
import colors
colors = colors.Nube
```

## colors.py

This file contains all the color schemes.

```
Nube = [
    ["#121212" , "#121212"], # BG BLACK
    ["#2e86c1" , "#2e86c1"], # PRIMARY BLUE
    ["#dfdfdf" , "#dfdfdf"], # FG WHITE
    ["#383838" , "#383838"]  # BLACK
    ] ...
```
## autostart.sh

startup script.

```
kanshi &
dbus-update-activation-environment --all &
/usr/libexec/pipewire-launch.sh &
/usr/libexec/polkit-gnome-authentication-agent-1 &
/usr/bin/dunst -config ~/.config/dunst/dunstrc-qtile &
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita' &
gsettings set org.gnome.desktop.interface icon-theme 'Papirus' &
gsettings set org.gnome.desktop.interface font-name 'Noto Sans 8' &
```
## images

![desktop rofi](/images/1746403145.png)

![desktop rofi2](/images/1746404724.png)

![desktop cava](/images/1746405142.png)

