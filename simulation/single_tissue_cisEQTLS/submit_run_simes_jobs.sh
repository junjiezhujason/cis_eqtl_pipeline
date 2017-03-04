#!/bin/bash

DIR=/scratch/PI/sabatti/controlled_access_data/cisEQTLS_sim_exp2
for i in {1..10}
do
    echo
    sbatch run_simes.sbatch $i $DIR
    # bash sim_Y_data.sbatch $i $DIR
done
