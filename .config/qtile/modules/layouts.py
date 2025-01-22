from libqtile import layout
import colors
colors = colors.Argyls

layout_theme = {"border_width": 1,
                "margin": 0,
                "border_focus": colors[1],
                "border_normal": colors[3],
                "change_size": 30,
                "border_on_single":True 
                }

layouts = [
    layout.Tile(
            **layout_theme,ratio=0.56),  
    layout.Max(
            **layout_theme), 
    # Layout.Columns(
    #        **layout_theme,fair=True,insert_position=1 ),
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
