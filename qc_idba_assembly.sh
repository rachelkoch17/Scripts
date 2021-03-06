#!/bin/bash
fullname=$(basename $1)
filename1=${fullname%_R*.fastq}
filename=${fullname%%_*}
echo ${fullname}
echo ${filename1}
echo ${filename}

bbduk.sh in1=${filename1}_R1.fastq in2=${filename1}_R2.fastq out1=${filename1}_um_R1.fq out2=${filename1}_um_R2.fq outm1=${filename1}_m_R1.fq outm2=${filename1}_m_R2.fq ref=/util/opt/anaconda/deployed-conda-envs/packages/bbmap/envs/bbmap-38.06/opt/bbmap-38.06/resources/sequencing_artifacts.fa.gz stats=${filename1}_stats.txt

bbduk.sh in1=${filename1}_um_R1.fq in2=${filename1}_um_R2.fq out1=${filename1}_R1_um_clean.fq out2=${filename1}_R2_um_clean.fq outs=${filename1}_um_clean_singles.fq ktrim=r k=31 hdist=1 tpe tbo mink=11 ref=/util/opt/anaconda/deployed-conda-envs/packages/bbmap/envs/bbmap-38.06/opt/bbmap-38.06/resources/adapters.fa

fq2fa --merge --filter ${filename1}_R1_um_clean.fq ${filename1}_R2_um_clean.fq ${filename1}_idba_merge.fas

idba -l ${filename1}_idba_merge.fas --mink 31 --maxk 121 --step 20 --num_threads 72 -o ${filename1}_Idba_assembly/
