#!/bin/bash

module load matlab/R2011b

cd $PBS_O_WORKDIR

echo -n "wait "

# wait for start signal to be set in the .start file.
v=$(cat $PBS_O_WORKDIR/.start)
while [[ $v -ne 1 ]]; do
    v=$(cat $PBS_O_WORKDIR/.start)
done
echo

# log timestamp of the start time
date +%s

# run benchmark script
matlab -r "fieldtrip"
