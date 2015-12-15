
import wx
from ast import literal_eval

from tiny_synth import inits

def loadFromFile(dict, file):
    if file in dict:
        res = dict[file]
        if res:
            return res
        else:
            return defaultFaders
    return defaultFaders


def updateFile(dict, file, faders):
    dict[file] = faders

def to_string(x):
    return repr((x.vol, x.fx, x.cutOff, x.res))

def from_string(s):
    (vol, fx, cf, res) = literal_eval(s)
    return Faders(vol, fx, cf, res)

class Faders():
    def __init__(self, vol, fx, cf, res):
        self.volume = vol
        self.fx = fx
        self.cutOff = cf
        self.resonance = res

    def setPlayer(self, player):
        player.setValue(inits.volume, self.volume)
        player.setValue(inits.fx, self.fx)
        player.setValue(inits.cutOff, self.cutOff)
        player.setValue(inits.resonance, self.resonance)

    def setUi(self, ui):        
        def setUi(name, val):
            ui[name].SetValue(100 * val)

        setUi(inits.volume, self.volume)
        setUi(inits.fx, self.fx)
        setUi(inits.cutOff, self.cutOff)
        setUi(inits.resonance, self.resonance)

defaultFaders = Faders(0.75, 0.25, 1, 0.1)



