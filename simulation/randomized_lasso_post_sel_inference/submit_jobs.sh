#!/bin/bash

TRUESIG=5
DIR=/scratch/PI/sabatti/controlled_access_data/high_dim_sim_exp/high_dim_test_${TRUESIG}

mkdir -p ${DIR}

for i in {1..100}
do
    echo
    echo $i
    sbatch single_job.sbatch $i ${TRUESIG} ${DIR}
done
