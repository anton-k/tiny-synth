import os.path
from pkg_resources import resource_filename

recent = 'recent'
favs   = 'favourites'
fontSize = 'font-size'
defaultFontSize = 12
key_pic = resource_filename("tiny_synth.resources", "keys1.jpg").encode('utf8')

instrumentsPath ='instruments'
cfgName = 'tiny-synth-config'
fadersDictName = 'faders-dict'


volume = 'volume'
fx = 'fx'
cutOff = 'cut-off'
resonance = 'resonance'