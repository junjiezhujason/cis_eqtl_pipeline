#!/bin/bash 

#################
#SBATCH -p normal
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time 1:00:00
#SBATCH --mem 4000

#################
#all commands that start with SBATCH contain commands that are just used by SLURM for scheduling
#SBATCH --job-name=sim_job
#SBATCH --output=sim_job.%j.out
#SBATCH --error=sim_job.%j.err

SEED=$1
DIR=$2

source /home/jjzhu/source_code/cis_eqtl_pipeline/.env/bin/activate

PROG=/home/jjzhu/source_code/cis_eqtl_pipeline/selective-inference/selection/bayesian/cisEQTLS/tests/sim_generate_data.py

python $PROG generateY -o $DIR -k 16 -s $SEED

