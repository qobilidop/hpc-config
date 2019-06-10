#!/usr/bin/env bash
#PBS -N hello_mpi
#PBS -q condo
#PBS -l nodes=2:ppn=16:ib
#PBS -l walltime=00:10:00
#PBS -j oe
#PBS -o hello_mpi.log
#PBS -d .
set -e

BIN=hello_mpi

# reset module
module purge
module load intel openmpi_ib

# compile
mpicc -o "$BIN" code/"$BIN".c

# run
mpirun -v -machinefile "$PBS_NODEFILE" -npernode 16 ./"$BIN"
