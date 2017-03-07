#!/bin/bash 

#################
#SBATCH -p normal
#SBATCH -N 1
#SBATCH -n 1 
#SBATCH -c 1 
#SBATCH --time=16:00:00

#################
#all commands that start with SBATCH contain commands that are just used by SLURM for scheduling
#SBATCH --job-name=sim_job
#SBATCH --output=sim_job/%j.out
#SBATCH --error=sim_job/%j.err

SEED=$1
GENE=$2
DIR=$3
MODE=$4
NGENES=5000

source /home/jjzhu/source_code/cis_eqtl_pipeline/.env/bin/activate

PROG=/home/jjzhu/source_code/cis_eqtl_pipeline/selective-inference/selection/bayesian/cisEQTLS/tests
cd $PROG

CMD="python sim_hier_high_dim.py inference -g $NGENES -d $DIR -s $SEED -i $GENE -t $MODE" 
echo $CMD
$CMD
