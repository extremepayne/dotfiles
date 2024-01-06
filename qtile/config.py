from modules.keys import keys, mod
from modules.groups import groups
from modules.layouts import layouts, floating_layout
from modules.mouse import mouse
from modules.hooks import *
import os
from modules.screens import screens

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
auto_fullscreen = True
auto_minimize = False
focus_on_window_activation = "smart"
wmname = "Qtile"
widget_defaults = dict(font="MesloLGS NF Regular", fontsize=13, padding=3)

os.system("xmodmap ~/.xmodmap")
