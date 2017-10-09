#!/bin/bash 

#################
#SBATCH --partition=hns,normal
#SBATCH --ntasks=1  
#SBATCH --cpus-per-task=1
#SBATCH --time=00:00:05
#SBATCH --mem=4000

#################
#all commands that start with SBATCH contain commands that are just used by SLURM for scheduling
#SBATCH --job-name=test_job
#SBATCH --output=test_job/test_job.%j.out
#SBATCH --error=test_job/test_job.%j.err

echo "waiting for 1 minute"

srun -c1 sleep 1m

echo "done"
