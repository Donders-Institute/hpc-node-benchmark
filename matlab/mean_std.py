#!/usr/bin/env python

import sys
import numpy

etimes = []
for line in sys.stdin:
    etimes.append(float(line))

arr = numpy.array(etimes)
print numpy.mean(arr, axis=0), numpy.std(arr, axis=0)
