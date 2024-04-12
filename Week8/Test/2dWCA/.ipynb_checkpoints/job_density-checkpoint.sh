#!/bin/bash
#SBATCH --job-name=LASSI
#SBATCH --nodes=1
#SBATCH --tasks-per-node=8
#SBATCH --mem=80GB
#SBATCH --time=24:00:00
d=0.5
dmax=1.1
inc=0.1
indexd=5
indexdmax=11
while [ ${indexd} -le ${indexdmax} ]
    do
    echo "test"
    mpirun lmp -var density ${d} -in ../Inputs/2dWCA.in -log log_density_${d}.file
    d=$(echo "$d+$inc" |bc -l)
    indexd=$(($indexd+1))
done
