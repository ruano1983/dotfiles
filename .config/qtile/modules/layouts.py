from libqtile import layout
from .theme import *
layout_theme = {"border_width": 1,
                "margin": 0,
                "border_focus": colors[1],
                "border_normal": colors[3],
                "border_on_single":True 
                }

layouts = [
    layout.Max(
            **layout_theme), 
    layout.Columns(
            **layout_theme,fair=True,insert_position=1),
    layout.Tile(
            **layout_theme,ratio=0.55),  
    layout.MonadTall(
            **layout_theme), 
    layout.MonadWide(
            **layout_theme),
    
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]
