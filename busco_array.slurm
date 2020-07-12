#!/bin/bash
#SBATCH -J busco
#SBATCH -t 168:00:00
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 1gb
#SBATCH -o busco.out
#SBATCH -e busco.err
#SBATCH --array=1-55

cd $SLURM_SUBMIT_DIR
module load busco/py36/3.0
file=$(sed -n "$SLURM_ARRAY_TASK_ID"p buscos_rd.txt)
run_busco -i $file -o $file -l /work/HCC/BCRF/app_specific/busco/orthodb/v9/basidiomycota_odb9/ -m proteins
