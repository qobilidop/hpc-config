# HPC Example

This project provides example job scripts for various HPC sites both as reference and diagnostic tool for our research group.

## Usage

Log in your HPC account and clone the repo:
```console
$ git clone https://github.com/ucsd-galaxy-lab/hpc-example.git
```

`cd` into the corresponding directory and submit test jobs:
```console
$ cd hpc-example/job/tscc
$ qsub hello_hybrid.sh
```

Check results when the job finishes:
```console
$ cat hello_hybrid.log
```
