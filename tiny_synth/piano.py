import wx
import tiny_synth.config as config

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
        self.track_move = False
        self.current_key = None
        self.active_keys = []
        self.player = player

        self.Bind(wx.EVT_PAINT, self.on_paint)
        self.Bind(wx.EVT_SIZE, self.on_size)
        self.Bind(wx.EVT_LEFT_DOWN, self.on_click)
        self.Bind(wx.EVT_LEFT_UP, self.on_release)
        self.Bind(wx.EVT_MOTION, self.on_motion)

    def on_paint(self, event):        
        self.paint_board()        

    def get_mouse_point(self):
        w, h = self.GetSize()
        def rescale(x, y):
            return (float(x)/w, float(y)/h)
        return rescale(*self.ScreenToClient(wx.GetMousePosition()))

    def get_current_key(self):
        return get_key_num(*self.get_mouse_point())

    def key_on(self, n):        
        if is_visible_key(n):
            self.active_keys.append(to_piano_key(n))
            self.redraw()

    def key_off(self, n):
        if is_visible_key(n):
            if not(n in self.active_keys):
                self.active_keys.remove(to_piano_key(n))
                self.redraw()           

    def redraw(self):
        self.paint_board()        
        for key in self.active_keys:
            self.paint_key(key)
        if self.current_key is not None:
            self.paint_key(self.current_key)


    def play_note_on(self, key):
        if key is not None:
            self.player.note_on(key_to_midi(key), 60)

    def play_note_off(self, key): 
        if key is not None:
            self.player.note_off(key_to_midi(key), 60)

    def on_click(self, event):        
        self.current_key = self.get_current_key()        
        self.redraw()
        self.track_move = True

        self.play_note_on(self.current_key)

    def on_release(self, event):        
        self.play_note_off(self.current_key)
        self.track_move = False
        self.current_key = None 
        self.redraw()        

    def on_motion(self, event):
        if self.track_move:    
            p = self.get_mouse_point()
            if self.current_key:
                for r in KEY_RECT_BY_NUM[self.current_key % 12]:
                    if within_rect(p, r):
                        return True                        
            key = self.get_current_key()
            if key == self.current_key:
                return True    
            
            self.play_note_off(self.current_key)
            if key is not None:
                self.play_note_on(key)
            self.current_key = key            
            self.redraw()

    def on_size(self, event):
        self.Refresh()

    def paint_board(self):
        dc = wx.PaintDC(self)
        w, h = self.GetSize()        
        bmp = scale_bitmap(wx.Bitmap(config.KEY_PIC), w/2, h)
        dc.DrawBitmap(bmp, 0, 0)
        dc.DrawBitmap(bmp, w/2, 0)

    def paint_key(self, n):
        dc = wx.PaintDC(self)
        w, h = self.GetSize()
        pen = wx.Pen('blue')
        pen.SetWidth(4)
        dc.SetPen(pen)
        
        def to_abs(x):
            if (n < 12):
                return (w * x[0], h * x[1], w * x[2], h * x[3])
            else:
                return (w/2 + w * x[0], h * x[1], w/2 + w * x[2], h * x[3])

        dc.DrawLineList(map(to_abs, keyLines[n % 12]))

topY = 0.02
halfTopY = 0.645
botY = 0.975
halfBotY = botY - halfTopY
keyStart = [ 0.003, 0.043, 0.072,  0.13,  0.144,  0.221
           , 0.257, 0.29,  0.34, 0.36, 0.42, 0.435]

keyLen =   [0.061, 0.045 , 0.061, 0.045, 0.061,  0.061
           , 0.045, 0.061, 0.043, 0.061, 0.043, 0.061]

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

def within_rect(p, rect):
    x, y = p
    xr, yr, wr, hr = rect
    return (x >= xr and x < xr + wr and y >= yr and y < yr + hr)

def get_key_num(x, y):
    if x >= 0.5:
        x1 = x - 0.5
        dn = 12
    else:
        dn = 0
        x1 = x
    for i, rect in KEY_RECTS:
        if within_rect((x1, y), rect):
            return (i + dn)
    return None
    

KEY_RECTS = [
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

KEY_RECT_BY_NUM = [[y for i, y in KEY_RECTS if i == x] for x in range(12)]
