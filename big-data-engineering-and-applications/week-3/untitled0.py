#!/usr/bin/python3
"""
@author: mark baber
"""
import sys
for line in sys.stdin:
    line = line.strip()
    keys = line.split()
    for key in keys:
        value = 1
        print( "%s\t%d" % (key, value) )