#!/bin/bash

# sbatch evaluate_results.sbatch 0 500 single
# sbatch evaluate_results.sbatch 0 500 double
# 
# sbatch evaluate_results.sbatch 2000 2500 single
# sbatch evaluate_results.sbatch 2000 2500 double
# 
# sbatch evaluate_results.sbatch 3000 3500 single
# sbatch evaluate_results.sbatch 3000 3500 double
# 
# sbatch evaluate_results.sbatch 4000 4500 single
# sbatch evaluate_results.sbatch 4000 4500 double

sbatch evaluate_results.sbatch 4000 5000 single
sbatch evaluate_results.sbatch 4000 5000 double
sbatch evaluate_results.sbatch 0 500 single
sbatch evaluate_results.sbatch 0 500 double
sbatch evaluate_results.sbatch 2000 2500 single
sbatch evaluate_results.sbatch 2000 2500 double
sbatch evaluate_results.sbatch 3000 3500 single
sbatch evaluate_results.sbatch 3000 3500 double

