# Pipeline for preprocessing vcf data 
# Original Author: Joe Davis
# Modified by: Jason Zhu

# bash preprocess_vcf.sh ${OutDir} ${Path2Exp} ${TissueList} 

# load software modules (sherlock.stanford.edu)
ml samtool/1.3.1
ml bcftools/1.3.1 

# Define file paths and file names from input arguments to the bash script
OutDir=$1 #<define path to hold output data>
Path2Exp=$2 # <define path to the expression bed files>
TissueList=$3 # <define path to file with list of tissues. Same names as used for the expression bed files. One tissue name per line.>

for line in `cat ${TissueList}`; do
    echo "zcat ${Path2Exp}/${line}_Analysis.v6p.FOR_QC_ONLY.normalized.expr.bed | bgzip > ${OutDir}/${line}.normalized.expr.bed.gz"
    zcat ${Path2Exp}/${line}_Analysis.v6p.FOR_QC_ONLY.normalized.expr.bed | bgzip > ${OutDir}/${line}.normalized.expr.bed.gz
    echo "tabix -p bed ${OutDir}/${line}.normalized.expr.bed.gz"
    tabix -p bed ${OutDir}/${line}.normalized.expr.bed.gz
done
