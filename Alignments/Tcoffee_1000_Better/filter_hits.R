library(dplyr)

hits <- read.delim("hits_1000.tsv")

hits_filtered <- hits %>%
  group_by(Organism) %>%
  arrange(desc(Score.Bits.)) %>%
  filter(row_number() == 1) %>%
  ungroup()

meta <- hits %>% select(Accession, Description, Organism, Length)

acc <- hits_filtered$Accession

write.table(hits_filtered, "hits_filtered.tsv", sep="\t", row.names = FALSE, quote = FALSE)
write.table(meta, "meta.tsv", sep="\t", row.names = FALSE, quote = FALSE)
write.table(acc, "accessions_1000.txt", row.names = FALSE, col.names = FALSE, quote = FALSE)
