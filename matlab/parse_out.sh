#!/bin/bash

if [ $# -lt 2 ]; then
    echo "usage: $0 {node} {njobs}"
    exit 1
fi

node=$1
njobs=$2

dir=${node}-${njobs}

for f in ${dir}/bench*.o*; do
    cat $f | grep 'Elapsed time' | awk '{print $4}' | tail -n +2
done
