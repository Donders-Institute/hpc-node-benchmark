#!/usr/bin/env/python

import numpy as np

np.random.seed(0)

sizes=(100, 1000)

f = open('vector_matrix.npy','wb')
for size in sizes:
    v = np.random.random(size)
    m = np.random.random((size, size))

    np.save(f,v)
    np.save(f,m)
f.close()
