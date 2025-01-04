
from libqtile.config import Group, Match
from .keys import *

groups = [
    Group("1", label="1", layout='tile'),
    Group("2", label="2", layout='max'),
    Group("3", label="3", layout='max'),
    Group("4", label="4", layout='tile'),
    Group("5", label="5", layout='tile'),
    Group("6", label="6", layout='tile'),
    Group("7", label="7", layout='tile'),
    Group("8", label="8", layout='tile'),
    Group("9", label="9", layout='tile'),


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
