from libqtile import layout
from libqtile.config import Match
from .theme import *

floating_layout = layout.Floating(
    border_focus=colors[1],
    border_width=1,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),   # gitk
        Match(wm_class="dialog"),         # dialog boxes
        Match(wm_class="download"),       # downloads
        Match(wm_class="error"),          # error msgs
        Match(wm_class="ssh-askpass"),    # ssh-askpass
        Match(title="branchdialog"),      # gitk
        Match(title="pinentry"),          # GPG key password entry
    ]
)

