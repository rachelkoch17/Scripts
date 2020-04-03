#!/bin/bash
#SBATCH -J Raxml_OMA
#SBATCH -t 168:00:00
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 2gb
#SBATCH -o Raxml_OMA.out
#SBATCH -e Raxml_OMA.err

cd /work/herrlab/rkochbach2/OMA2.0/OMA.2.4.1/MushroomCDS/Output/Prank/Prank_to_Gblock/Upload_to_crane/Rxml
module load raxml/8.2

for file in *.phylip; do; echo $file ${file}.partition; raxmlHPC -T 3 -f a -m GTRGAMMA -p 12345 -q ${file}.partition -s $file -x 12345 -n ${file} -N 200; done
