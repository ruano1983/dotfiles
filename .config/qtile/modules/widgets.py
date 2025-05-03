## widget default
from libqtile import widget
from libqtile import qtile
import colors
from .globals import *
colors = colors.argyls
# functions
def fc_separation(l=12):
    return  widget.Spacer(length=l)
def fc_textbox(icon,p=6):
    return widget.TextBox(fontsize=14,padding=p,text=icon)
def run_btm():
    qtile.spawn(myTerm + ' -e btm')

widget_defaults = dict(
    font="Noto Sans bold",
    fontsize=12,
    padding=5,
    foreground=colors[2],
)
extension_defaults = widget_defaults.copy()
primary_widgets = [
        fc_separation(l=1),
        widget.GroupBox(highlight_method='block',
                               rounded=False,
                               this_current_screen_border=colors[1],
                               inactive=colors[3],
                               active="#F8F8F2",
                               foreground=colors[2],
                               padding=6,
                               spacing=3,
                               borderwidth=4,
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
        fc_textbox(icon='󰧈'),
        widget.Net(format='{down:.0f}{up_suffix} ↑↓ {up:.0f}{down_suffix}',update_interval=2),
        fc_separation(),
        fc_textbox(icon='󰖩'),
        widget.Wlan(format='{percent:2.0%}'),
        fc_separation(),
        fc_textbox(icon=''),
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
        widget.Clock(format="%A %d %B"),
        fc_separation(),
        fc_textbox(icon='󰥔'),
        widget.Clock(format="%H:%M"),
        fc_separation(l=1),
]
