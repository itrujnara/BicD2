library(ggplot2)
library(ggmsa)
library(ggtree)

options(ignore.negative.edge=TRUE)

tree <- read.tree("../seqs_250.dnd")

ggtree(tree, open = 0.5) + 
  geom_tiplab(size = 1.5)

ggsave("ggplot.png")
