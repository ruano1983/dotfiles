##########################
#########################
########## CONFIG QTILE ###############

from libqtile.utils import guess_terminal
from libqtile.backend.wayland import InputConfig
from modules.keys import *
from modules.groups import *
from modules.layouts import *
from modules.screens import *
from modules.mouse import * 
from modules.hooks import *  
from modules.globals import *
import shlex
import os
from subprocess import Popen, PIPE

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = {
 "type:keyboard": InputConfig(kb_layout="us altgr-intl"),
}
command=shlex.split("swaybg -m fill -i " + wallpaper)
Popen(command, stdout=PIPE, stderr=PIPE)

wmname = "LG3D"
