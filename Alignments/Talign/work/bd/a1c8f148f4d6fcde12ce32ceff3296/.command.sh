#!/bin/bash -ue
for f in $(ls Structures)
do
    ln -s Structures/$f ./$f
done
t_coffee seqs_str.fa -mode TMalign_pair
