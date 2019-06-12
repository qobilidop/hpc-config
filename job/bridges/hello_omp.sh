#!/usr/bin/env bash
#SBATCH -J hello_omp
#SBATCH -p RM-small
#SBATCH -N 1
#SBATCH --ntasks-per-node=28
#SBATCH -t 00:10:00
#SBATCH -o hello_omp.log
#SBATCH -D .
set -e
source ./module_reset.sh

BIN=hello_omp

# compile
icc -qopenmp -o "$BIN" code/"$BIN".c

# run
export OMP_NUM_THREADS="$SLURM_NTASKS_PER_NODE"
./"$BIN"
