from pkg_resources import resource_filename

RECENT = 'recent'
FAVS   = 'favourites'
FONT_SIZE = 'font-size'
DEFAULT_FONT_SIZE = 12

TUNING = 'tuning'
DEFAULT_TUNING = 0
KEY_PIC = resource_filename("tiny_synth.resources", "keys1.jpg").encode('utf8')

INSTRUMENTS_PATH ='instruments'
CFG_NAME = 'tiny-synth-config'
FADERS_DICT_NAME = 'faders-dict'

TUNINGS = ['Equal temperament', 'Meantone temperament', 'Pythagorean tuning', 'Just intonation', 'Thomas Young 1', 'Thomas Young 2', 'Werkmeister']

VOLUME = 'volume'
FX = 'fx'
CUT_OFF = 'cut-off'
RESONANCE = 'resonance'