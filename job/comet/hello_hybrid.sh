#!/usr/bin/env bash
#SBATCH --job-name="hello_hybrid"
#SBATCH --output="hello_hybrid.log"
#SBATCH --partition=debug
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=24
#SBATCH --export=ALL
#SBATCH -D .
#SBATCH -t 00:10:00

# note that comet doesn't play nice with cpus-per-task, so you
# have to ask for all the cores on a node and then set the 
# npernode to ntasks-per-node/OMP_NUM_THREADS

set -e
source ./module_reset.sh

BIN=hello_hybrid

# compile
mpicc -openmp -o "$BIN" code/"$BIN".c

# run
export OMP_NUM_THREADS=2 
ibrun --npernode 12 ./"$BIN"
