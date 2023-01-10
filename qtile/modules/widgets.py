from libqtile import widget
from libqtile import qtile

from libqtile.widget.battery import BatteryState, BatteryStatus

colors = [
	      ["#282c34", "#282c34"], # panel background
          ["#3d3f4b", "#434758"], # background for current screen tab
          ["#ffffff", "#ffffff"], # font color for group names
          ["#ff5555", "#ff5555"], # border line color for current tab
          ["#74438f", "#74438f"], # border line color for 'other tabs' and color for 'odd widgets'
          ["#4f76c7", "#4f76c7"], # color for the 'even widgets'
          ["#e1acff", "#e1acff"], # window name
          ["#ecbbfb", "#ecbbfb"]  # backbround for inactive screens
] 


widget_defaults = dict(
    font='Cantarell',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()
class MyVolume(widget.Volume):
    def _configure(self, qtile, bar):
        widget.Volume._configure(self, qtile, bar)
        self.volume = self.get_volume()
        if self.volume <= 0:
            self.text = f'婢 {self.volume}'
        elif self.volume < 50:
            self.text = f'奔 {self.volume}'
        else:
            self.text = f'墳 {self.volume}'
        # drawing here crashes Wayland

    def _update_drawer(self, wob=False):
        if self.volume <= 0:
            self.text = f'婢 {self.volume}'
        elif self.volume < 50:
            self.text = f'奔 {self.volume}'
        else:
            self.text = f'墳 {self.volume}'
        self.draw()

        if wob:
            with open(self.wob, 'a') as f:
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
            if status.state == BatteryState.DISCHARGING and status.percent < self.low_percentage:
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


volume = MyVolume(
    fontsize=15,
    font='MesloLGS NF Regular',
    foreground='#6c71c4',
    background='#002b36',
    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("pavucontrol")}
)

battery = MyBattery(
      fontsize=15,
      font='MesloLGS NF Regular',
      format="{char} {percent:2.0%} [{hour:d}:{min:02d}] ",
      notify_below=0.05,
      foreground="#268bd2",
)
