from libqtile import bar
from .widgets import *
from .globals import * 
from libqtile.config import Screen
wallpapers = os.path.expanduser('~/Imágenes/wallpapers/superheroes/batman-minimal-5k-j0.jpg')
#logo_start = os.path.expanduser("~/qtile_venv/qtile/test/scripts/qtile-logo-blue.svg")
logo_start = os.path.expanduser("~/.config/qtile/icons/logo.svg")
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
                widget.Spacer(length=7),
                widget.TextBox(
                    fontsize=14,
                    padding=2,
                    text='󰖲'
                    ),
                widget.WindowName(max_chars=80),
                widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=5,
                    text='󰖩'
                ),
                widget.Wlan(format='{essid} {percent:2.0%}'),
                widget.Spacer(length=12),

                   widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=5,
                    text=''
                ),

                widget.CPU(format='{freq_current}GHz {load_percent}%'),
                widget.Spacer(length=12),

                 widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=5,
                    text=''
                ),
                widget.Memory(measure_mem='G'),
                widget.Spacer(length=12),

                widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=5,
                    text=''
                ),
                widget.PulseVolume(),
                
                widget.Spacer(length=12),
                widget.TextBox(
                    fontsize=14,
                    padding=5,
                    text='󰌽'

                ),
                widget.GenPollCommand(cmd="uname -r", shell=True,update_interval=None),


                widget.Spacer(length=12),
                widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=5,
                    text=''
                ),
                widget.KeyboardLayout(
                        configured_keyboards=['us altgr-intl','es'],
                        display_map={ 'us altgr-intl': 'ansi', 'es':'es'}
                ),
                widget.Spacer(length=12),
                widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=5,
                    text=''
                ),
                widget.Clock(format="%A %d %b, %H:%M"),
                ],
            30,
            background="#000000",
        ),

    ),
]

