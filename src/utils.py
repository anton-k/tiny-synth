import wx

# -------------------------------------------------
# App utils

def myApp(setup, title = '', size = None):
    app = wx.App()
    frame = wx.Frame(None, -1, title)
    setup(frame)
    frame.Centre()
    if size:
        frame.SetSize(size)
    frame.Show(True)
    app.MainLoop()    

def runApp(setup, title='', size=None):
    myApp(setup, title, size)

# -------------------------------------------------
# Menu utils

class Item():
    def __init__(self, title, cbk = None, kind = wx.ITEM_NORMAL, children = []):
        self.title = title
        self.cbk   = cbk
        self.kind  = kind
        self.children = children

def radioItem(title, cbk = None):
    return Item(title, cbk, wx.ITEM_RADIO)

def normalItem(title, cbk = None):
    return Item(title, cbk, wx.ITEM_NORMAL)

def echoPress(label):
    def go(evt):
        print ("Pressed %s" % label)    
    return go

def echoNormalItem(title):
    return normalItem(title, cbk = echoPress(title))

def echoCheckItem(title):
    return checkItem(title, cbk = echoPress(title))

def echoRadioItem(title):
    return radioItem(title, cbk = echoPress(title))

def checkItem(title, cbk = None):
    return Item(title, cbk, wx.ITEM_CHECK)

def menuItem(title, items):
    return Item(title, children = items)

def mkItem(root, parent, item):
    x = wx.MenuItem(parent, wx.ID_ANY, item.title, kind=item.kind)
    parent.AppendItem(x)
    root.Bind(wx.EVT_MENU, item.cbk, x)

def mkMenu(root, menubar, title, items):
    res = wx.Menu()
    for item in items:
        if item.children:
            mkSubMenu(root, res, item.title, item.children)
        else:
            mkItem(root, res, item)            
    menubar.Append(res, title)
    return res

def mkSubMenu(root, parent, title, items):
    submenu = wx.Menu()
    for item in items:
        mkItem(root, submenu, item)                
    parent.AppendMenu(wx.ID_ANY, title, submenu)

def mkMenuBar(frame, items):
    menubar = wx.MenuBar()
    for item in items:
        mkMenu(frame, menubar, item.title, item.children)
    frame.SetMenuBar(menubar)

# -------------------------------------------------
# layout utils

class Cell():
    def __init__(self, item, scale = 1, flags = wx.EXPAND | wx.ALL, border = 0):
        self.item = item
        self.scale = scale
        self.flags = flags
        self.border = border

def box(orient, xs):
    box = wx.BoxSizer(orient)
    for x in xs:
        if not isinstance(x, Cell):
            x = Cell(x)
        box.Add(x.item, x.scale, x.flags, x.border)        
    return box

def hor(xs):
    return box(wx.HORIZONTAL, xs)

def ver(xs):
    return box(wx.VERTICAL, xs)

def unCell(x):
    if isinstance(x, Cell):
        return (x.item, x.scale, x.flags)
    else:
        return unCell(Cell(x))

def grid(rows, cols, vgap, hgap, xs):
    gs = wx.GridSizer(rows, cols, vgap, hgap)
    gs.AddMany([unCell(x) for x in xs])
    return gs

# ----------------------------------------------------------
# Widgets

def button(root, title, cbk):
    b = wx.Button(root, wx.ID_ANY, title)
    root.Bind(wx.EVT_BUTTON, cbk, b)
    return b    

def staticText(root, title, font = None):
    res = wx.StaticText(root, wx.ID_ANY, title, style = wx.ALIGN_CENTRE)
    if font:
        res.SetFont(font)
    return res