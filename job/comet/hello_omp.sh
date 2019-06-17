#!/usr/bin/env bash
#SBATCH --job-name="hello_omp"
#SBATCH --output="hello_omp.log"
#SBATCH --partition=compute
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --export=ALL
#SBATCH -D .
#SBATCH -t 00:10:00


set -e
source ./module_reset.sh

BIN=hello_omp

# compile
icc -openmp -o "$BIN" code/"$BIN".c

# run
export OMP_NUM_THREADS="$SLURM_NTASKS_PER_NODE"
./"$BIN"
