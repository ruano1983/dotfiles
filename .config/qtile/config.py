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
 "type:keyboard": InputConfig(kb_repeat_rate=30,kb_repeat_delay=300,kb_layout='us',kb_variant='altgr-intl'),
}

command=shlex.split("swaybg -m fill -i " + wallpaper)
Popen(command, stdout=PIPE, stderr=PIPE)

wmname = "LG3D"
