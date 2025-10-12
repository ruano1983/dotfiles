from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class ColorScheme(ColorScheme):
    progress_bar_color = green

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        if context.in_browser:
            if context.selected:
                attr |= reverse
            if context.empty or context.error:
                fg = red
            if context.border:
                fg = yellow
            if context.media:
                fg = magenta
            if context.image:
                fg = magenta
            if context.document:
                fg = cyan
            if context.container:
                fg = yellow
            if context.directory:
                fg = green
                attr |= bold
            elif context.executable and not context.directory:
                fg = red
                attr |= bold
            if context.socket:
                fg = magenta
                attr |= bold
            if context.fifo or context.device:
                fg = yellow
                if context.device:
                    attr |= bold
            if context.link:
                fg = cyan if context.good else red

        if context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = red if context.bad else green
            elif context.directory:
                fg = green
            elif context.tab:
                fg = white
                bg = green

        if context.in_statusbar:
            if context.permissions:
                fg = white if context.good else red
            if context.marked:
                attr |= bold
                fg = yellow

        if context.in_taskview:
            if context.title:
                fg = green

        return fg, bg, attr

