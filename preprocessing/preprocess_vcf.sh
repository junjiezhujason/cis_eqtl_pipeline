# Pipeline for preprocessing vcf data 
# Original Author: Joe Davis
# Modified by: Jason Zhu

# bash preprocess_vcf.sh ${ODIR} ${AllChr} ${ChrX}

# load software modules (sherlock.stanford.edu)
ml samtool/1.3.1
ml vcftools  
ml bcftools/1.3.1 
export PERL5LIB=$PERL5LIB:/share/sw/free/vcftools/share/perl5/

# Define file paths and file names from input arguments to the bash script
OutDir=$1
AllChr=$2
ChrX=$3

# define temporary files and output vcf files
ChrXTemp=gtex.v6.chrX.commentremoved.vcf.gz
ConcatTemp=gtex.v6.allchr.impute.info04.maf01.hwep1e6.constrvarids.rawheader.vcf.gz
SampleID=gtex.v6.OMNI_2.5M_5M_450Indiv_allchr_genot_imput_info04_maf01_HWEp1E6_ConstrVarIDs.new.header.txt 
OutVCF=gtex.v6.allchr.impute.info04.maf01.hwep1e6.constrvarids.vcf.gz

echo "Input files:"
echo ${AllChr}
echo ${ChrX}
echo "Output directory:"
echo ${OutDir}

echo "Fetching header and formating individual ids..."
zcat ${AllChr} | head -18 | tail -1 | sed 's/\t/\n/g' | cut -d'-' -f1,2 | grep GTEX > ${OutDir}/${SampleID}

echo "Removing comment from chrX vcf file..."
zcat ${ChrX} | grep -v NOTE | bgzip > ${OutDir}/${ChrXTemp}

echo "Combining Autosome and X chromosomes (with raw header)..."
vcf-concat ${AllChr} ${OutDir}/${ChrXTemp} | bgzip > ${OutDir}/${ConcatTemp}

echo "Rewriting sample header (the individual ids) in vcf..."
bcftools reheader --samples ${OutDir}/${SampleID} --output ${OutDir}/${OutVCF} ${OutDir}/${ConcatTemp}

echo "Indexing vcf file..."
tabix -p vcf ${OutDir}/${OutVCF}

echo "Cleaning up..."
# rm ${OutDir}/${ConcatTemp}
# rm ${OutDir}/${ChrXTemp}

echo "VCF processing complete, and final vcf file saved at:"
echo "${OutDir}/${OutVCF}"
