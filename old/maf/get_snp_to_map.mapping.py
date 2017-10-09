import os
import numpy as np
import pandas as pd

pfx = "Liver_97"
rdir = "/scratch/PI/sabatti/controlled_access_data/fastqtl_tmp/Liver"
gdir = "/scratch/users/snigdha/Liver_snig_new/Liver_snig/sel_SNPs"
sdir = "/scratch/users/snigdha/Liver_snig_new/Liver_snig/randomized_egene_names"
# output directory
odir = os.path.join(rdir, "sel_SNPs_with_MAFs") 


# iterate through each chunk
for i in xrange(1,101):
    mtx_dir = os.path.join(rdir, pfx+"_chunk{:03d}_mtx".format(i))
    print(mtx_dir)
    assert os.path.exists(mtx_dir), "Path does: {} not exist".format(mtx_dir)
    # load maf dictionary
    maf_dict = {}
    with open(os.path.join(mtx_dir, "MAFs.txt")) as f:
        for line in f:
            (key, val) = line.strip().split()
            maf_dict[key] = val
    print("Loaded dictionary")
    # read eGenes
    eGenes = []
    with open(os.path.join(sdir, "egenes_{:03d}.txt".format(i))) as f:
        for line in f:
            eGenes.append(line.strip())
    # get the indices
    for gene in eGenes:
        # read the incides from the files in sel_SNPs
        idx = []
        g_fname = os.path.join(gdir, "sel_SNPs_{}.txt".format(gene))
        o_fname = os.path.join(odir, "sel_SNPs_MAFs_{}.txt".format(gene))
        print(o_fname)
        if not os.path.exists(g_fname):
            print("{} does not exist, creating empty file!".format(g_fname))
            os.mknod(o_fname)
        else:
            sel_idx = np.loadtxt(g_fname, ndmin=1).astype(int)
            # read the VAF file
            v_fname = os.path.join(rdir, mtx_dir, "Vars_{}.txt".format(gene))
            all_vars = pd.read_table(v_fname, header=None)
            sel_vars = all_vars.loc[sel_idx] 
            sel_vars['maf'] = sel_vars[0].map(maf_dict)
            # save the maf to files
            sel_vars.to_csv(o_fname, header=False, sep="\t")
