from libqtile import bar
from .widgets import *
from .globals import * 
from libqtile.config import Screen
## functions
def fc_separation():
    return  widget.Spacer(length=10)
def fc_textbox(icon,p=6):
    return widget.TextBox(fontsize=14,padding=p,text=icon)
def run_btm():
    qtile.cmd_spawn(terminal + ' -e btm')
def run_vol():
    qtile.cmd_spawn('pavucontrol')
screens = [
    Screen(
        bottom=bar.Bar([
                widget.TextBox(
                    fontsize=14,text='',background='#0d62ac',padding=14,
                    mouse_callbacks={'Button1':lambda:qtile.cmd_spawn(rofi)}),
                widget.GroupBox(highlight_method='block', block_highlight_text_color="#ffffff",
                    highlight_color=["#0d62ac","#0d62ac"],  this_current_screen_border="#0d62ac",
                    inactive="#484848", padding=8 ,rounded=False, borderwidth=4 ),
                #widget.CurrentLayoutIcon(scale=0.5),
                widget.CurrentLayout(),
                widget.Prompt(prompt="Run "),
                widget.Spacer(length=8),
                fc_textbox(icon='󰖯',p=3),        
                widget.WindowName(max_chars=50),
                fc_textbox(icon='󰧈'),
                widget.Net(format='{down:.0f}{down_suffix} ↓↑ {up:.0f}{up_suffix}',update_interval=2),
                fc_separation(),
                fc_textbox(icon='󰖩'),
                widget.Wlan(format='{percent:2.0%}'),
                fc_separation(),
                fc_textbox(icon='󰐸'),
                widget.CPU(format='{freq_current}GHz {load_percent}%',update_interval=1,mouse_callbacks = {'Button1': lambda: run_btm()}),
                fc_separation(),
                fc_textbox(icon=''),
                widget.Memory(measure_mem='G',mouse_callbacks = {'Button1': lambda: run_btm()}),
                fc_separation(),
                fc_textbox(icon='󰋊'),
                widget.DF(visible_on_warn=False,format='/ {r:.0f}%',partition='/',measure='G', mouse_callbacks = {'Button1': lambda: run_btm()}),
                fc_separation(),
                fc_textbox(icon=''),
                widget.PulseVolume(mouse_callbacks = {'Button1': lambda: run_vol()}),
                fc_separation(),
                fc_textbox(icon='󰌽'),
                widget.GenPollCommand(cmd="uname -r", shell=True,update_interval=None),
                fc_separation(),
                fc_textbox(icon='󰌌'),
                widget.KeyboardLayout(configured_keyboards=['us altgr-intl','es'],display_map={ 'us altgr-intl': 'ansi', 'es':'es'}),
                fc_separation(),
                widget.OpenWeather(app_key="bb789b9c68ed3ee12c7f8d99d62f3c3b",location='Fuenlabrada', format='{icon} {weather_details} {main_temp:.0f}°{units_temperature}'),
                fc_separation(),
                fc_textbox(icon='󰥔'),
                widget.Clock(format="%A %d %b %H:%M"),
                fc_separation(),
        ],
            32,
            background="#000000",
        ),

    ),
]

