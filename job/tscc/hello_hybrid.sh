#!/usr/bin/env bash
#PBS -N hello_hybrid
#PBS -q condo
#PBS -l nodes=2:ppn=16:ib
#PBS -l walltime=00:10:00
#PBS -j oe
#PBS -o hello_hybrid.log
#PBS -d .
set -e

BIN=hello_hybrid

# reset module
module purge
module load intel openmpi_ib

# compile
mpicc -openmp -o "$BIN" code/"$BIN".c

# run
export OMP_NUM_THREADS=2
mpirun -v -machinefile "$PBS_NODEFILE" -x OMP_NUM_THREADS -npernode 8 ./"$BIN"
