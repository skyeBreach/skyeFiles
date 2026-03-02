import os

import libqtile.resources
from libqtile import bar, widget
from libqtile.config import Screen

widget_defaults = dict(
    font="Fira Code Nerd Font",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

logo = os.path.join(os.path.dirname(libqtile.resources.__file__), "logo.png")


def create_bar():
    return bar.Bar(
        [
            widget.CurrentLayout(),
            widget.GroupBox(),
            widget.Prompt(),
            widget.WindowName(),
            widget.Chord(
                chords_colors={
                    "launch": ("#ff0000", "#ffffff"),
                },
                name_transform=lambda name: name.upper(),
            ),
            widget.Systray(),
            widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
            widget.QuickExit(),
        ],
        24,
    )


screens = [
    Screen(
        bottom=create_bar(),
        background="#000000",
        wallpaper=logo,
        wallpaper_mode="center",
    ),
    Screen(
        bottom=create_bar(),
        background="#000000",
        wallpaper=logo,
        wallpaper_mode="center",
    ),
    Screen(
        bottom=create_bar(),
        background="#000000",
        wallpaper=logo,
        wallpaper_mode="center",
    ),
]
