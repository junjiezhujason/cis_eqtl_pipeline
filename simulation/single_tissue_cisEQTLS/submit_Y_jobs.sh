#!/bin/bash

DIR=/scratch/PI/sabatti/controlled_access_data/cisEQTLS_sim_exp2
for i in {1..10}
do
    echo
    sbatch sim_Y_data.sbatch $i $DIR
    # bash sim_Y_data.sbatch $i $DIR
done