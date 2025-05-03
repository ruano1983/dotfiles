from libqtile import bar
from .widgets import *
import colors
from libqtile.config import Screen
colors = colors.argyls

# bar
def status_bar(widgets):
    return bar.Bar(widgets, 38,
            background=colors[0],
            border_width=0)

screens = [
    Screen(
        bottom=status_bar(primary_widgets))
]
            



