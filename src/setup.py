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

from cx_Freeze import setup, Executable

include_files = ['resources/keys1.jpg', 'instruments/choir/Choir A.csd']
includes = ['glob', 'pickle', 'os']
excludes = ['_gtkagg', '_tkagg', 'bsddb', 'curses', 'email', 'pywin.debugger',
              'pywin.debugger.dbgcon', 'pywin.dialogs', 'tcl',
              'Tkconstants', 'Tkinter']


base = None
if sys.platform == "win32":
    base = "Win32GUI"

setup(
        name = "hello",
        version = "0.1",
        description = "Sample cx_Freeze wxPython script",
        executables = [Executable("main.py", base = base)],
        options = {'build_exe': 
            { 'excludes' :excludes
            #, 'packages' :packages
            , 'include_files': include_files}})

