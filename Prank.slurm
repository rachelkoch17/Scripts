#!/bin/bash
#SBATCH -J prank14
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 6-12:00
#SBATCH --mem 600
#SBATCH -o prank14.out
#SBATCH -e prank14.err

cd /to/working/directory

module load prank/170427

for line in $(cat HOG14X.txt) ; do prank -d=$line -o=$line.fasta -f=fasta -codon; done
