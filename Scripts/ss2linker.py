#!/home/igor/anaconda3/bin/python
import itertools
import sys

def ds(func, s):
    return ''.join(list(itertools.dropwhile(func, s)))

def ts(func, s):
    return ''.join(list(itertools.takewhile(func, s)))

def helix(c):
    return c == 'H'

def nonhelix(c):
    return not helix(c)

if len(sys.argv) < 2: 
    exit(1)

sstring = sys.argv[1]
print(len(ts(nonhelix, ds(helix, ds(nonhelix, sstring)))))
