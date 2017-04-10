#!/bin/bash

# bash inputs
VCF=$1 # input vcf
BED=$2 # input bed 
PFX=$3 # output prefix
COV=$4 # input covariates
SAMP=$5 # sample list
NCORES=$6 # number of cores
FASTQTLDIR=$7 # path to forked fastqtl directory

# run multi-core python processing code for a single tissue
python3 ${FASTQTLDIR}/python/run_FastQTL_matrixout_threaded.py ${VCF} ${BED} ${PFX} \
        --covariates ${COV} --include_samples ${SAMP} \
        --window 1e6 --ma_sample_threshold 10 --maf_threshold 0.01 --seed 1234 \
        --chunks 100 --threads ${NCORES} 
