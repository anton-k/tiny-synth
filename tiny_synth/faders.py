
import wx
import json
import copy

from tiny_synth import config

def load_from_file(dict, file):
    if file in dict:
        res = dict[file]
        if res:
            return res
        else:
            return defaultFaders
    return defaultFaders


def update_file(dict, file, faders):
    dict[file] = faders

class Faders():
    def __init__(self, vol, fx, cf, res):
        self.volume = vol
        self.fx = fx
        self.cutOff = cf
        self.resonance = res

    def set_player(self, player):
        player.set_value(config.VOLUME, self.volume)
        player.set_value(config.FX, self.fx)
        player.set_value(config.CUT_OFF, self.cutOff)
        player.set_value(config.RESONANCE, self.resonance)

    def set_ui(self, ui):        
        def set_ui(name, val):
            ui[name].SetValue(100 * val)

        set_ui(config.VOLUME, self.volume)
        set_ui(config.FX, self.fx)
        set_ui(config.CUT_OFF, self.cutOff)
        set_ui(config.RESONANCE, self.resonance)

    def to_tuple(self):
        return (self.volume, self.fx, self.cutOff, self.resonance)

    @staticmethod
    def from_tuple(t):
        vol, fx, cf, res = t
        return Faders(vol, fx, cf, res)

    @staticmethod
    def from_string(s):
        faderDict = json.loads(s)
        for k in faderDict:
            faderDict[k] = Faders.from_tuple(faderDict[k])
        return faderDict

    @staticmethod
    def to_string(faderDict):
        ds = copy.deepcopy(faderDict)
        for k in ds:
            ds[k] = faderDict[k].to_tuple()

        return json.dumps(ds)

defaultFaders = Faders(0.75, 0.25, 1, 0.1)



