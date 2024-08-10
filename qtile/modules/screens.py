from libqtile import bar
from .widgets import *
from .globals import * 
from libqtile.config import Screen
## functions
def fc_separation():
    return  widget.Spacer(length=12)

screens = [
    Screen(
        bottom=bar.Bar([
                widget.TextBox(
                    fontsize=14,text='',background='#0d62ac',padding=14,
                    mouse_callbacks={'Button1':lambda:qtile.cmd_spawn(rofi)}),
                widget.GroupBox(highlight_method='block', block_highlight_text_color="#ffffff",
                    highlight_color=["#0d62ac","#0d62ac"],  this_current_screen_border="#0d62ac",
                    inactive="#484848", padding=8 ,rounded=False, borderwidth=4 ),
                
                widget.CurrentLayout(),
                widget.Prompt(prompt="Run "),
                widget.Spacer(length=8),
                widget.TextBox(
                    fontsize=14,
                    padding=3,
                    text='󰖯'
                    ),
                widget.WindowName(max_chars=50),
                #widget.Spacer(length=13), 
                widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=6,
                    text='󰧈'
                ),

                widget.Net(format='{down:.0f}{down_suffix} ↓↑ {up:.0f}{up_suffix}'),
                fc_separation(),
                widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=6,
                    text='󰖩'
                ),
                widget.Wlan(format='{essid} {percent:2.0%}'),
                fc_separation(),
                widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=6,
                    text='󰐸'
                ),
                widget.CPU(format='{freq_current}GHz {load_percent}%'),
                fc_separation(),
                widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=6,
                    text=''
                ),
                widget.Memory(measure_mem='G'),
                fc_separation(),
                widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=6,
                    text='󰋊'
                ),
                widget.DF(visible_on_warn=False,
                format='/ {r:.0f}%',
                partition='/',
                measure='G'
                ),
                fc_separation(),
                widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=6,
                    text=''
                ),
                widget.PulseVolume(),
                fc_separation(),
                widget.TextBox(
                    fontsize=14,
                    padding=6,
                    text='󰌽'
                ),
                widget.GenPollCommand(cmd="uname -r", shell=True,update_interval=None),
                fc_separation(),
                widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=6,
                    text='󰌌'
                ),
                widget.KeyboardLayout(
                    configured_keyboards=['us altgr-intl','es'],
                    display_map={ 'us altgr-intl': 'ansi', 'es':'es'}
                ),
                fc_separation(),
                widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                   # background="#0d62ac",
                    padding=6,
                    text='󰥔'
                ),
                widget.Clock(
                format="%A %d %b, %H:%M",
                #background="#0d62ac"
                ),
                ],
            32,
            background="#000000",
        ),

    ),
]

