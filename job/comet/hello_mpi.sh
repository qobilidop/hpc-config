#!/usr/bin/env bash
#SBATCH -A csd453
#SBATCH --job-name="hello_mpi"
#SBATCH --output="hello_mpi.log"
#SBATCH --partition=compute
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=24
#SBATCH --export=ALL
#SBATCH -D .
#SBATCH -t 00:10:00
set -e
source ./module_reset.sh

BIN=hello_mpi

# compile
mpicc -o "$BIN" code/"$BIN".c

# run
ibrun ./"$BIN"
