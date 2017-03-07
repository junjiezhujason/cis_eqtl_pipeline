#!/bin/bash

DIR=/scratch/PI/sabatti/controlled_access_data/cisEQTLS_sim_exp2
SEED=1
SDIR=$DIR/trial_${SEED}/tmp

# for i in {1..200}
# for i in {4001..4500}
# for i in {3001..3500}
# for i in {2001..2500}

counter=0
# for GENE in {0..500}
# for GENE in {2000..2500}
for GENE in {3750..4999}
do
    echo 
    # check if the particular eGene was selected or not
    sel=`cut -f1 ${SDIR}/s_${GENE}.txt`
    if [ "$sel" != 1 ]; then 
        echo "Family $GENE was NOT selected by simes"
    else
        for MODE in single double   
        do
            # check if the output file is already ecreated
            FILE=${DIR}/trial_${SEED}/infs_${MODE}/sel_out_${GENE}.txt
            if [ -f $FILE ]; then
                echo "Family $GENE was selected by simes, but $FILE exists, not running hierarchical high dimensional inference"
            else
                # CMD="python sim_hier_high_dim.py inference -g $NGENES -d $DIR -s $SEED -i $GENE -t $MODE -j" 
                CMD="sbatch hi_hi_dim.sbatch $SEED $GENE $DIR $MODE"
                echo $CMD
                $CMD
                counter=$((counter+1))
            fi
        done
    fi
done

echo "$counter jobs submitted"
