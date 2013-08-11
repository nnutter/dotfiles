#!/usr/bin/python

import sys
import os
import whisper
from optparse import OptionParser

option_parser = OptionParser(usage='''%prog path''')
(options, args) = option_parser.parse_args()

if len(args) < 1:
    option_parser.print_usage()
    sys.exit(1)

path = args[0]

try:
    info = whisper.info(path)
except whisper.CorruptWhisperFile:
    print "Removing corrupt whisper file: {0}".format(path)
    os.remove(path)
    sys.exit(0)
