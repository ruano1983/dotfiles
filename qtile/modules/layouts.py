from libqtile import layout

layouts = [
    layout.Columns(
            border_focus=["#0d62ac", "#0a4d84"],border_normal=["#111111"],border_width=2,fair=True,insert_position=1,change_size=30,border_on_single=True ),
    layout.MonadTall(
            border_focus=["#0d62ac", "#0a4d84"],border_normal=["#111111"],border_width=2,change_size=30,border_on_single=True ), 
    layout.MonadWide(
            border_focus=["#0d62ac", "#0a4d84"],border_normal=["#111111"],border_width=2,change_size=30,border_on_single=True ),
    layout.Max(
            border_focus=["#0d62ac", "#0a4d84"],border_normal=["#111111"],border_width=2, border_on_single=True ), 
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]
