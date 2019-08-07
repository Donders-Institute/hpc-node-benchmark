#!/bin/bash

module load anaconda3/5.0.0

cd $PBS_O_WORKDIR

# here we assume the conda envivonment demo is provisioned with
#
# - conda install nomkl
# - conda install numpy
#
source activate demo

echo -n "wait "

# wait for start signal to be set in the .start file.
v=$(cat $PBS_O_WORKDIR/.start)
while [[ $v -ne 1 ]]; do
    #echo -n "."
    #sleep 1
    v=$(cat $PBS_O_WORKDIR/.start)
done
echo

# log timestamp of the start time
date +%s

# run benchmark script
ipython numpy_simple.ipy
