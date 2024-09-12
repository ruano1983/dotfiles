from libqtile import layout

layouts = [
    layout.Columns(
            border_focus=["#b82016", "#b82016"],border_normal=["#111111"],border_width=1,fair=True,insert_position=1,change_size=30,border_on_single=True ),
    layout.MonadTall(
            border_focus=["#b82016", "#b82016"],border_normal=["#111111"],border_width=1,change_size=30,border_on_single=True ), 
    layout.MonadWide(
            border_focus=["#b82016", "#b82016"],border_normal=["#111111"],border_width=1,change_size=30,border_on_single=True ),
    layout.Max(
            border_focus=["#b82016", "#b82016"],border_normal=["#111111"],border_width=1, border_on_single=True ), 
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
