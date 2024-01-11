from copy import copy
from Bio import Phylo
from Bio.Phylo.TreeConstruction import DistanceMatrix, DistanceTreeConstructor
import csv

names = []
with open("data/names.txt") as f:
    names = [line.strip() for line in f]

mx_long = []
with open("data/long_diff.tsv") as f:
    mx_long = [[int(i) for i in line.strip().split('\t')] for line in f]
mx_long = [row[:(i+1)] for i, row in enumerate(mx_long)]

dm_long = DistanceMatrix(names, mx_long)

constructor = DistanceTreeConstructor()

tree_long = constructor.nj(dm_long)

Phylo.write(tree_long, "trees/tree_long.nwk", "newick")

mx_short = []
with open("data/short_diff.tsv") as f:
    mx_short = [[int(i) for i in line.strip().split('\t')] for line in f]
mx_short = [row[:(i+1)] for i, row in enumerate(mx_short)]

dm_short = DistanceMatrix(names, mx_short)

constructor = DistanceTreeConstructor()

tree_short = constructor.nj(dm_short)

Phylo.write(tree_short, "trees/tree_short.nwk", "newick")

mx_linker = []
with open("data/linker_diff.tsv") as f:
    mx_linker = [[int(i) for i in line.strip().split('\t')] for line in f]
mx_linker = [row[:(i+1)] for i, row in enumerate(mx_linker)]

dm_linker = DistanceMatrix(names, mx_linker)

constructor = DistanceTreeConstructor()

tree_linker = constructor.nj(dm_linker)

Phylo.write(tree_linker, "trees/tree_linker.nwk", "newick")
