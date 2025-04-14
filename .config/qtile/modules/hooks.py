from libqtile import hook
import os
import subprocess
qtile_path = os.path.join(os.path.expanduser('~'), ".config", "qtile")
# Autostart
@hook.subscribe.startup_once
def autostart():
    subprocess.call([os.path.join(qtile_path, 'autostart.sh')])
