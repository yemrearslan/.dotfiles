# https://bumblebee-status.readthedocs.io/en/latest/development/index.html
import core.module
import core.widget
import core.input
import sys
import os
sys.path.append("/home/emre/.dotfiles/scripts/")


class Module(core.module.Module):
    @core.decorators.every(minutes=60, seconds=00)
    def __init__(self, config, theme):
        self.counter = 0
        super().__init__(config, theme, widgets=[core.widget.Widget(self.battery)])
        # core.input.register(self, button=core.input.LEFT_MOUSE, cmd=f"brave {self.url_po}")
        # core.input.register(self, button=core.input.RIGHT_MOUSE, cmd=f"brave {self.url_opet}")

    def battery(self, widgets):
        # self.counter += 1
        # if self.counter % 15 == 0:
        #   self.update(self, widgets=[core.widget.Widget(self.wallet)])
        level = os.system("qdbus org.kde.kdeconnect /modules/kdeconnect/devices/e428313c0f48904c/battery org.kde.kdeconnect.device.battery.charge")
        return f" {level}% "


#    def state(self, widget):
#        return ["warning", "critical"]
        # return ["critical", "test"]
