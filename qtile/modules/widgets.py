from libqtile import widget
from libqtile import hook
from libqtile import qtile
from libqtile.log_utils import logger
from .colors import colors

from libqtile.widget.battery import BatteryState, BatteryStatus


widget_defaults = dict(
    font="MesloLGS NF Regular",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()


class MyVolume(widget.Volume):
    def _configure(self, qtile, bar):
        widget.Volume._configure(self, qtile, bar)
        self.volume = self.get_volume()
        if self.volume <= 0:
            self.text = f"婢 {self.volume}"
        elif self.volume < 50:
            self.text = f"奔 {self.volume}"
        else:
            self.text = f"墳 {self.volume}"
        # drawing here crashes Wayland

    def _update_drawer(self, wob=False):
        if self.volume <= 0:
            self.text = f"婢 {self.volume}"
        elif self.volume < 50:
            self.text = f"奔 {self.volume}"
        else:
            self.text = f"墳 {self.volume}"
        self.draw()

        if wob:
            with open(self.wob, "a") as f:
                f.write(str(self.volume) + "\n")


class MyBattery(widget.Battery):
    def build_string(self, status: BatteryStatus) -> str:
        """Determine the string to return for the given battery state

        Parameters
        ----------
        status:
            The current status of the battery

        Returns
        -------
        str
            The string to display for the current status.
        """
        if self.layout is not None:
            if (
                status.state == BatteryState.DISCHARGING
                and status.percent < self.low_percentage
            ):
                self.layout.colour = self.low_foreground
                self.background = self.low_background
            else:
                self.layout.colour = self.foreground
                self.background = self.normal_background

        if status.state == BatteryState.CHARGING:
            char = ""
        elif status.state == BatteryState.DISCHARGING:
            if status.percent > 0.95:
                char = ""
            elif status.percent > 0.85:
                char = ""
            elif status.percent > 0.75:
                char = ""
            elif status.percent > 0.65:
                char = ""
            elif status.percent > 0.55:
                char = ""
            elif status.percent > 0.45:
                char = ""
            elif status.percent > 0.35:
                char = ""
            elif status.percent > 0.25:
                char = ""
            elif status.percent > 0.15:
                char = ""
            elif status.percent > 0.5:
                char = ""
            else:
                char = ""
        elif status.state == BatteryState.FULL:
            if self.show_short_text:
                return " full"
            char = self.full_char
        elif status.state == BatteryState.EMPTY or (
            status.state == BatteryState.UNKNOWN and status.percent == 0
        ):
            if self.show_short_text:
                return "Empty"
            char = self.empty_char
        else:
            char = self.unknown_char

        hour = status.time // 3600
        minute = (status.time // 60) % 60

        return self.format.format(
            char=char, percent=status.percent, watt=status.power, hour=hour, min=minute
        )


class MyIcon(widget.Image):
    """Icon that gets colored in when screen is focused"""
    # def __init__(self, length=bar.CALCULATED, **config):
        # super().__init__(length, **config)
        # self.safe_to_change_icon = False

    def _setup_hooks(self):
        hook.subscribe.current_screen_change(self.change_image)
        # hook.subscribe.startup_complete(self._its_safe)

    # def _its_safe(self):
        # self.safe_to_change_icon = True

    def _configure(self, qtile, bar):
        super()._configure(qtile, bar)
        self._setup_hooks()

    def change_image(self):
        # if self.safe_to_change_icon:
        split_path = self.filename.split("/")
        icon_filename = split_path[-1]
        if self.qtile.current_screen is self.bar.screen:
            if "color-" not in icon_filename:
                logger.warning("swapping to color")
                icon_filename = "color-" + icon_filename
            else:
                logger.warning("colored icon already displayed")
        else:
            if icon_filename[:6] == "color-":
                logger.warning("swapping to b&w")
                icon_filename = icon_filename[6:] # remove color-
            else:
                logger.warning("colored icon not being displayed")
        reconstructed_path = "/".join(split_path[:-1])
        self.filename = reconstructed_path + "/" + icon_filename

        self._update_image()
        self.draw()


volume = MyVolume(
    fontsize=15,
    font="MesloLGS NF Regular",
    foreground=colors["sapphire"],
    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("pavucontrol")},
)

volume_secondary = MyVolume(
    fontsize=15,
    font="MesloLGS NF Regular",
    foreground=colors["sapphire"],
    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("pavucontrol")},
)

battery_secondary = MyBattery(
    fontsize=15,
    font="MesloLGS NF Regular",
    format="{char} {percent:2.0%} [{hour:d}:{min:02d}] ",
    notify_below=0.05,
    foreground=colors["green"],
    background=colors["mantle"],
)

battery = MyBattery(
    fontsize=15,
    font="MesloLGS NF Regular",
    format="{char} {percent:2.0%} [{hour:d}:{min:02d}] ",
    notify_below=0.05,
    foreground=colors["green"],
    background=colors["mantle"],
)

lizard_icon = MyIcon(
    filename="~/.config/qtile/lizard.png",
    margin=3,
    background=colors["mantle"],
    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("rofi -show combi")},
)

slugcat_icon = MyIcon(
    filename="~/.config/qtile/color-slugcat.png",
    margin=3,
    background=colors["mantle"],
    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("rofi -show combi")},
)
