#!/bin/bash

#usage: ./codeml_control_rename.sh codeml_control_file.ctl list_of_hogs.txt

control_file=$1
hogs_list=$2
for x in $(cat $2); do
cat $1 | sed "s/seqfile =/seqfile = $x.phy/"  | \
sed "s/treefile =/treefile = $x.tree/"  | \
sed "s/outfile =/outfile = $x.out/" > $x.ctl;
done;
