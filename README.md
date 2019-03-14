# Data Preprocessing Pipeline for GTEx cis-eQTL Analysis 

The genotype data is available only via dbGAP proper download. 
We cannot share the data due to access restriction.
However, we have included all pre-processing scripts that allows one to 
generate the real data input for the analysis in our manuscript. 

The scripts in `preprocessing` here use `samtools` and `bcftools` to properly reformat the genotype and phenotype data tissue by tissue. 

The scripts in fastqtl_processing simply launches the appropriate python script in the `fastqtl` module, whose path is required as an input.

# Overview of order of operation

- `preprocessing/preprocess_vcf.sh`
- `preprocessing/preprocess_bed.sh`
- `preprocessing/preprocess_sample_list.sh`
- `fastqtl_processing/single_tissue_generation.sh`


# Note for internal users

The local data and slurm job scripts are stored in `/share/PI/sabatti/snigdha_paper/controlled_access_gtex_data`.


# Acknowledgements

The preprocessing scripts were largely supported by Joe Davis from the initial 
analysis on the pilot study. We made very minimal modifications.

The fastqtl submodule  was forked from the fork by François Aguet. We modified
the code such that it could output intermediate matrices for our computation.



