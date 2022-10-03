from libqtile import bar
from .widgets import *
from libqtile.config import Screen
from modules.keys import terminal
import os

screens = [
    Screen(
        wallpaper="~/.config/qtile/spacewallpaper.jpg",
        wallpaper_mode="fill",
        top=bar.Bar(
            [   widget.Sep(padding=7, linewidth=0, background="#002b36"),
                widget.Image(filename='~/.config/qtile/eos-c.png', margin=3, background="#002b36", mouse_callbacks={'Button1': lambda: qtile.cmd_spawn("rofi -show combi")}),
                widget.Sep(padding=4, linewidth=0, background="#002b36"), 
                widget.GroupBox(
                                highlight_method='line',
                                this_screen_border="#2aa198",
                                this_current_screen_border="#2aa198",
                                active="#ffffff",
                                inactive="#848e96",
                                background="#002b36"),
                widget.TextBox(
                       text = '',
                       padding = 0,
                       fontsize = 28,
                       foreground='#002b36'
                       ),    
                widget.Prompt(
                             foreground='#839496',
                             font='MesloLGS NF Regular',
                    ),
                widget.Spacer(length=5),
                widget.WindowName(
                    foreground='#839496',fmt='{}',
                    font='MesloLGS NF Bold',
                    ),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.CurrentLayoutIcon(scale=0.75),
                widget.CheckUpdates(
                    update_interval=1800,
                    distro="Arch_yay",
                    display_format="{updates} Updates",
                    foreground="#ffffff",
                    mouse_callbacks={
                        'Button1':
                        lambda: qtile.cmd_spawn(terminal + ' -e yay -Syu')
                    },
                    background="#002b36"),
                widget.Systray(icon_size = 20),
                widget.TextBox(
                       text = '',
                       padding = 0,
                       fontsize = 28,
                       foreground='#002b36'
                       ), 
                volume,
                widget.TextBox(                                                                    
                       text = '',
                       padding = 0,
                       fontsize = 28,
                       background='#002b36',
                       foreground='#073642',
                       ),   
                battery,
                widget.TextBox(
                       text = '',
                       padding = 0,
                       fontsize = 28,
                       foreground='#002b36'
                       ),    
                widget.Clock(format='%Y-%m-%d %a %I:%M %p',
                             font='MesloLGS NF Regular',
                             background="#002b36",
                             foreground='#859900'),
                                        widget.TextBox(                                                                    
                               text = ' ',
                               padding = 0,
                               fontsize = 28,
                               background='#002b36',
                               foreground='#073642',
                               ),   
                widget.TextBox(
                    text=' ',
                    mouse_callbacks= {
                        'Button1':
                        lambda: qtile.cmd_spawn(os.path.expanduser('~/.config/rofi/powermenu.sh'))
                    },
                    foreground='#dc322f'
                )
                
            ],
            30,  # height in px
            background="#073642"  # background color
        ), ),
]
