#!/usr/bin/bash

eval "$(conda shell.bash hook)"
conda activate tcoffee
t_coffee seqs_1000.fa
conda deactivate
