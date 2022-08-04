# https://bumblebee-status.readthedocs.io/en/latest/development/index.html
import core.module
import core.widget
import core.input
import sys
sys.path.append("/home/emre/.dotfiles/scripts/")
import finance


class Module(core.module.Module):
    @core.decorators.every(minutes=5, seconds=00)
    def __init__(self, config, theme):
        self.counter = 0
        # self.get_rates()
        super().__init__(config, theme, widgets=[core.widget.Widget(self.bank)])
        core.input.register(self, button=core.input.LEFT_MOUSE, cmd="konsole --hold -e 'curl rate.sx/eth@1w'")
        core.input.register(self, button=core.input.RIGHT_MOUSE, cmd="konsole --hold -e 'curl rate.sx/eth@30d'")

    def bank(self, widgets):
        # self.counter += 1
        # if self.counter % 15 == 0:
        #   self.update(self, widgets=[core.widget.Widget(self.wallet)])
        return f"  {finance.my_total_coin_value('TRY')}₺ | {finance.my_total_coin_value('USD')}$"


#    def state(self, widget):
#        return ["warning", "critical"]
        # return ["critical", "test"]
