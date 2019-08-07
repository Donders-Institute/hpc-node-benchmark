#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 {node} {job_count}"
    exit 1
fi

node=$1
njobs=$2

## set to hold computation of jobs
echo '0' > .start

## submit jobs
ses=$$
for i in $(seq 1 $njobs); do
    qsub -q tgtest -N bench_${ses}.${i} -l "walltime=20:00,mem=4gb,nodes=${node}" job.sh
done

## check until all jobs are in R state
echo "wait until all jobs are started before kicking off computation."
c=$(qstat -r | grep bench_${ses} | wc -l)
while [[ $c -lt $njobs ]]; do
    sleep 10
    echo "job started: [$c/$njobs]"
    c=$(qstat -r | grep bench_${ses} | wc -l)
done
sleep 30

## information to kick-off computation
echo '1' > .start
echo "computation started."
