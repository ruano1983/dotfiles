## widget default
from libqtile import widget
from libqtile import qtile
import colors
colors = colors.Argyls
widget_defaults = dict(
    font="Noto Sans bold",
    fontsize=12,
    padding=4,
    foreground=colors[2],
)
extension_defaults = widget_defaults.copy()
