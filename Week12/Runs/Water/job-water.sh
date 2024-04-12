#!/bin/bash 

#SBATCH --job-name=AIMD 

#SBATCH --nodes=1 

#SBATCH --tasks-per-node=12 

#SBATCH --mem=80GB 

#SBATCH --time=24:00:00 

module load cp2k/openmpi/intel/20201212 

mpirun -np 12 cp2k.popt -i water.inp -o water_output.log