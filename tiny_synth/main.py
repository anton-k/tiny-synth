#!/usr/bin/python

# treectrl.py

import pkg_resources

import wx
import os.path
import glob
import json

from tiny_synth.utils import *
from tiny_synth.piano import Piano
import tiny_synth.inits as inits
import tiny_synth.midi as midi
import tiny_synth.faders as faders 
from tiny_synth.player import Player

def readPickleConfig(name, cfg, defaultVal, from_string):
    raw = cfg.Read(name, '')
    if raw == '':
        return defaultVal
    else:
        return from_string(raw)

def getRecent(cfg):
    rawList = self.cfg.Read


class St():
    def __init__(self):
        self.cfg = wx.Config(inits.cfgName)
        self.fadersDict = readPickleConfig(inits.fadersDictName, self.cfg, {}, faders.Faders.from_string)
        self.recent     = readPickleConfig(inits.recent, self.cfg, Recent(), Recent.from_string)
        self.favs       = readPickleConfig(inits.favs, self.cfg, Favorites(), Favorites.from_string)
        self.fontSize   = inits.defaultFontSize #readPickleConfig(inits.fontSize, self.cfg, inits.defaultFontSize)

    def getRecent(self):
        return self.recent

    def setRecent(self, recent):
        self.cfg.Write(inits.recent, recent.to_string())

    def getFavs(self):
        return self.favs

    def setFavs(self, favs):
        self.cfg.Write(inits.favs, favs.to_string())

    def getFaders(self, path):
        return faders.loadFromFile(self.fadersDict, pathToCsdFile(path))

    def setFaders(self, path, val):
        faders.updateFile(self.fadersDict, pathToCsdFile(path), val)

    def setFontSize(self, val):
        self.cfg.Write(inits.fontSize, json.dumps(val))

    def upFontSize(self):
        self.fontSize = min(self.fontSize + 1, 18)
        self.setFontSize(self.fontSize)

    def downFontSize(self):
        self.fontSize = max(self.fontSize - 1, 6)
        self.setFontSize(self.fontSize)

    def close(self, recent, favs):
        self.cfg.Write(inits.fadersDictName, faders.Faders.to_string(self.fadersDict))
        self.setFavs(favs)
        self.setRecent(recent)        

    def getFont(self):
        font = wx.SystemSettings_GetFont(wx.SYS_SYSTEM_FONT)
        font.SetPointSize(self.fontSize)        
        return font

def mkNode(path, root, tree, nodes, font):
    path1 = path[:]
    if isinstance(nodes, tuple):
        path1.append(nodes[0])
        parent = tree.AppendItem(root, nodes[0], data = wx.TreeItemData(path1))
        tree.SetItemFont(parent, font)
        for x in nodes[1]:            
            mkNode(path1, parent, tree, x, font)
    elif isinstance(nodes, str):
        path1.append(nodes)
        itemId = tree.AppendItem(root, nodes, data = wx.TreeItemData(path1))
        tree.SetItemFont(itemId, font)

def mkTree(frame, panel, labels, cbk, font):
    if isinstance(labels, list):
        tree = wx.TreeCtrl(panel, wx.ID_ANY, wx.DefaultPosition, (-1,-1), wx.TR_HIDE_ROOT|wx.TR_HAS_BUTTONS)        
        root = tree.AddRoot('') 
        for x in labels:
            mkNode([], root, tree, x, font)      
    elif isinstance(labels, tuple):
        tree = wx.TreeCtrl(panel, 1, wx.DefaultPosition, (-1,-1), wx.TR_HAS_BUTTONS)
        root = tree.AddRoot(labels[0])
        for x in labels[1]:
            mkNode([root], root, tree, x, font)    

    def onSelChanged(event):
        item = event.GetItem()
        cbk(tree.GetItemText(item), tree.GetItemData(item).GetData())

    tree.Bind(wx.EVT_TREE_SEL_CHANGED, onSelChanged, tree)
    return tree

def slider(frame, v, cbk):
    def go(evt):
        obj = evt.GetEventObject()
        val = obj.GetValue()        
        cbk(float(val) / 100)

    sld = wx.Slider(frame, wx.ID_ANY, v, 0, 100)
    sld.Bind(wx.EVT_SCROLL, go)
    return sld 

def stripExt(x):
    return (os.path.splitext(x))[0]

def getInstruments():
    instrumentsPath = pkg_resources.resource_filename('tiny_synth.instruments', '')    
    dirs = filter(lambda x: x != '__init__.py', pkg_resources.resource_listdir('tiny_synth.instruments', ''))    
    cats = map(os.path.basename, dirs)
    
    def getCsds(c):
        files = map(lambda x: stripExt(os.path.basename(x)), glob.glob(os.path.join(instrumentsPath, c, '*')))
        return (c, files)

    return map(getCsds, cats)

taxonomy = getInstruments()

# taxonomy = [ ('electric piano', ['epiano1', 'epiano2', 'rhodes'])
#            , ('pad', ['warm pad', 'sweep pad', 'pw pad', 'overtone'])
#            , ('organ', ['church', 'cathedral', 'hammond'])
#            , ('woodwind', ['flute', 'clarinet', 'basson', 'hulusi']) ]

class PageOne(wx.Panel):
    def __init__(self, parent, frame):
        wx.Panel.__init__(self, parent)
        tree = mkTree(frame, self, taxonomy, frame.OnSelChanged, frame.state.getFont())
        vbox = wx.BoxSizer(wx.VERTICAL)
        vbox.Add(tree, 1, wx.EXPAND)
        self.SetSizer(vbox)
        frame.fontObjects.appendTree(tree)

def mkRecentTree(panel, frame, recent):    
    return mkTree(frame, panel, map(str, recent.items), frame.OnSelChanged, frame.state.getFont())

def mkTreeStub(panel, name, font):
    tree = wx.TreeCtrl(panel, wx.ID_ANY, wx.DefaultPosition, (-1,-1), wx.TR_HAS_BUTTONS)
    root = tree.AddRoot(name)
    tree.SetItemFont(root, font)
    vbox = wx.BoxSizer(wx.VERTICAL)
    vbox.Add(tree, 1, wx.EXPAND)
    panel.SetSizer(vbox)
    return tree

class PageTwo(wx.Panel):
    def __init__(self, parent, frame, name):
        wx.Panel.__init__(self, parent)
        self.tree = mkTreeStub(self, name, frame.state.getFont())
        self.cbk = frame.OnSelChanged

        def onSelChanged(event):
            item = event.GetItem()
            frame.OnSelChanged(self.tree.GetItemText(item), self.tree.GetItemData(item).GetData())

        self.tree.Bind(wx.EVT_TREE_SEL_CHANGED, onSelChanged, self.tree)
        frame.fontObjects.appendTree(self.tree)

class Recent():
    def __init__(self, items = [], limit = 12):
        self.items = items
        self.limit = limit

    def append(self, x):        
        if x in self.items:
            self.items.remove(x)
        self.items.insert(0, x)
        if len(self.items) > self.limit:
            del self.items[-1]

    def __str__(self):
        return str(self.items)

    def __repr__(self):
        return repr(self.items)

    @staticmethod    
    def from_string(s):
        print s
        try:
            return Recent(map(tuple, json.loads(s)))
        except:
            return Recent()


    def to_string(self):
        return json.dumps(self.items)

class Favorites():
    def __init__(self, items = []):
        self.items = items

    def add(self, item):
        if not (item is self.items):
            self.items.append(item)

    def remove(self, item):
        self.items.remove(item)

    def __str__(self):
        return str(self.items)

    def __repr__(self):
        return repr(self.items)

    @staticmethod    
    def from_string(s):
        try:        
            return Favorites(map(tuple, json.loads(s)))
        except:
            return Favorites()

    def to_string(self):
        return json.dumps(self.items)
 
def fillTree(tree, items, name, font):
    tree.DeleteAllItems()
    root = tree.AddRoot(name) 
    tree.SetItemFont(root, font)
    for x in items:
        itemId = tree.AppendItem(root, str(x[0]), data = wx.TreeItemData(x[1]))
        tree.SetItemFont(itemId, font)

    tree.ExpandAll()

def pathToCsdFile(path):
    instrumentsPath = pkg_resources.resource_filename('tiny_synth.instruments', '')
    return os.path.join(instrumentsPath, *path) + u'.csd'

class FontObjects():
    def __init__(self):
        self.title = None
        self.texts = []
        self.trees = []

    def setTitle(self, val):
        self.title = val

    def appendText(self, val):
        self.texts.append(val)

    def appendTree(self, val):
        self.trees.append(val)

    def update(self, font):
        for x in self.texts:
            x.SetFont(font)

        for x in self.trees:
            updateFontForTree(x, font)

        font.SetWeight(wx.FONTWEIGHT_BOLD)
        self.title.SetFont(font)

def iterateTree(tree, cbk):
    iterateTreeChild(tree, tree.GetRootItem(), cbk)

def iterateTreeChild(tree, item, cbk):    
    cbk(tree, item)
    (child, cookie) = tree.GetFirstChild(item)    
    while child.IsOk():
        cbk(tree, child)
        iterateTreeChild(tree, child, cbk)
        (child, cookie) = tree.GetNextChild(item, cookie)

def updateFontForTree(tree, font):
    def go(tree, item):
        tree.SetItemFont(item, font)

    iterateTree(tree, go)


class MyFrame(wx.Frame):
    def __init__(self, parent, id, title, state):
        wx.Frame.__init__(self, parent, id, title, wx.DefaultPosition, wx.Size(420, 500))

        self.recent = state.getRecent()
        self.favs = state.getFavs()
        self.currentTrack = None
        self.state = state
        self.fontObjects = FontObjects()

        self.player = Player()

        vbox = wx.BoxSizer(wx.VERTICAL)
        panel1 = wx.Panel(self, -1)
        panel2 = wx.Panel(self, -1)
        piano  = Piano(self, wx.ID_ANY, self.player)

        def onNoteOn(evt):
            pch, vol = evt.GetValue()
            piano.keyOn(pch)

        def onNoteOff(evt):
            pch, vol = evt.GetValue()
            piano.keyOff(pch)     

        self.midis = midi.MidiThread(self, self.player)
        self.midis.run()
        self.Bind(midi.EVT_NOTE_ON, onNoteOn)
        self.Bind(midi.EVT_NOTE_OFF, onNoteOff)

        self.Bind(wx.EVT_CLOSE, self.onExit)

        p = panel1
        nb = wx.Notebook(p)

        # create the page windows as children of the notebook
        page1 = PageOne(nb, self)
        page2 = PageTwo(nb, self, inits.recent)
        page3 = PageTwo(nb, self, inits.favs)

        self.recentPanel = page2
        self.favsPanel   = page3
        self.currentTab  = 0


        # add the pages to the notebook with the label to show on the tab
        nb.AddPage(page1, "Library")
        nb.AddPage(page2, "Recent")
        nb.AddPage(page3, "Favorites")
        self.tabs = nb

        self.Bind(wx.EVT_NOTEBOOK_PAGE_CHANGED, self.OnPageChanged)

        # finally, put the notebook in a sizer for the panel to manage
        # the layout
        sizer = wx.BoxSizer()
        sizer.Add(nb, 1, wx.EXPAND)
        p.SetSizer(sizer)

        self.display = wx.StaticText(panel2, -1, '',(10,10), style=wx.ALIGN_CENTRE)
        font = state.getFont()
        font.SetWeight(wx.FONTWEIGHT_BOLD)
        self.display.SetFont(font)
        self.fontObjects.setTitle(self.display)

        hbox = hor([panel1, panel2])

        self.uiFaders = {}

        def mkSlider(name):
            def cbk(val):
                self.player.setValue(name, val)
            ui = slider(panel2, 0, cbk)            
            self.uiFaders[name] = ui
            text = staticText(panel2, name, font = self.state.getFont())
            self.fontObjects.appendText(text)
            return ver([Cell(ui, border = 7), Cell(text, flags = wx.ALIGN_CENTRE, border = 7)])
        
        vbox2 = ver([staticText(panel2, ''), mkSlider(inits.volume), mkSlider(inits.fx), mkSlider(inits.cutOff), mkSlider(inits.resonance)])
        panel2.SetSizer(vbox2)
        self.SetSizer(ver([Cell(hbox, scale = 3.8), Cell(piano, scale = 1)]))
        self.Centre()

        self.initPlayerFile()
        
        mkMenuBar(self, [
              menuItem('&File',[
                  normalItem('Add to favs', cbk = self.OnAddToFavs)
                , normalItem('Remove from favs', cbk = self.OnRemoveFromFavs)
               # , normalItem('Settings')
                ])
            , menuItem('&Edit', [
                  normalItem('Enlarge font: Ctr,+', cbk = self.OnFontUp)
                , normalItem('Shrink  font: Ctr,-', cbk = self.OnFontDown)
            ])  
            , menuItem('&Help',[                  
                normalItem('About', cbk = self.OnAbout)  
                ])])


        upFontId = wx.NewId()
        downFontId = wx.NewId()        
        self.Bind(wx.EVT_MENU, self.OnFontUp, id=upFontId)
        self.Bind(wx.EVT_MENU, self.OnFontDown, id=downFontId)
        self.accel_tbl = wx.AcceleratorTable([(wx.ACCEL_CTRL,  ord('='), upFontId), (wx.ACCEL_CTRL,  ord('-'), downFontId)])
        self.SetAcceleratorTable(self.accel_tbl)


    def OnFontUp(self, e):       
        self.state.upFontSize()
        self.fontObjects.update(self.state.getFont())


    def OnFontDown(self, e):        
        self.state.downFontSize()
        self.fontObjects.update(self.state.getFont())

    def OnAddToFavs(self, event):
        if self.currentTrack:
            self.favs.add(self.currentTrack)

    def OnRemoveFromFavs(self, event):
        if self.currentTrack:
            self.favs.remove(self.currentTrack)
        if self.isFavsTab():
            fillTree(self.favsPanel.tree, self.favs.items, inits.favs, self.state.getFont())
        self.favsPanel.Refresh()

    def isFavsTab(self):
        return self.currentTab == 2

    def OnAbout(self, e):    
        description = """Tiny synth is a collection of instruments designed with csound-expression library.
"""

        licence = """Tiny synth is licensed under Creative Commons Attribution-Noncommercial-Share Alike 3.0 Unported License."""

        info = wx.AboutDialogInfo()

        info.SetName('Tiny Synth')
        info.SetVersion('0.1')
        info.SetDescription(description)
        info.SetCopyright('(C) 2015 Anton Kholomiov')
        info.SetWebSite('http://github.com/anton-k')
        info.SetLicence(licence)
        info.AddDeveloper('Anton Kholomiov')
        info.AddDocWriter('Anton Kholomiov')
        info.AddArtist('The Math Art')
        info.AddTranslator('Anton Kholomiov')       

        wx.AboutBox(info)


    def OnPageChanged(self, event):
        old = event.GetOldSelection()
        new = event.GetSelection()
        self.currentTab = new

        if new == 1:
            fillTree(self.recentPanel.tree, self.recent.items, inits.recent, self.state.getFont())

        if new == 2:
            fillTree(self.favsPanel.tree, self.favs.items, inits.favs, self.state.getFont())

    def OnSelChanged(self, label, path):   
        if (str(label) == inits.recent or str(label) == inits.favs or len(path) == 1):
            return
        self.openFile(label, path)

    def setCurrent(self, track, path):
        self.currentTrack = (track, path)

    def initPlayerFile(self):
        xs = self.recent.items 
        if xs:
            (label, path) = xs[0]
            self.openFile(label, path)

    def openFile(self, label, path):
        self.closeFile()
        self.display.SetLabel('   ' + label)
        faders = self.state.getFaders(path)
        self.player.load(pathToCsdFile(path), faders)
        faders.setUi(self.uiFaders)
        self.setCurrent(label, path)
        self.recent.append((label, path))

    def closeFile(self): 
        if self.currentTrack:       
            self.state.setFaders(self.getCurrentPath(), self.getCurrentFaders())

    def getCurrentPath(self):        
        return self.currentTrack[1]

    def getCurrentFaders(self):
        def get(name):
            return float(self.uiFaders[name].GetValue()) / 100

        return faders.Faders(get(inits.volume), get(inits.fx), get(inits.cutOff), get(inits.resonance))

    def onExit(self, evt):
        self.closeFile()
        self.player.close()
        self.state.close(self.recent, self.favs)        
        self.Destroy()

class MyApp(wx.App):
    def OnInit(self):
        st = St()
        frame = MyFrame(None, -1, 'Tiny Synth', st)
        frame.Show(True)
        self.SetTopWindow(frame)
        return True

app = MyApp(0)
app.MainLoop()