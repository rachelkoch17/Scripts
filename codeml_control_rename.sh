#!/bin/bash

control_file=$1
for x in $(cat hogs_dogs.txt); do
cat $1 | sed "s/seqfile =/seqfile = $x.phy/"  | \
sed "s/treefile =/treefile = $x.tree/"  | \
sed "s/outfile =/outfile = $x.out/" > $x.good.ctl;
done;
