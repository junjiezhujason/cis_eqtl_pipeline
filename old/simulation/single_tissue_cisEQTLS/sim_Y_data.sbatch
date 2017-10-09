#!/bin/bash 

#################
#SBATCH -p normal
#SBATCH -n 32
#SBATCH --time 10:00:00
# maybe set SBATCH --mem 4000

#################
#all commands that start with SBATCH contain commands that are just used by SLURM for scheduling
#SBATCH --job-name=sim_job
#SBATCH --output=sim_job.%j.out
#SBATCH --error=sim_job.%j.err

SEED=$1
DIR=$2

source /home/jjzhu/source_code/cis_eqtl_pipeline/.env/bin/activate

PROG=/home/jjzhu/source_code/cis_eqtl_pipeline/selective-inference/selection/bayesian/cisEQTLS/tests/sim_ciseqtl.py

python $PROG generateY -o $DIR -k 16 -s $SEED
# python $PROG runSimes -o $DIR -k 16 -s $SEED

