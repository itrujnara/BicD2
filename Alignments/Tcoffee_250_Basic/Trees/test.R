library(tidyverse)
library(ggmsa)
library(ggtree)

options(ignore.negative.edge=TRUE)

tree <- read.tree("../seqs_250.dnd")
tree$tip.label <- tree$tip.label %>%
  str_split("\\|") %>%
  sapply(function(x) x[3])

msa <- tidy_msa("../seqs_250_aligned.fa", end = 900)
msa$name <- msa$name %>% 
  as.character() %>% 
  str_split("\\|") %>%
  sapply(function(x) x[3]) %>%
  as.factor()

p <- ggtree(tree) +
  geom_tiplab(aes(label = label), size = 1) +
  geom_facet(data = msa, geom = geom_msa, panel = "alignment", show.legend = TRUE,
             font = NULL, color = "Shapely_AA", border = "transparent") +
  theme_tree2() +
  labs(fill = "Amino acids", title = "Phylogeny and multiple sequence alignment
       of human BicD2 homologs") +
  theme(strip.background = element_blank(), strip.text.x = element_blank())

# Print the plot
print(p)

ggsave("ggplot.png", width = 4500, height = 3000, units = "px")
