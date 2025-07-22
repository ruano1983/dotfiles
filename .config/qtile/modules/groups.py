
from libqtile.config import Group, Match
from .keys import *

groups = [
    Group("1", label="dev", layout='monadtall'),
    Group("2", label="web", layout='max'),
    Group("3", label="chat", layout='max'),
    Group("4", label="media", layout='monadtall'),
    Group("5", label="file", layout='monadtall'),
    Group("6", label="term", layout='monadtall'),
    Group("7", label="gfx", layout='monadtall'),
    Group("8", label="misc", layout='monadtall'),

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
