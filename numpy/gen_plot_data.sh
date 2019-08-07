#!/bin/bash

for a in BLAS FFT SVD; do
    fdata=plot_${a,,}.dat

    if [ -f $fdata ]; then
        rm $fdata
    fi

    for s in 100 1000; do
        ## intel node c054
        for i in 1 2 4 8 16 27; do echo -n "intel $a $s $i "; ./parse_out.sh c054 $i $a $s | ./mean_std.py ; done >> $fdata 
 
        ## amd node c055
        for i in 1 2 4 8 16 32 63; do echo -n "amd $a $s $i "; ./parse_out.sh c055 $i $a $s | ./mean_std.py ; done >> $fdata
    done
done
