#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import math
import numpy

def scaleToMicro(v, u):
    if u == 's':
        return float(v) * 1000000.

    if u == 'ms':
        return float(v) * 1000.

    if u == 'µs':
        return float(v) * 1.

    if u == 'ns':
        return float(v) * 0.001

# error propagation
# mean = (x1 + x2 + x3 ... + xN)/N
# d_mean = sqrt(dx1^2 + dx2^2 + dx3^2 + ... +dxN^2)/N

etimes = []
stdsSquare = 0.
for line in sys.stdin:
    data = line.split()
    etimes.append(scaleToMicro(data[0],data[1]))

    std = scaleToMicro(data[3],data[4])
    stdsSquare += std * std

arr = numpy.array(etimes)
print numpy.mean(arr, axis=0), math.sqrt(stdsSquare) / len(etimes)
