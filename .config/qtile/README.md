# My Qtile Settings.
My setup is based on modules: globals, hooks, groups, keys, layouts, widgets, screen, mouse, floating, theme.

My environment uses Wayland for the Qtile session.

My setup uses apps like [rofi](https://github.com/lbonn/rofi?tab=readme-ov-file#wayland-support), [alacrity](https://alacritty.org/), [swaybg](https://github.com/swaywm/swaybg), [grim](https://gitlab.freedesktop.org/emersion/grim), [vifm](https://vifm.info/), [ranger](https://ranger.github.io/), [bottom](https://github.com/ClementTsang/bottom), [kanshi](https://gitlab.freedesktop.org/emersion/kanshi).
make sure you have them available, you can still substitute them.

![desktop qtile](/images/1746967161.png)

My Qtile layout has a status bar with real-time information widgets on the right and workspaces on the left, including the name of the focused app. The taskbar has a black background color, and the active workspace is colored according to color themes.

The font I use is Ubuntu Bold. Make sure you have it on your system.

for the widget icons I use nerd typography.

*Created and distributed by Ivan Ruano Monjas*\
[My Github](https://github.com/ruano1983)

## config.py

This is the main file, it imports all modules and adds basic qtile configuration.

*the `wl_xcursor_theme` option it is used to change the mouse cursor theme and `wl_xcursor_size` for the size in the Wayland session*\
*the `kb_layout` option changes the keyboard layout, modify it depending on your keyboard.*

### Import modules
```
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
### General options
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
### Keyboard options and layout
```
wl_input_rules = {
 "type:keyboard": InputConfig(kb_repeat_rate=30,kb_repeat_delay=350,kb_layout='us',kb_variant='altgr-intl'),
}
```
### Wallpaper with swaybg
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

### Variables
```
import os
mod = "mod4"
myTerm = "alacritty"
myBrowser = "LibreWolf.x86_64.AppImage"
myfm = ("thunar" , "ranger" , "vifm")
myChat = "session-desktop.AppImage"
```
### Wallpaper
```
wallpaper = os.path.join(os.path.expanduser('~/Imágenes/wallpapers/'),'arquitectura/508887.jpg')
```
### Rofi
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

The workspaces are named 1-0 the MOD+1-0

### Name of the workspaces

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
    Group("0", label="0", layout='columns'),

]
```
### Workspace keybindings
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

This module creates keyboard shortcuts for switching between workspaces, launching applications, **for special actions use the `wl-script` script**.

### Keybindings

| IMPORTANT KEYBINDINGS   | ASSOCIATED ACTION                      |
|-------------------------|----------------------------------------|
| MODKEY + RETURN         | opens terminal (alacritty)             |
| MODKEY + SHIFT + m      | opens run launcher (rofi)              |
| MODKEY + SHIFT + y      | opens run web browser (librewolf)      |
| MODKEY + SHIFT + f      | opens run file manager (thunar)        |
| MODKEY + v (keychord) h | opens run file manager (ranger)        |
| MODKEY + SHIFT + n      | closes window with focus               |
| MODKEY + TAB            | rotates through the available layouts  |
| MODKEY + f              | full screen                            |
| MODKEY + SHIFT + c      | restarts qtile                         |
| MODKEY + q              | quits qtile                            |
| MODKEY + 1-9            | switch focus to workspace (1-9)        |
| MODKEY + SHIFT + 1-9    | send focused window to workspace (1-9) |
| PRINT                   | screenshot                             |
| MODKEY + p (keychord) r    | reboot                                 |
| MODKEY + p (keychord) s    | power off                              |
```
primary_widgets = [
        fc_separation(l=1),
        widget.GroupBox(highlight_method='block',rounded=False,this_current_screen_border=colors[1],
                        inactive=colors[3],active=colors[4],foreground=colors[2],
                        padding=6,spacing=4,borderwidth=4,
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
        fc_textbox(icon=''),
        widget.Bluetooth(default_text='{num_connected_devices} connected',mouse_callbacks = {'Button1': lambda: run_blueman()}),
        fc_separation(),
        fc_textbox(icon='󰖩'),
        widget.Wlan(format='{percent:2.0%}',interface='wlan0'),
        fc_separation(),
        fc_textbox(icon=''),
        widget.CPU(format='{freq_current}GHz {load_percent}%',update_interval=1,mouse_callbacks = {'Button1': lambda: run_btm()}),
        fc_separation(),
        fc_textbox(icon=''),
        widget.ThermalSensor(tag_sensor='Tccd1',threshold=85.0,foreground_alert='f0614e'),
        fc_separation(),
        fc_textbox(icon=''),
        widget.Memory(format='{MemUsed: .1f}{mm} /{MemTotal: .1f}{mm}',measure_mem='G',mouse_callbacks = {'Button1': lambda: run_btm()}),
        fc_separation(),
        fc_textbox(icon='󰆼'),
        widget.DF(visible_on_warn=False,format='/ {r:.0f}%',partition='/',measure='G', mouse_callbacks = {'Button1': lambda: run_btm()}),
        fc_separation(),
        fc_textbox(icon='󰌽'),
        widget.GenPollCommand(cmd="uname -r", shell=True,update_interval=None),
        fc_separation(),
        fc_textbox(icon=''),
        widget.PulseVolume(mute_format="mute",step=4),
        fc_separation(),
        fc_textbox(icon='󰌌'),
        widget.KeyboardLayout(configured_keyboards=['us altgr-intl','es'],display_map={ 'us altgr-intl': 'ansi', 'es':'es'}),
        fc_separation(),
        fc_textbox(icon='󰽢'),
        widget.OpenWeather(app_key="bb789b9c68ed3ee12c7f8d99d62f3c3b",location='Fuenlabrada', format='{weather} {main_temp:.0f}°{units_temperature}'),
        fc_separation(),
        fc_textbox(icon='󰥔'),
        widget.Clock(format="%a %d %b %H:%M"),
        fc_separation(l=1),
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
### Layouts
```
layouts = [
    layout.Tile(
            **layout_theme,ratio=0.55),
    layout.Max(
            **layout_theme),
    layout.Columns(
            **layout_theme,fair=True,insert_position=1),
    layout.MonadTall(
            **layout_theme),
    layout.MonadWide(
            **layout_theme),
]
```
## widgets.py

This module creates the widgets to then display them in the status bar.

widgets included are Spacer, Groupbox, CurrentLayoutIcon, TextBox, Prompt, WindowName, wlan, bluetooth, Cpu, Memory, DF, GellPollComand, PulseVolume, KeyboardLayout, OpenWeather, clock.

**For the WLAN widget, change the interface option to your system's. You can find it with the ifconfig or iwconfig commands.**

### Widget functions
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
def run_blueman():
    qtile.spawn("blueman-manager")
```
### Default widget options
```
widget_defaults = dict(
    font="Ubuntu bold",
    fontsize=12,
    padding=5,
    foreground=colors[2],
)
extension_defaults = widget_defaults.copy()
```
### Widgets
```
primary_widgets = [
        fc_separation(l=1),
        widget.GroupBox(highlight_method='block',rounded=False,this_current_screen_border=colors[1],
                        inactive=colors[3],active=colors[4],foreground=colors[2],
                        padding=6,spacing=4,borderwidth=4,
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
        fc_textbox(icon=''),
        widget.Bluetooth(default_text='{num_connected_devices} connected'),
        fc_separation(),
        fc_textbox(icon='󰖩'),
        widget.Wlan(format='{percent:2.0%}',interface='wlan0'),
        fc_separation(),
        fc_textbox(icon=''),
        widget.CPU(format='{freq_current}GHz {load_percent}%',update_interval=1,mouse_callbacks = {'Button1': lambda: run_btm()}),
        fc_separation(),
        fc_textbox(icon=''),
        widget.ThermalSensor(tag_sensor='Tccd1',threshold=85.0,foreground_alert='f0614e'),
        fc_separation(),
        fc_textbox(icon=''),
        widget.Memory(format='{MemUsed: .1f}{mm} /{MemTotal: .1f}{mm}',measure_mem='G',mouse_callbacks = {'Button1': lambda: run_btm()}),
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
        fc_textbox(icon='󰥔'),
        widget.Clock(format="%a %d %b %H:%M"),
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
    Drag([mod], "Button3", lazy.window.set_size_floating().when(when_floating=True), start=lazy.window.get_size()),
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
        Match(wm_class="ssh-askpass"),    # ssh-askpass
        Match(title="branchdialog"),      # gitk
        Match(title="pinentry"),          # GPG key password entry
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
    ["#121212" , "#121212"], # bg
    ["#2e86c1" , "#2e86c1"], # blue
    ["#dfdfdf" , "#dfdfdf"], # fg
    ["#383838" , "#383838"]  # black
    ] ...
```
## autostart.sh

startup script.

```
#!/bin/bash
COLORSCHEME=argyls
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

```
## images

![desktop rofi](/images/1746968394.png)

![desktop rofi2](/images/1746968398.png)

![desktop cava](/images/1746967158.png)

