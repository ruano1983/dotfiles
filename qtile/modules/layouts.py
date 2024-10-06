from libqtile import layout
color=["#BD93F9","#8BE9FD"]

layouts = [
    layout.Columns(
            margin=4,border_focus=[color[0],color[0]],border_normal=color[1],border_width=1,fair=True,insert_position=1,change_size=30,border_on_single=True ),
    layout.MonadTall(
            margin=4,border_focus=[color[0],color[0]],border_normal=color[1],border_width=1,change_size=30,border_on_single=True ), 
    layout.MonadWide(
            margin=4,border_focus=[color[0],color[0]],border_normal=color[1],border_width=1,change_size=30,border_on_single=True ),
    layout.Max(
            margin=4,border_focus=[color[0],color[0]],border_normal=color[1],border_width=1, border_on_single=True ), 
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.RatioTile(),
    layout.Tile(
         margin=4,border_focus=[color[0],color[0]],border_normal=color[1],border_width=1,change_size=30,border_on_single=True,ratio=0.6 ), 
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]
