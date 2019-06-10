#!/usr/bin/env bash
#PBS -N hello_omp
#PBS -q condo
#PBS -l nodes=1:ppn=16
#PBS -l walltime=00:10:00
#PBS -j oe
#PBS -o hello_omp.log
#PBS -d .
set -e

BIN=hello_omp

# reset module
source ./module_reset.sh

# compile
icc -openmp -o "$BIN" code/"$BIN".c

# run
export OMP_NUM_THREADS=16
./"$BIN"
