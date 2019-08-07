#!/bin/bash

if [ $# -lt 4 ]; then
    echo "usage: $0 {node} {njobs} {BLAS|FFT|SVD} {100|1000}"
    exit 1
fi

node=$1
njobs=$2
algorithm=$3
size=$4

dir=${node}-${njobs}

for f in ${dir}/bench*.o*; do
    cat $f | grep -A 1 "${algorithm} (input size: ${size})" | grep '7 runs'
done
