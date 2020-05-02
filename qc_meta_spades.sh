#!/bin/bash
fullname=$(basename $1)
filename1=${fullname%_*.fq}
filename=${fullname%%_*}
echo ${fullname}
echo ${filename1}
echo ${filename}

bbduk.sh in1=${filename1}_1.fq in2=${filename1}_2.fq out1=${filename1}_um_R1.fq out2=${filename1}_um_R2.fq outm1=${filename1}_m_R1.fq outm2=${filename1}_m_R2.fq ref=/util/opt/anaconda/deployed-conda-envs/packages/bbmap/envs/bbmap-38.06/opt/bbmap-38.06/resources/sequencing_artifacts.fa.gz stats=${filename1}_stats.txt

bbduk.sh in1=${filename1}_um_R1.fq in2=${filename1}_um_R2.fq out1=${filename1}_R1_um_clean.fq out2=${filename1}_R2_um_clean.fq outs=${filename1}_um_clean_singles.fq ktrim=r k=31 hdist=1 tpe tbo mink=11 ref=/util/opt/anaconda/deployed-conda-envs/packages/bbmap/envs/bbmap-38.06/opt/bbmap-38.06/resources/adapters.fa

spades.py --meta \
--pe1-1 ${filename1}_R1_um_clean.fq \
--pe1-2 ${filename1}_R2_um_clean.fq \
--pe1-s ${filename1}_um_clean_singles.fq \
-m 62 \
-t 72 \
-k 31,41,51,61,71,81,91,101,111,121 \
-o ${filename1}_meta_spades_assembly
