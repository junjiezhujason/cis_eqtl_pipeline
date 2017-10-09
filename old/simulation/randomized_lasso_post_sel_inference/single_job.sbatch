#!/bin/bash 

#################
#SBATCH -p normal
#SBATCH --time=18:00:00
#SBATCH --nodes=1
#SBATCH --mem=4000

#################
#all commands that start with SBATCH contain commands that are just used by SLURM for scheduling
#SBATCH --job-name=sim_job
#SBATCH --output=sim_job.%j.out
#SBATCH --error=sim_job.%j.err

SEED=$1
TSIG=$2
OUT=$3/${SEED}.txt
echo $OUT
echo "Number of true signals: ${TSIG}"
# source environment
source /home/jjzhu/source_code/cis_eqtl_pipeline/.env/bin/activate
PYSCRIPT=/home/jjzhu/source_code/cis_eqtl_pipeline/selective-inference/selection/bayesian/cisEQTLS/tests/sim_high_dim_test.py
python ${PYSCRIPT} -o ${OUT} -s ${SEED} -m ${TSIG}
