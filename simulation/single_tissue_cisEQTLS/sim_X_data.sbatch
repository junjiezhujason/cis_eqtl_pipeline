#!/bin/bash 

#################
#SBATCH -p normal
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time 2:00:00
#SBATCH --mem 4000
#SBATCH --mail-type=END,FAIL      # notifications for job done & fail
#SBATCH --mail-user=jjzhu@stanford.edu # send-to address

#################
#all commands that start with SBATCH contain commands that are just used by SLURM for scheduling
#SBATCH --job-name=sim_job
#SBATCH --output=sim_job.%j.out
#SBATCH --error=sim_job.%j.err

source /home/jjzhu/source_code/cis_eqtl_pipeline/.env/bin/activate

PROG=/home/jjzhu/source_code/cis_eqtl_pipeline/selective-inference/selection/bayesian/cisEQTLS/tests/sim_generate_data.py
DIR=/scratch/PI/sabatti/controlled_access_data/cisEQTLS_sim_exp1

python $PROG generateX -o $DIR -k 16
