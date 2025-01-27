from libqtile import bar
from .widgets import *
from .globals import *
import colors
from libqtile.config import Screen
# functions
def fc_separation(l=11):
    return  widget.Spacer(length=l)
def fc_textbox(icon,p=5):
    return widget.TextBox(fontsize=14,padding=p,text=icon)
def run_btm():
    qtile.spawn(myTerm + ' -e btm')

colors = colors.Argyls
screens = [
    Screen(
        # bar widgets bottom
        bottom=bar.Bar([
               fc_separation(l=4),
               widget.TextBox(text='',padding=5,mouse_callbacks={'Button1':lambda:qtile.spawn(rofi)}),
               fc_separation(l=6),
               widget.GroupBox(highlight_method='block',rounded=False,highlight_color=[colors[1]],
                               this_current_screen_border=colors[1],inactive="#383838",
                               foreground=colors[2], padding=5 ,spacing=4,borderwidth=4,
                               active="#F8F8F2",block_highlight_text_color=colors[0]),
                widget.CurrentLayoutIcon(padding=5,scale=0.50), 
                widget.CurrentLayout(padding=5), 
                fc_separation(l=6),
                widget.Prompt(prompt="Run "),
                fc_textbox(icon='󰖲'),        
                widget.WindowName(max_chars=77),
                fc_textbox(icon='󰧈'),
                widget.Net(format='{down:.0f}{up_suffix} ↑↓ {up:.0f}{down_suffix}',update_interval=2),
                fc_separation(),
                fc_textbox(icon='󰖩'),
                widget.Wlan(format='{percent:2.0%}'),
                fc_separation(),
                fc_textbox(icon='󰐸'),
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
                widget.Clock(format="%a %d %B"),
                fc_separation(),
                fc_textbox(icon='󰥔'),
                widget.Clock(format="%H:%M"),
                fc_separation(l=4),
        ],
            # size and background color
            36,
            background=colors[0],
            border_width=0,
        ),

    ),
]

