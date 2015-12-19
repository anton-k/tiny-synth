#!/usr/bin/python

# treectrl.py

import pkg_resources

import wx
import os.path
import glob
import json

from tiny_synth.utils import *
from tiny_synth.piano import Piano
import tiny_synth.config as config
import tiny_synth.midi as midi
import tiny_synth.faders as faders 
from tiny_synth.player import Player

def read_pickle_config(name, cfg, defaultVal, from_string):
    raw = cfg.Read(name, '')
    if raw == '':
        return defaultVal
    else:
        try:
            return from_string(raw)
        except:
            return defaultVal

def get_recent(cfg):
    rawList = self.cfg.Read


class St():
    def __init__(self):
        self.cfg = wx.Config(config.CFG_NAME)
        self.fadersDict = read_pickle_config(config.FADERS_DICT_NAME, self.cfg, {}, faders.Faders.from_string)
        self.recent     = read_pickle_config(config.RECENT, self.cfg, Recent(), Recent.from_string)
        self.favs       = read_pickle_config(config.FAVS, self.cfg, Favorites(), Favorites.from_string)
        self.fontSize   = read_pickle_config(config.FONT_SIZE, self.cfg, config.DEFAULT_FONT_SIZE, int)
        self.tuning     = read_pickle_config(config.TUNING, self.cfg, config.DEFAULT_TUNING, int)

    def get_recent(self):
        return self.recent

    def set_recent(self, recent):
        self.cfg.Write(config.RECENT, recent.to_string())

    def get_favs(self):
        return self.favs

    def get_tuning_id(self):        
        return self.tuning

    def set_favs(self, favs):
        self.cfg.Write(config.FAVS, favs.to_string())

    def get_faders(self, path):
        return faders.load_from_file(self.fadersDict, path_to_csd_file(path))

    def setFaders(self, path, val):
        faders.update_file(self.fadersDict, path_to_csd_file(path), val)

    def set_font_size(self, val):
        self.cfg.Write(config.FONT_SIZE, str(val))

    def set_tuning(self, val):
        self.cfg.Write(config.TUNING, str(val))

    def up_font_size(self):
        self.fontSize = min(self.fontSize + 1, 18)
        self.set_font_size(self.fontSize)

    def down_font_size(self):
        self.fontSize = max(self.fontSize - 1, 6)
        self.set_font_size(self.fontSize)

    def close(self, recent, favs, tuningId):
        self.cfg.Write(config.FADERS_DICT_NAME, faders.Faders.to_string(self.fadersDict))
        self.set_favs(favs)
        self.set_recent(recent) 
        self.set_tuning(tuningId)       

    def get_font(self):
        font = wx.SystemSettings.GetFont(wx.SYS_SYSTEM_FONT)
        font.SetPointSize(self.fontSize)        
        return font

def make_node(path, root, tree, nodes, font):
    path1 = path[:]
    if isinstance(nodes, tuple):
        path1.append(nodes[0])
        parent = tree.AppendItem(root, nodes[0], data = wx.TreeItemData(path1))
        tree.SetItemFont(parent, font)
        for x in nodes[1]:            
            make_node(path1, parent, tree, x, font)
    elif isinstance(nodes, str):
        path1.append(nodes)
        itemId = tree.AppendItem(root, nodes, data = wx.TreeItemData(path1))
        tree.SetItemFont(itemId, font)

def make_tree(frame, panel, labels, cbk, font):
    if isinstance(labels, list):
        tree = wx.TreeCtrl(panel, wx.ID_ANY, wx.DefaultPosition, (-1,-1), wx.TR_HIDE_ROOT|wx.TR_HAS_BUTTONS)        
        root = tree.AddRoot('') 
        for x in labels:
            make_node([], root, tree, x, font)      
    elif isinstance(labels, tuple):
        tree = wx.TreeCtrl(panel, 1, wx.DefaultPosition, (-1,-1), wx.TR_HAS_BUTTONS)
        root = tree.AddRoot(labels[0])
        for x in labels[1]:
            make_node([root], root, tree, x, font)    

    def on_selector_changed(event):
        item = event.GetItem()
        cbk(tree.GetItemText(item), tree.GetItemData(item).GetData())

    tree.Bind(wx.EVT_TREE_SEL_CHANGED, on_selector_changed, tree)
    return tree

def slider(frame, v, cbk):
    def go(evt):
        obj = evt.GetEventObject()
        val = obj.GetValue()        
        cbk(float(val) / 100)

    sld = wx.Slider(frame, wx.ID_ANY, v, 0, 100)
    sld.Bind(wx.EVT_SCROLL, go)
    return sld 

def strip_ext(x):
    return (os.path.splitext(x))[0]

def get_instrument_path():
    return os.path.join(pkg_resources.resource_filename('tiny_synth', ''), 'instruments')    

def get_instruments():
    instrumentsPath = get_instrument_path()
    dirs = glob.glob(os.path.join(instrumentsPath, '*'))
    cats = map(os.path.basename, dirs)
    cats.sort()
    
    def get_csds(c):
        files = map(lambda x: strip_ext(os.path.basename(x)), glob.glob(os.path.join(instrumentsPath, c, '*')))
        files.sort()
        return (c, files)
    
    return map(get_csds, cats)    


taxonomy = get_instruments()

class PageOne(wx.Panel):
    def __init__(self, parent, frame):
        wx.Panel.__init__(self, parent)
        tree = make_tree(frame, self, taxonomy, frame.on_selector_changed, frame.state.get_font())
        vbox = wx.BoxSizer(wx.VERTICAL)
        vbox.Add(tree, 1, wx.EXPAND)
        self.SetSizer(vbox)
        frame.fontObjects.append_tree(tree)

def make_recent_tree(panel, frame, recent):    
    return make_tree(frame, panel, map(str, recent.items), frame.on_selector_changed, frame.state.get_font())

def make_tree_stub(panel, name, font):
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
        self.tree = make_tree_stub(self, name, frame.state.get_font())
        self.cbk = frame.on_selector_changed

        def on_selector_changed(event):
            item = event.GetItem()
            frame.on_selector_changed(self.tree.GetItemText(item), self.tree.GetItemData(item).GetData())

        self.tree.Bind(wx.EVT_TREE_SEL_CHANGED, on_selector_changed, self.tree)
        frame.fontObjects.append_tree(self.tree)

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
 
def fill_tree(tree, items, name, font):
    tree.DeleteAllItems()
    root = tree.AddRoot(name) 
    tree.SetItemFont(root, font)
    for x in items:
        itemId = tree.AppendItem(root, str(x[0]), data = wx.TreeItemData(x[1]))
        tree.SetItemFont(itemId, font)

    tree.ExpandAll()

def path_to_csd_file(path):
    instrumentsPath = get_instrument_path()
    return os.path.join(instrumentsPath, *path) + u'.csd'

class FontObjects():
    def __init__(self):
        self.title = None
        self.texts = []
        self.trees = []

    def set_title(self, val):
        self.title = val

    def append_text(self, val):
        self.texts.append(val)

    def append_tree(self, val):
        self.trees.append(val)

    def update(self, font):
        for x in self.texts:
            x.SetFont(font)

        for x in self.trees:
            update_font_for_tree(x, font)

        font.SetWeight(wx.FONTWEIGHT_BOLD)
        self.title.SetFont(font)

def iterate_tree(tree, cbk):
    iterate_tree_child(tree, tree.GetRootItem(), cbk)

def iterate_tree_child(tree, item, cbk):    
    cbk(tree, item)
    (child, cookie) = tree.GetFirstChild(item)    
    while child.IsOk():
        cbk(tree, child)
        iterate_tree_child(tree, child, cbk)
        (child, cookie) = tree.GetNextChild(item, cookie)

def update_font_for_tree(tree, font):
    def go(tree, item):
        tree.SetItemFont(item, font)

    iterate_tree(tree, go)


class MyFrame(wx.Frame):
    def __init__(self, parent, id, title, state):
        wx.Frame.__init__(self, parent, id, title, wx.DefaultPosition, wx.Size(420, 500))

        self.recent = state.get_recent()
        self.favs = state.get_favs()
        self.tuningId = state.get_tuning_id()
        self.currentTrack = None
        self.state = state
        self.fontObjects = FontObjects()

        self.player = Player()
        self.player.set_tuning(self.tuningId)

        vbox = wx.BoxSizer(wx.VERTICAL)
        panel1 = wx.Panel(self, -1)
        panel2 = wx.Panel(self, -1)
        piano  = Piano(self, wx.ID_ANY, self.player)

        def on_note_on(evt):
            pch, vol = evt.GetValue()
            piano.key_on(pch)

        def on_note_off(evt):
            pch, vol = evt.GetValue()
            piano.key_off(pch)     

        self.midis = midi.MidiThread(self, self.player)
        self.midis.run()
        self.Bind(midi.EVT_NOTE_ON, on_note_on)
        self.Bind(midi.EVT_NOTE_OFF, on_note_off)

        self.Bind(wx.EVT_CLOSE, self.on_exit)

        p = panel1
        nb = wx.Notebook(p)

        # create the page windows as children of the notebook
        page1 = PageOne(nb, self)
        page2 = PageTwo(nb, self, config.RECENT)
        page3 = PageTwo(nb, self, config.FAVS)

        self.recentPanel = page2
        self.favsPanel   = page3
        self.currentTab  = 0


        # add the pages to the notebook with the label to show on the tab
        nb.AddPage(page1, "Library")
        nb.AddPage(page2, "Recent")
        nb.AddPage(page3, "Favorites")
        self.tabs = nb

        self.Bind(wx.EVT_NOTEBOOK_PAGE_CHANGED, self.on_page_changed)

        # finally, put the notebook in a sizer for the panel to manage
        # the layout
        sizer = wx.BoxSizer()
        sizer.Add(nb, 1, wx.EXPAND)
        p.SetSizer(sizer)

        self.display = wx.StaticText(panel2, -1, '',(10,10), style=wx.ALIGN_CENTRE)
        font = state.get_font()
        font.SetWeight(wx.FONTWEIGHT_BOLD)
        self.display.SetFont(font)
        self.fontObjects.set_title(self.display)

        hbox = hor([panel1, panel2])

        self.uiFaders = {}

        def make_slider(name):
            def cbk(val):
                self.player.setValue(name, val)
            ui = slider(panel2, 0, cbk)            
            self.uiFaders[name] = ui
            text = staticText(panel2, name, font = self.state.get_font())
            self.fontObjects.append_text(text)
            return ver([Cell(ui, border = 7), Cell(text, flags = wx.ALIGN_CENTRE, border = 7)])
        
        vbox2 = ver([staticText(panel2, ''), make_slider(config.VOLUME), make_slider(config.FX), make_slider(config.CUT_OFF), make_slider(config.RESONANCE)])
        panel2.SetSizer(vbox2)
        self.SetSizer(ver([Cell(hbox, scale = 3.8), Cell(piano, scale = 1)]))
        self.Centre()

        self.init_player_file()
        
        def set_tuning(n):
            def go(evt):
                self.tuningId = n
                self.player.set_tuning(n)
            return go

        make_menu_bar(self, [
              menuItem('&File',[
                  normalItem('Add to favs', cbk = self.on_add_to_favs)
                , normalItem('Remove from favs', cbk = self.on_remove_frome_favs)
               # , normalItem('Settings')
                ])
            , menuItem('&Edit', [
                  normalItem('Enlarge font', cbk = self.on_font_up)
                , normalItem('Shrink  font', cbk = self.on_font_down)
                , menuItem('Tuning', [ radioItem(name, cbk = set_tuning(i), is_check = self.tuningId == i) for i, name in enumerate(config.TUNINGS) ])
            ])  
            , menuItem('&Help',[                  
                normalItem('About', cbk = self.on_about)  
                ])])


        up_font_id = wx.NewId()
        down_font_id = wx.NewId()        
        self.Bind(wx.EVT_MENU, self.on_font_up, id=up_font_id)
        self.Bind(wx.EVT_MENU, self.on_font_down, id=down_font_id)
        self.accel_tbl = wx.AcceleratorTable([(wx.ACCEL_CTRL,  ord('='), up_font_id), (wx.ACCEL_CTRL,  ord('-'), down_font_id)])
        self.SetAcceleratorTable(self.accel_tbl)


    def on_font_up(self, e):       
        self.state.up_font_size()
        self.fontObjects.update(self.state.get_font())


    def on_font_down(self, e):        
        self.state.down_font_size()
        self.fontObjects.update(self.state.get_font())

    def on_add_to_favs(self, event):
        if self.currentTrack:
            self.favs.add(self.currentTrack)

    def on_remove_frome_favs(self, event):
        if self.currentTrack:
            self.favs.remove(self.currentTrack)
        if self.is_favs_tab():
            fill_tree(self.favsPanel.tree, self.favs.items, config.FAVS, self.state.get_font())
        self.favsPanel.Refresh()

    def is_favs_tab(self):
        return self.currentTab == 2

    def on_about(self, e):    
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


    def on_page_changed(self, event):
        old = event.GetOldSelection()
        new = event.GetSelection()
        self.currentTab = new

        if new == 1:
            fill_tree(self.recentPanel.tree, self.recent.items, config.RECENT, self.state.get_font())

        if new == 2:
            fill_tree(self.favsPanel.tree, self.favs.items, config.FAVS, self.state.get_font())

    def on_selector_changed(self, label, path):   
        if (str(label) == config.RECENT or str(label) == config.FAVS or len(path) == 1):
            return
        self.open_file(label, path)

    def set_current(self, track, path):
        self.currentTrack = (track, path)

    def init_player_file(self):
        xs = self.recent.items 
        if xs:
            (label, path) = xs[0]
            self.open_file(label, path)

    def open_file(self, label, path):
        self.close_file()
        self.display.SetLabel('   ' + label)
        faders = self.state.get_faders(path)
        self.player.load(path_to_csd_file(path), faders)
        faders.set_ui(self.uiFaders)
        self.set_current(label, path)
        self.recent.append((label, path))

    def close_file(self): 
        if self.currentTrack:       
            self.state.setFaders(self.get_current_path(), self.get_current_faders())

    def get_current_path(self):        
        return self.currentTrack[1]

    def get_current_faders(self):
        def get(name):
            return float(self.uiFaders[name].GetValue()) / 100

        return faders.Faders(get(config.VOLUME), get(config.FX), get(config.CUT_OFF), get(config.RESONANCE))

    def on_exit(self, evt):
        self.close_file()
        self.player.close()
        self.state.close(self.recent, self.favs, self.tuningId)        
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