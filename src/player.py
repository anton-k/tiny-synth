import unicodedata
import csnd6

def unicode2string(x):
    return unicodedata.normalize('NFKD', x).encode('ascii','ignore')

def noteOnMsg(pch, vol):
    return ("i \"main\" 0 0.1 1 %d %d" % (pch, vol))

def noteOffMsg(pch):
    return ("i \"main\" 0 0.1 0 %d %d" % (pch, 0))

class KeyList():
    def __init__(self):
        self.data = []

    def append(self, pch, vol):
        self.data.append((pch, vol))

    def remove(self, pch):
        self.data = filter(lambda x: x[0] != pch, self.data)

    def getData(self):
        return self.data

class Player():
    def __init__(self):
        self.engine = csnd6.Csound()
        self.audioThread = None
        self.active_keys = KeyList()

    def close(self):
        self.stop()

    def load(self, file, faders):        
        self.stop()
        self.engine.Compile(unicode2string(file))
        self.engine.Start()
        self.audioThread = csnd6.CsoundPerformanceThread(self.engine)
        self.audioThread.Play()
        faders.setPlayer(self)
        self.retrigger_active_keys()        

    def retrigger_active_keys(self):
        for pch, vol in self.active_keys.getData():
            self.audioThread.InputMessage(noteOnMsg(pch, vol))

    def noteOn(self, pch, vol):      
        self.active_keys.append(pch, vol)        
        self.audioThread.InputMessage(noteOnMsg(pch, vol))

    def noteOff(self, pch, vol):
        self.active_keys.remove(pch)
        self.audioThread.InputMessage(noteOffMsg(pch))

    def stop(self):          
        if self.audioThread:            
            self.audioThread.Stop()
            self.audioThread.Join()    
            self.engine.Cleanup()
            self.engine.Reset() 

    def setValue(self, name, val):
        self.engine.SetChannel(name, val)
