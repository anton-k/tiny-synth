
import rtmidi
from rtmidi.midiconstants import NOTE_ON, NOTE_OFF
from threading import Thread

import wx

myEVT_NOTE_ON = wx.NewEventType()
EVT_NOTE_ON = wx.PyEventBinder(myEVT_NOTE_ON)

class NoteOnEvent(wx.PyCommandEvent):
    """Event to signal that a count value is ready"""
    def __init__(self, etype, eid, pch, vol):
        """Creates the event object"""
        wx.PyCommandEvent.__init__(self, etype, eid)
        self.pch = pch
        self.vol = vol

    def GetValue(self):
        return (self.pch, self.vol)

myEVT_NOTE_OFF = wx.NewEventType()
EVT_NOTE_OFF = wx.PyEventBinder(myEVT_NOTE_OFF)

class NoteOffEvent(wx.PyCommandEvent):
    """Event to signal that a count value is ready"""
    def __init__(self, etype, eid, pch, vol):
        """Creates the event object"""
        wx.PyCommandEvent.__init__(self, etype, eid)
        self.pch = pch
        self.vol = vol

    def GetValue(self):
        return (self.pch, self.vol)


class MidiThread(Thread):
    def __init__(self, parent, player):
        self.parent = parent
        self.midis  = None
        self.player = player

    def run(self):
        def onNoteOn(pch, vol):
            evt = NoteOnEvent(myEVT_NOTE_ON, -1, pch, vol)
            wx.PostEvent(self.parent, evt)
            self.player.noteOn(pch, vol)

        def onNoteOff(pch, vol):
            evt = NoteOffEvent(myEVT_NOTE_OFF, -1, pch, vol)
            wx.PostEvent(self.parent, evt)
            self.player.noteOff(pch, vol)

        self.midis = init_midi_notes(onNoteOn, onNoteOff)

    def close():        
        close_midi(self.midis)

def init_midi_notes(onNoteOn, onNoteOff):
    def cbk(event, data=None):
        msg, tick = event
        flag, pch, vol = msg
        if flag == NOTE_ON:
            onNoteOn(pch, vol)
        if flag == NOTE_OFF:
            onNoteOff(pch, vol)

    return init_midi(cbk)

def print_notes():
    def on(pch, vol):
        print ("Note on : %d %d" % (pch, vol))

    def off(pch, vol):
        print ("Note off: %d %d" % (pch, vol))

    return init_midi_notes(on, off)

def init_midi(cbk):
    midiIn = rtmidi.MidiIn()
    ports = midiIn.get_ports()
    
    midis = []
    for i, p in enumerate(ports):
        x = rtmidi.MidiIn()
        x.open_port(i)
        midis.append(x)
        x.set_callback(cbk)

    del midiIn    
    return midis

def close_midi(ms):
    for x in ms:
        x.cancel_callback()
        del x
