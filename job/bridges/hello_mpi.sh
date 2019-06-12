#!/usr/bin/env bash
#SBATCH -J hello_mpi
#SBATCH -p RM-small
#SBATCH -N 2
#SBATCH --ntasks-per-node=28
#SBATCH -t 00:10:00
#SBATCH -o hello_mpi.log
#SBATCH -D .
set -e
source ./module_reset.sh

BIN=hello_mpi

# compile
mpiicc -o "$BIN" code/"$BIN".c

# run
export  I_MPI_JOB_RESPECT_PROCESS_PLACEMENT=0
mpirun -ppn "$SLURM_NTASKS_PER_NODE" ./"$BIN"
