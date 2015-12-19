import unicodedata
import csnd6

import tiny_synth.config as config

def unicode2string(x):
    return unicodedata.normalize('NFKD', x).encode('ascii','ignore')

def note_onMsg(pch, vol):
    return ("i \"main\" 0 0.1 1 %d %d" % (pch, vol))

def note_offMsg(pch):
    return ("i \"main\" 0 0.1 0 %d %d" % (pch, 0))

class KeyList():
    def __init__(self):
        self.data = []

    def append(self, pch, vol):
        self.data.append((pch, vol))

    def remove(self, pch):
        self.data = filter(lambda x: x[0] != pch, self.data)

    def get_data(self):
        return self.data

class Player():
    def __init__(self):
        self.engine = csnd6.Csound()
        self.audio_thread = None
        self.active_keys = KeyList()
        self.tuning = 0

    def set_tuning(self, val):
        self.tuning = val

    def close(self):
        self.stop()

    def load(self, file, faders):        
        self.stop()
        self.engine.Compile(unicode2string(file))
        self.engine.SetOption("-odac")
        self.engine.SetOption("-d")
        self.engine.Start()
        self.audio_thread = csnd6.CsoundPerformanceThread(self.engine)
        self.audio_thread.Play()
        faders.set_player(self)
        self.set_value(config.TUNING, self.tuning)
        self.retrigger_active_keys()        

    def retrigger_active_keys(self):
        for pch, vol in self.active_keys.get_data():
            self.audio_thread.InputMessage(note_onMsg(pch, vol))

    def note_on(self, pch, vol):      
        self.active_keys.append(pch, vol)        
        self.audio_thread.InputMessage(note_onMsg(pch, vol))

    def note_off(self, pch, vol):
        self.active_keys.remove(pch)
        self.audio_thread.InputMessage(note_offMsg(pch))

    def stop(self):          
        if self.audio_thread:            
            self.audio_thread.Stop()
            self.audio_thread.Join()    
            self.engine.Cleanup()
            self.engine.Reset() 

    def set_value(self, name, val):
        self.engine.SetChannel(name, val)
