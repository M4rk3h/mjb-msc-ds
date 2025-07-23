#!/usr/bin/python3
# set the text variable
txt = open('test1.txt', 'r') # open test and read it.
# create a file ?
f = open('test2.txt', 'w')
# loop through each line
# splitting into lines and keys.
for line in txt:
    line = line.strip()
    keys = line.split()
    for key in keys:
        value = 1
        f.write( "%s\t%d" % (key, value) )
# close connections
txt.close()
f.close()