#!/bin/bash
#SBATCH -J Meta_spades
#SBATCH -t 168:00:00
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 62gb
#SBATCH -o Meta_spades.out
#SBATCH -e Meta_spades.err
#SBATCH --array=1-90

cd /work/herrlab/rkochbach2/ncbi/public/sra/sra/finished2/allfinished

module load bbmap/38.06
module load spades/3.14

file=$(sed -n "$SLURM_ARRAY_TASK_ID"p sra_good.txt)

./meta_spades.sh $file
