from libqtile import bar
from .widgets import *
from .colors import colors
from libqtile.config import Screen
from libqtile import hook, log_utils
# from modules.keys import terminal
import os
from random import choice

# from .groups import groups

my_bar = bar.Bar(
            [   widget.Sep(padding=7, linewidth=0, background=colors["mantle"]),
                widget.Image(filename='~/.config/qtile/amogus.png', margin=3, background=colors["mantle"], mouse_callbacks={'Button1': lambda: qtile.cmd_spawn("rofi -show combi")}),
                widget.Sep(padding=4, linewidth=0, background=colors["mantle"]),
                widget.GroupBox(
                                highlight_method='line',
                                this_screen_border=colors["sapphire"],
                                this_current_screen_border=colors["sky"],
                                active=colors["text"],
                                inactive=colors["overlay0"],
                                background=colors["mantle"]),
                widget.TextBox(
                       text = '',
                       padding = 0,
                       fontsize = 28,
                       foreground=colors["mantle"]
                       ),
                widget.Prompt(
                             foreground=colors["subtext0"],
                             font='MesloLGS NF Regular',
                    ),
                widget.Spacer(length=5),
                widget.WindowName(
                    foreground=colors["subtext1"],fmt='{}',
                    font='MesloLGS NF Bold',
                    ),
                # widget.Chord(
                    # chords_colors={
                        # 'launch': ("#ff0000", "#ffffff"),
                    # },
                    # name_transform=lambda name: name.upper(),
                # ),
                widget.CurrentLayoutIcon(scale=0.75),
                widget.Systray(icon_size = 20),
                widget.TextBox(
                       text = '',
                       padding = 0,
                       fontsize = 28,
                       foreground=colors["mantle"],
                       ),
                widget.Wlan(
                    format='{essid} {percent:2.0%}',
                    fontsize=15,
                    background=colors["mantle"],
                    foreground=colors["muave"],
                    ),
                widget.Sep(padding = 3, linewidth=0, background=colors["mantle"]),
                widget.TextBox(
                       text = '',
                       padding = 0,
                       fontsize = 28,
                       background=colors["mantle"],
                       foreground=colors["base"],
                       ),
                volume,
                widget.TextBox(
                       text = '',
                       padding = 0,
                       fontsize = 28,
                       foreground=colors["mantle"],
                       ),
                battery,
                widget.TextBox(
                       text = '',
                       padding = 0,
                       fontsize = 28,
                       background=colors["mantle"],
                       foreground=colors["base"],
                       ),
                widget.Clock(format='%a %b %d',
                             font='MesloLGS NF Regular',
                             fontsize=15,
                             foreground=colors["yellow"]),
                widget.Sep(padding = 3, linewidth=0),
                widget.TextBox(
                       text = '',
                       padding = 0,
                       fontsize = 28,
                       foreground=colors["mantle"]
                       ),
                widget.Clock(format='%H:%M',
                             font='MesloLGS NF Regular',
                             fontsize=15,
                             background=colors["mantle"],
                             foreground=colors["peach"]),
                widget.Sep(padding = 3, linewidth=0, background=colors["mantle"]),
                                        widget.TextBox(
                               text = '',
                               padding = 0,
                               fontsize = 28,
                               background=colors["mantle"],
                               foreground=colors["base"],
                               ),
                widget.TextBox(
                    text=' ',
                    mouse_callbacks= {
                        'Button1':
                        lambda: qtile.cmd_spawn(os.path.expanduser('~/.config/rofi/powermenu.sh'))
                    },
                    foreground=colors["red"]
                )

            ],
            36,  # height in px
            background=colors["base"],  # background color
            margin=[8, 8, 0, 8]
        )

rand_wallpaper = choice(os.listdir(os.path.expanduser("~/.config/qtile/wallpapers")))
screens = [
    Screen(
        wallpaper="~/.config/qtile/wallpapers/" + rand_wallpaper,
        wallpaper_mode="fill",
        top=my_bar,
    ),
    Screen(
        wallpaper="~/.config/qtile/wallpapers/" + rand_wallpaper,
        wallpaper_mode="fill",
    ),
]

@hook.subscribe.layout_change
def max_no_margins(layout, group):
    if qtile.current_layout.name == "max":
        my_bar.margin = [0, 0, 0, 0]
        my_bar._initial_margin = [0, 0, 0, 0]
        my_bar._configure(qtile, qtile.current_screen, reconfigure=True)
        my_bar.draw()
        qtile.current_screen.group.layout_all()

    else:
        my_bar.margin = [8, 8, 0, 8]
        my_bar._initial_margin = [8, 8, 0, 8]
        my_bar._configure(qtile, qtile.current_screen, reconfigure=True)
        my_bar.draw()
        qtile.current_screen.group.layout_all()

