#!/bin/bash

## intel node c054
for i in 1 2 4 8 16 27; do echo -n "intel $i "; ./parse_out.sh c054 $i | ./mean_std.py ; done > plot.dat

## amd node c054
for i in 1 2 4 8 16 32 40 48 56 63; do echo -n "amd $i "; ./parse_out.sh c055 $i | ./mean_std.py ; done >> plot.dat
