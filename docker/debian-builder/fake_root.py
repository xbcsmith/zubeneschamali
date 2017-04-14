#!/usr/bin/env python
import sys
import subprocess

command = sys.argv[1:]
fakeroot = [ 'fakeroot' ]
if 'fake' in command:
    fakeroot = fakeroot + command
    subprocess.call(fakeroot)
else:
    subprocess.call(command)

sys.exit()

