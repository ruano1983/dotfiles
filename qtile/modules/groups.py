
from libqtile.config import Group, Match
from .keys import *



groups = [
    Group("1", label="term"),
    Group("2", label="web"),
    Group("3", label="chat"),
    Group("4", label="files"),
    Group("5", label="doc"),
    Group("6", label="music"),
    Group("7", label="photo"),
    Group("8", label="others"),


]

for i in groups:
    keys.extend(
        [
            # mod1 + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )
