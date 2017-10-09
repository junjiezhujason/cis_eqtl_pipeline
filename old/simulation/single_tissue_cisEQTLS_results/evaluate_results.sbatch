#!/bin/bash

#################
#SBATCH --partition=hns,normal
#SBATCH --ntasks=1  
#SBATCH --cpus-per-task=1
#SBATCH --time=01:00:00
#SBATCH --mem=4000

#################
#all commands that start with SBATCH contain commands that are just used by SLURM for scheduling
#SBATCH --job-name=job
#SBATCH --output=job.%j.out
#SBATCH --error=job.%j.err

DIR=/scratch/PI/sabatti/controlled_access_data/cisEQTLS_sim_exp2
SEED=1

START=$1
END=$2
MODE=$3

source /home/jjzhu/source_code/cis_eqtl_pipeline/.env/bin/activate 

cd /home/jjzhu/source_code/cis_eqtl_pipeline/selective-inference/selection/bayesian/cisEQTLS/tests
CMD="python sim_hier_high_dim.py evaluate -d $DIR -s $SEED -b $START -e $END -t $MODE" 
echo $CMD

OUT=preliminary_results/${START}-${END}-${MODE}.out
ERR=preliminary_results/${START}-${END}-${MODE}.err

$CMD > $OUT 2> $ERR

