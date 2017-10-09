#!/bin/bash

DIR=/scratch/PI/sabatti/controlled_access_data/cisEQTLS_sim_exp2
SEED=1
MODE=double
SDIR=$DIR/trial_${SEED}/tmp

source /home/jjzhu/source_code/cis_eqtl_pipeline/.env/bin/activate 

# for GENE in {0..500}
# for GENE in {3001..3500}
# for GENE in {0..5}


# START=0
# END=10
# CMD="python sim_hier_high_dim.py evaluate -d $DIR -s $SEED -b $START -e $END -t $MODE" 
# echo $CMD
# $CMD

NGENES=5000

for GENE in {0..10}
do
    # check if the particular eGene was selected or not
    sel=`cut -f1 ${SDIR}/s_${GENE}.txt`
    if [ "$sel" != 1 ]; then 
        echo "Family $GENE was NOT selected by simes"
    else
        echo "Family $GENE was selected by simes"
        # CMD="python sim_hier_high_dim.py inference -d $DIR -s $SEED -i $GENE -t $MODE -g 5000" 
        CMD="python sim_hier_high_dim.py inference -g $NGENES -d $DIR -s $SEED -i $GENE -t $MODE -j" 
        echo $CMD
        $CMD
    fi
done
