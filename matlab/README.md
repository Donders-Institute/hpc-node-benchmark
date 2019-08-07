# test case: MATLAB

This test runs the `ft_freqanalysis` function of [fieldtrip](http://www.fieldtriptoolbox.org). 

## lauch the test

The `run.sh` script is prepared for lauching the test.  The script takes two arguments: 1) the hostname of the node on which the computation jobs are executed, 2) the amount of concurrent jobs.

For example, to launch the test on node `dccn-c055.dccn.nl` with `4` concurrent jobs:

```bash
$ ./run.sh dccn-c055.dccn.nl 4
```

## collect the results and produce plots

Follow the following steps to collect results and produce plots:

1. for each test run, save the stdout file (i.e. `*.o*`) to a folder named in the following conventiof `<node_name>-<number_of_concurrent_jobs>`. For example, in the previous example of launching the test, you might want to collect the output files in a folder called `c055-4`. You may run the same test multiple times to increase the statistics.  Outputs from multiple runs can be collected in the same folder.

2. once you have performed multiple different tests (e.g. on a different nodes, or with different number of concurrent jobs), you will end up with multiple result folders similar to

   ```bash
   $ tree -L 1 -d
   .
   |-- c054-1
   |-- c054-16
   |-- c054-2
   |-- c054-27
   |-- c054-4
   |-- c054-8
   |-- c055-1
   |-- c055-16
   |-- c055-2
   |-- c055-32
   |-- c055-4
   |-- c055-40
   |-- c055-48
   |-- c055-56
   |-- c055-63
   `-- c055-8
   ```

   The next step is to check the script `gen_plot_data.sh` and modify it accordingly to create data set for plot.  This script loops over the stdout files in the directory to get the elapsed time of the computation, calculates the statistical mean and standard deviation, and finally creates a tabular format that is ready to plot. The tabular data is stored in a file `plot.dat`.

3. Plot the data with the R script `plot.R`. It assumes that the `plot.dat` file is available right in the current directory.  It requires R and the ggplot module, which is available on the cluster. To generate the plot, use the following command:

   ```bash
   $ module load R
   $ Rscript plot.R
   ```

   The output file (`fieldtrip.eps`) is in the EPS format.
