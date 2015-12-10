import wx
import inits

def scale_bitmap(bitmap, width, height):
    image = wx.ImageFromBitmap(bitmap)
    image = image.Scale(width, height, wx.IMAGE_QUALITY_HIGH)
    result = wx.BitmapFromImage(image)
    return result

def is_visible_key(n):
    return n >= 48 and n <= 71

def to_piano_key(n):
    return n - 48

def key_to_midi(n):
    return n + 48

class Piano(wx.Panel):
    def __init__(self, parent, id, player):
        wx.Panel.__init__(self, parent, id)
        self.parent = parent
        self.trackMove = False
        self.currentKey = None
        self.active_keys = []
        self.player = player

        self.Bind(wx.EVT_PAINT, self.OnPaint)
        self.Bind(wx.EVT_SIZE, self.OnSize)
        self.Bind(wx.EVT_LEFT_DOWN, self.OnClick)
        self.Bind(wx.EVT_LEFT_UP, self.OnRelease)
        self.Bind(wx.EVT_MOTION, self.OnMotion)

    def OnPaint(self, event):        
        self.paintBoard()        

    def getMousePoint(self):
        w, h = self.GetSize()
        def rescale(x, y):
            return (float(x)/w, float(y)/h)
        return rescale(*self.ScreenToClient(wx.GetMousePosition()))

    def getCurrentKey(self):
        return getKeyNum(*self.getMousePoint())

    def keyOn(self, n):        
        if is_visible_key(n):
            self.active_keys.append(to_piano_key(n))
            self.redraw()

    def keyOff(self, n):
        if is_visible_key(n):
            if not(n in self.active_keys):
                self.active_keys.remove(to_piano_key(n))
                self.redraw()           

    def redraw(self):
        self.paintBoard()        
        for key in self.active_keys:
            self.paintKey(key)
        if self.currentKey is not None:
            self.paintKey(self.currentKey)


    def playNoteOn(self, key):
        if key is not None:
            self.player.noteOn(key_to_midi(key), 60)

    def playNoteOff(self, key): 
        if key is not None:
            self.player.noteOff(key_to_midi(key), 60)

    def OnClick(self, event):        
        self.currentKey = self.getCurrentKey()        
        self.redraw()
        self.trackMove = True

        self.playNoteOn(self.currentKey)

    def OnRelease(self, event):        
        self.playNoteOff(self.currentKey)
        self.trackMove = False
        self.currentKey = None 
        self.redraw()        

    def OnMotion(self, event):
        if self.trackMove:    
            p = self.getMousePoint()
            if self.currentKey:
                for r in keyRectByNum[self.currentKey % 12]:
                    if withinRect(p, r):
                        return True                        
            key = self.getCurrentKey()
            if key == self.currentKey:
                return True    
            
            self.playNoteOff(self.currentKey)
            if key is not None:
                self.playNoteOn(key)
            self.currentKey = key            
            self.redraw()

    def OnSize(self, event):
        self.Refresh()

    def paintBoard(self):
        dc = wx.PaintDC(self)
        w, h = self.GetSize()        
        bmp = scale_bitmap(wx.Bitmap(inits.key_pic), w/2, h)
        dc.DrawBitmap(bmp, 0, 0)
        dc.DrawBitmap(bmp, w/2, 0)

    def paintKey(self, n):
        dc = wx.PaintDC(self)
        w, h = self.GetSize()
        pen = wx.Pen('blue')
        pen.SetWidth(4)
        dc.SetPen(pen)
        
        def toAbs(x):
            if (n < 12):
                return (w * x[0], h * x[1], w * x[2], h * x[3])
            else:
                return (w/2 + w * x[0], h * x[1], w/2 + w * x[2], h * x[3])

        dc.DrawLineList(map(toAbs, keyLines[n % 12]))

topY = 0.02
halfTopY = 0.645
botY = 0.975
halfBotY = botY - halfTopY
keyStart = [0.003, 0.043, 0.072,  0.13,  0.144,  0.221, 0.257, 0.29,  0.34, 0.36, 0.42, 0.435]
keyLen =   [0.061, 0.045 , 0.061, 0.045, 0.061,  0.061, 0.045, 0.061, 0.043, 0.061, 0.043, 0.061]

keyLines = [   
      [(keyStart[0], topY, keyStart[0], botY), (keyStart[0], botY, keyStart[0] + keyLen[0], botY)]   
    , [(keyStart[1], topY, keyStart[1], halfTopY), (keyStart[1], halfTopY, keyStart[1] + keyLen[1], halfTopY)]   
    , [(keyStart[2], halfTopY, keyStart[2], botY), (keyStart[2], botY, keyStart[2] + keyLen[2], botY)]
    , [(keyStart[3], topY, keyStart[3], halfTopY), (keyStart[3], halfTopY, keyStart[3] + keyLen[3], halfTopY)]   
    , [(keyStart[4], halfTopY, keyStart[4], botY), (keyStart[4], botY, keyStart[4] + keyLen[4], botY)]
    , [(keyStart[5], topY, keyStart[5], botY), (keyStart[5], botY, keyStart[5] + keyLen[5], botY)]   
    , [(keyStart[6], topY, keyStart[6], halfTopY), (keyStart[6], halfTopY, keyStart[6] + keyLen[6], halfTopY)]   
    , [(keyStart[7], halfTopY, keyStart[7], botY), (keyStart[7], botY, keyStart[7] + keyLen[7], botY)]    
    , [(keyStart[8], topY, keyStart[8], halfTopY), (keyStart[8], halfTopY, keyStart[8] + keyLen[8], halfTopY)]       
    , [(keyStart[9], halfTopY, keyStart[9], botY), (keyStart[9], botY, keyStart[9] + keyLen[9], botY)]    
    , [(keyStart[10], topY, keyStart[10], halfTopY), (keyStart[10], halfTopY, keyStart[10] + keyLen[10], halfTopY)]   
    , [(keyStart[11], halfTopY, keyStart[11], botY), (keyStart[11], botY, keyStart[11] + keyLen[11], botY)]    
]

def withinRect(p, rect):
    x, y = p
    xr, yr, wr, hr = rect
    return (x >= xr and x < xr + wr and y >= yr and y < yr + hr)

def getKeyNum(x, y):
    if x >= 0.5:
        x1 = x - 0.5
        dn = 12
    else:
        dn = 0
        x1 = x
    for i, r in keyRects:
        if withinRect((x1, y), r):
            return (i + dn)
    return None
    

keyRects = [
      (0, (0,     0, 0.043, halfTopY))
    , (1, (0.043, 0, 0.045, halfTopY))
    , (2, (0.088, 0, 0.042, halfTopY))
    , (3, (0.13,  0, 0.045, halfTopY))
    , (4, (0.175, 0, 0.046, halfTopY))
    , (5, (0.221, 0, 0.036, halfTopY))
    , (6, (0.257, 0, 0.045, halfTopY))
    , (7, (0.302, 0, 0.038, halfTopY))
    , (8, (0.34,  0, 0.043, halfTopY))
    , (9, (0.383, 0, 0.037, halfTopY))
    , (10, (0.42, 0, 0.043, halfTopY))
    , (11, (0.463, 0, 0.037, halfTopY))
    , (0, (0, halfTopY, 0.072, halfBotY))
    , (2, (0.072, halfTopY, 0.072, halfBotY))
    , (4, (0.144, halfTopY, 0.077, halfBotY))
    , (5, (0.221, halfTopY, 0.068, halfBotY))
    , (7, (0.29, halfTopY, 0.07, halfBotY))
    , (9, (0.36, halfTopY, 0.075, halfBotY))
    , (11, (0.433, halfTopY, 0.065, halfBotY))
]

keyRectByNum = [[y for i, y in keyRects if i == x] for x in range(12)]
