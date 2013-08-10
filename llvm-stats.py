#!/usr/bin/env python

import sys
import re
import os
import os.path
import fnmatch

def grovel(library_name, stat):
    method_re = re.compile('^METHOD ')
    dir = os.path.join(sys.argv[2], library_name)
    for file in fnmatch.filter(os.listdir(dir), '*.dfm'):
        fn = open(os.path.join(dir, file), 'r')
        for line in fn:
            if method_re.match(line):
                stat['ieps'] += 1
        fn.close()

def analyze():
    gen_re = re.compile(r'^Generating code for (.*)')
    err_re = re.compile(r'^emit ')

    stats = {}
    library_name = ''
    fn = open(sys.argv[1])
    for line in fn:
        m = gen_re.match(line)
        if m:
            library_name = m.group(1)
            stat = {'errors': 0, 'ieps': 0}
            stats[library_name] = stat
            grovel(library_name, stat)

        e = err_re.match(line)
        if e:
            stats[library_name]['errors'] += 1

    fn.close()
    return stats

def report(stats):
    for name, stat in stats.iteritems():
        sys.stdout.write("%-20s %5d IEPs %5d errors (%.1f%% completed)\n" %
                         (name, stat['ieps'], stat['errors'],
                          (stat['ieps'] - stat['errors']) * 100 / stat['ieps']))

if __name__ == '__main__':
    stats = analyze()
    report(stats)
