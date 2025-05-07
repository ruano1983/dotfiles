from libqtile import bar
from .widgets import *
from .theme import *
from libqtile.config import Screen


# bar
def status_bar(widgets):
    return bar.Bar(widgets, 38,
            background=colors[0],
            border_width=0)

screens = [
    Screen(
        bottom=status_bar(primary_widgets))
]
            



