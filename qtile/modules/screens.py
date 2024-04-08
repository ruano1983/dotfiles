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
                widget.Image(
                    filename=logo_start, margin=3,mouse_callbacks={'Button1': lambda : qtile.cmd_spawn(rofi)}),
                widget.GroupBox(
                    highlight_method='block' , block_highlight_text_color="#ffffff", highlight_color=["#0d62ac","#0d62ac"],  this_current_screen_border="#0d62ac",inactive="#484848", rounded=False, borderwidth=4 ),
                widget.CurrentLayout(),
                widget.Prompt(prompt="Run "),
                widget.Spacer(length=7),
                widget.WindowName(max_chars=110),
                widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=0,
                    text='󰖩 '
                ),
                widget.Wlan(format='{essid} {percent:2.0%}'),
                widget.Spacer(length=12),

                   widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=0,
                    text=' '
                ),

                widget.CPU(format='{freq_current}GHz {load_percent}%'),
                widget.Spacer(length=12),

                 widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=0,
                    text=' '
                ),
                widget.Memory(measure_mem='G'),
                widget.Spacer(length=12),

                widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=0,
                    text=' '
                ),
                widget.PulseVolume(),
                widget.Spacer(length=12),
                widget.TextBox(
                    #ont='Ubuntu Nerd Font',
                    fontsize=14,
                    padding=0,
                    text=' '
                ),
                widget.Clock(format="%A %d %b, %H:%M"),
                ],
            30,
            background="#000000",
        ),

    ),
]

