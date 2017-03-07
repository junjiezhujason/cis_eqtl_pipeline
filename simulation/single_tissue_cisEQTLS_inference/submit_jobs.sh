#!/bin/bash

DIR=/scratch/PI/sabatti/controlled_access_data/cisEQTLS_sim_exp2
SEED=1

# for i in {1..200}
# for i in {4001..4500}

#for i in {4001..4500}
#do
#    echo 
#    echo "GENE: $i"
#    sbatch hi_hi_dim.sbatch $SEED $i $DIR single
#    sbatch hi_hi_dim.sbatch $SEED $i $DIR double
#    # bash hi_hi_dim.sbatch $SEED $i $DIR single
#    # bash hi_hi_dim.sbatch $SEED $i $DIR double
#done

#for i in {3001..3500}
for i in {2001..2500}
do
    echo
    echo "GENE: $i"
    sbatch hi_hi_dim.sbatch $SEED $i $DIR single
    sbatch hi_hi_dim.sbatch $SEED $i $DIR double
    # bash hi_hi_dim.sbatch $SEED $i $DIR single
    # bash hi_hi_dim.sbatch $SEED $i $DIR double
done
