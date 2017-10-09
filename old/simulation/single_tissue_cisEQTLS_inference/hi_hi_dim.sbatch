#!/bin/bash 

#################
#SBATCH -p hns,normal
#SBATCH -N 1
#SBATCH -n 1 
#SBATCH -c 1 
#SBATCH --time=16:00:00

#################
#all commands that start with SBATCH contain commands that are just used by SLURM for scheduling
#SBATCH --job-name=sim_job
#SBATCH --output=sim_job.%j.out
#SBATCH --error=sim_job.%j.err

SEED=$1
GENE=$2
DIR=$3
MODE=$4

source /home/jjzhu/source_code/cis_eqtl_pipeline/.env/bin/activate

PROG=/home/jjzhu/source_code/cis_eqtl_pipeline/selective-inference/selection/bayesian/cisEQTLS/tests
cd $PROG

# python sim_ciseqtl.py generateY -o $DIR -k 16 -s $SEED
# python $PROG runSimes -o $DIR -k 16 -s $SEED


CMD="python sim_sel_inf_pipeline.py -d $DIR -s $SEED -i $GENE -g 5000 -t $MODE"
echo $CMD
$CMD
