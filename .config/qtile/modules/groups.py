
from libqtile.config import Group, Match
from .keys import *

groups = [
    Group("1", label="1", layout='tile'),
    Group("2", label="2", layout='max'),
    Group("3", label="3", layout='max'),
    Group("4", label="4", layout='columns'),
    Group("5", label="5", layout='columns'),
    Group("6", label="6", layout='columns'),
    Group("7", label="7", layout='columns'),
    Group("8", label="8", layout='columns'),
    Group("9", label="9", layout='columns'),

]

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )
