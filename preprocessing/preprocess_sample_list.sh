#!/bin/bash

TLIST=$1 # tissue list 
GDIR=$2 # dir of processed genoytpes
PDIR=$3 # dir of processed phenotypes 
SDIR=$4 # dir of sample lists to be stored

echo "$TLIST"
echo "$GDIR"
echo "$PDIR"
echo "$SDIR"

GFILE=${SDIR}/sample_ids_genotype.txt
cp ${GDIR}/gtex.v6.OMNI_2.5M_5M_450Indiv_allchr_genot_imput_info04_maf01_HWEp1E6_ConstrVarIDs.new.header.txt ${GFILE}
echo "Number of samples with genotypes: `cat ${GFILE} | wc -l`"

echo ""
echo "Extracting phenotype sample IDs"
for line in `cat ${TLIST}`; do
    echo "Tissue: ${line}"
    PFILE=${SDIR}/sample_ids_${line}.txt
    # get the header from the processed bed file and extract the sample ids
    zcat ${PDIR}/${line}.normalized.expr.bed.gz | head -n1 | cut -f5- | tr "\t" "\n" > ${PFILE}
done


echo ""
echo "Intersecting genotypes and phenotypes"
for line in `cat ${TLIST}`; do
    PFILE=${SDIR}/sample_ids_${line}.txt
    PINT=${SDIR}/intersect_ids_${line}.txt
    comm -12 <(cat ${GFILE} | sort) <(cat ${PFILE} | sort) > ${PINT}
    # get the header from the processed bed file and extract the sample ids
    echo -e "Number of samples: `cat ${PINT} | wc -l` \t out of\t `cat ${PFILE} | wc -l` \t ${line}"
done
