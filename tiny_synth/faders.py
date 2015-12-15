
import wx
import json
import copy

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



