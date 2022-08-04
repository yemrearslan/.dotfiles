# https://bumblebee-status.readthedocs.io/en/latest/development/index.html
import core.module
import core.widget
import core.input
import sys
sys.path.append("/home/emre/.dotfiles/scripts/")
import finance


class Module(core.module.Module):
    @core.decorators.every(minutes=60, seconds=00)
    def __init__(self, config, theme):
        self.counter = 0
        # self.get_rates()
        self.url_po = "https://www.petrolofisi.com.tr/akaryakit-fiyatlari/mersin-akaryakit-fiyatlari"
        self.url_opet = "https://www.opet.com.tr/akaryakit-fiyatlari/mersin"
        super().__init__(config, theme, widgets=[core.widget.Widget(self.fuel)])
        core.input.register(self, button=core.input.LEFT_MOUSE, cmd=f"brave {self.url_po}")
        core.input.register(self, button=core.input.RIGHT_MOUSE, cmd=f"brave {self.url_opet}")

    def fuel(self, widgets):
        # self.counter += 1
        # if self.counter % 15 == 0:
        #   self.update(self, widgets=[core.widget.Widget(self.wallet)])
        return f" {finance.yakit('benzin')}₺ "


#    def state(self, widget):
#        return ["warning", "critical"]
        # return ["critical", "test"]
