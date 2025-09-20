
from libqtile.config import Group, Match
from .keys import *

groups = [
    Group("1", label="", layout='monadtall'),
    Group("2", label="", layout='max'),
    Group("3", label="", layout='max'),
    Group("4", label="", layout='monadtall'),
    Group("5", label="", layout='monadtall'),
    Group("6", label="", layout='monadtall'),
    Group("7", label="", layout='monadtall'),
    Group("8", label="", layout='monadtall'),
    Group("9", label="", layout='monadtall'),

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
