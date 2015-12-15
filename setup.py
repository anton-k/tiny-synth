# A simple setup script to create an executable running wxPython. This also
# demonstrates the method for creating a Windows executable that does not have
# an associated console.
#
# wxapp.py is a very simple "Hello, world" type wxPython application
#
# Run the build process by running the command 'python setup.py build'
#
# If everything works well you should find a subdirectory in the build
# subdirectory that contains the files needed to run the application

import sys
import os.path
import glob

from setuptools import setup, find_packages #, Executable

include_files = ['resources/keys1.jpg', 'instruments/choir/Choir A.csd']
includes = ['glob', 'pickle', 'os']
excludes = ['_gtkagg', '_tkagg', 'bsddb', 'curses', 'email', 'pywin.debugger',
              'pywin.debugger.dbgcon', 'pywin.dialogs', 'tcl',
              'Tkconstants', 'Tkinter']


base = None
if sys.platform == "win32":
    base = "Win32GUI"

instrument_dir = os.path.join("tiny_synth", "instruments")
datafiles = [(x, glob.glob(os.path.join(x, '*'))) for x in glob.glob(os.path.join(instrument_dir, '*'))]
print datafiles

setup(
        name = "tiny_synth",
        version = "0.0",
        description = "Tiny synthesizer based on Csound",
        url = "https://github.com/anton-k/tiny-synth",
        author='Anton Kholomiov',
        author_email='anton.kholomiov@gmail.com',
        license='LGPL',
        packages=find_packages(),
        package_data={'': ['*.jpg', '*.csd']},
        #data_files = datafiles,
        # executables = [Executable("main.py", base = base)],
        #options = {'build_exe': 
        #    { 'excludes' :excludes
        #    #, 'packages' :packages
        #    , 'include_files': include_files}},
        install_requires=[
          'python-rtmidi', 'wxPython'
        ],
        entry_points = {
            'console_scripts': ['tiny-synth=tiny_synth.main:main'],
        },
        include_package_data=True
    )

