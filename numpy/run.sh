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
    rm -f bench_${ses}.${i} 2>&1
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

## signal to kick-off job 
echo '1' > .start
echo "job started."

## wait for static matrix and vector data being loaded
c=$(ls bench_${ses}.* 2>/dev/null | wc -l)
while [[ $c -lt $njobs ]]; do
    sleep 10
    echo "job with matrix data loaded: [$c/$njobs]"
    c=$(ls bench_${ses}.* 2>/dev/null | wc -l)
done
## signal to kick-off computation
echo '2' > .start
echo "computation started."
