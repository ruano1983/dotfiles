from libqtile import widget
from libqtile import qtile
from .theme import *
from .globals import *
# functions
def fc_separation(l=11):
    return  widget.Spacer(length=l)
def run_btm():
    qtile.spawn(myTerm + ' -e btm')
def run_blueman():
    qtile.spawn(myTerm + ' -e bluetui')

widget_defaults = dict(
    font="Ubuntu Bold",
    fontsize=13,
    padding=4,
    foreground=colors[2],
)
extension_defaults = widget_defaults.copy()
primary_widgets = [
        fc_separation(l=1),
        widget.Image(filename='/home/ivanruano83/diseño/frikios/frikios_simple.svg',margin=4),
        widget.GroupBox(highlight_method='text',
                        rounded=True,
                        this_current_screen_border=colors[1],
                        inactive=colors[3],
                        active=colors[4],
                        foreground=colors[2],
                        padding=7,
                        spacing=2,
                        borderwidth=4,
                        block_highlight_text_color=colors[0],
                        disable_drag=True,
                        hide_unused=False
                        ),
        widget.TextBox(
                 text = '|',
                 foreground = colors[2],
                 padding = 6,
                 ),

        widget.CurrentLayout(foreground=colors[2]),
        widget.Spacer(),
        widget.Bluetooth(default_text='{num_connected_devices} connected',device_format='{name}{battery_level} [{symbol}]',
                         foreground=colors[2],
                         fmt='  {}',
                         mouse_callbacks = {'Button1': lambda: run_blueman()}),
        fc_separation(),
        widget.Wlan(format='{percent:2.0%}',
                    foreground=colors[2],
                    fmt='󰖩   {}',
                    interface = 'wlp5s0',
                    update_interval=10),
        fc_separation(),
        widget.CPU(format=' {freq_current}GHz {load_percent}%',
                   fmt = '  Cpu: {}',
                   foreground=colors[2],
                   update_interval=1,
                   mouse_callbacks = {'Button1': lambda: run_btm()}),
        fc_separation(),
        widget.ThermalSensor(tag_sensor='Tccd1',
                             threshold=85.0,
                             fmt='  Temp:  {}',
                             foreground=colors[2],
                             foreground_alert='f0614e',
                             mouse_callbacks = {'Button1': lambda: run_btm()}),
        fc_separation(),
        widget.Memory(format='{MemUsed: .1f}{mm}', 
                      fmt = '🖥️  Mem: {}',
                      measure_mem='G',
                      foreground=colors[2],
                      mouse_callbacks = {'Button1': lambda: run_btm()}),
        fc_separation(),
        widget.GenPollCommand(cmd="uname -r", 
                              shell=True,update_interval=None,
                              fmt = '   Linux:  {}',
                              foreground=colors[2]),
        fc_separation(),
        widget.DF(visible_on_warn=False,format='{r:.0f}{m}',
                  fmt = '🖴  Disk:  {}',
                  partition='/',
                  measure='G',
                  foreground=colors[2], 
                  mouse_callbacks = {'Button1': lambda: run_btm()}),
        fc_separation(),
        widget.PulseVolume(mute_format="mute",
                           step=4,fmt='   Vol:  {}',
                           foreground=colors[2]),
        fc_separation(),
        widget.KeyboardLayout(configured_keyboards=['us altgr-intl','es'],
                              display_map={ 'us altgr-intl': 'ansi', 'es':'es'},
                              fmt='     {}',
                              foreground=colors[2]),
        fc_separation(),
        widget.Clock(format="%a %d %b %H:%M",
                     fmt='   {}',
                     foreground=colors[2]),
        fc_separation(l=1),
]
