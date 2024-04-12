#!/bin/bash -e

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=12
#SBATCH --time=04:00:00
#SBATCH --mem=20GB
#SBATCH --gres=gpu:1
#SBATCH --job-name=gromacs

module purge

# Specify GPU direct communication should be used
export GMX_ENABLE_DIRECT_GPU_COMM=1

# Specify GPU PME decomposition should be used
export GMX_GPU_PME_DECOMPOSITION=1

n_cpus=${SLURM_CPUS_PER_TASK}

for e in $(env | egrep ^SLURM_ | cut -d= -f1); do unset ${e}; done

/scratch/work/public/singularity/run-gromacs-2023-cuda-11.8.bash \
    gmx_mpi mdrun -v -noconfout -dlb no \
    -deffnm md_0_50 \
    -pin on \
    -ntomp ${n_cpus} \
    -pme gpu \
    -bonded gpu \
    -update gpu
