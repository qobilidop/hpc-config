#!/usr/bin/env bash
#SBATCH -J hello_hybrid
#SBATCH -p RM-small
#SBATCH -N 2
#SBATCH --ntasks-per-node=14
#SBATCH --cpus-per-task=2
#SBATCH -t 00:10:00
#SBATCH -o hello_hybrid.log
#SBATCH -D .
set -e
source ./module_reset.sh

BIN=hello_hybrid

# compile
mpiicc -qopenmp -mt_mpi -o "$BIN" code/"$BIN".c

# run
export I_MPI_JOB_RESPECT_PROCESS_PLACEMENT=0
mpirun -ppn "$SLURM_NTASKS_PER_NODE" -genv OMP_NUM_THREADS="$SLURM_CPUS_PER_TASK" -genv I_MPI_PIN_DOMAIN=omp ./"$BIN"
