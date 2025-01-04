from libqtile import layout
import colors
colors = colors.Argyls

layouts = [
    layout.Columns(
            margin=0,border_focus=colors[1],border_normal=colors[3],border_width=1,fair=True,insert_position=1,change_size=30,border_on_single=True ),
    layout.MonadTall(
            margin=0,border_focus=colors[1],border_normal=colors[3],border_width=1,change_size=30,border_on_single=True ), 
    layout.MonadWide(
            margin=0,border_focus=colors[1],border_normal=colors[3],border_width=1,change_size=30,border_on_single=True ),
    layout.Max(
            margin=0,border_focus=colors[1],border_normal=colors[3],border_width=1, border_on_single=True ), 
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.RatioTile(),
    layout.Tile(
         margin=0,border_focus=colors[1],border_normal=colors[3],border_width=1,change_size=30,border_on_single=True,ratio=0.6 ), 
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]
