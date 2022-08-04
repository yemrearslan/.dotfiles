# https://bumblebee-status.readthedocs.io/en/latest/development/index.html
import core.module
import core.widget
import core.input
import sys
import os

sys.path.append("/home/emre/.dotfiles/scripts/")


class Module(core.module.Module):
    @core.decorators.every(minutes=00, seconds=10)
    def __init__(self, config, theme):
        super().__init__(config, theme, widgets=[core.widget.Widget(self.brightness)])
        #core.input.register(self, button=core.input.LEFT_MOUSE, cmd=f"brave {self.url_po}")
        #core.input.register(self, button=core.input.RIGHT_MOUSE, cmd=f"brave {self.url_opet}")

    def brightness(self, widgets):
        # self.counter += 1
        # if self.counter % 15 == 0:
        #   self.update(self, widgets=[core.widget.Widget(self.wallet)])
        command = "ddcutil --bus 4  getvcp 10 --brief"
        brig = os.popen(command).read().split()[-2]
        return f" {brig}"


#    def state(self, widget):
#        return ["warning", "critical"]
        # return ["critical", "test"]
