#! /bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=2:00:00
#SBATCH --mem=10G
#SBATCH --mail-type=BEGIN,FAIL
#SBATCH --signal=SIGHUP@90
