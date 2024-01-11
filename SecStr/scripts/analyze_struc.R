library(tidyverse)

features <- read.delim("data/all_filtered.tsv") %>%
  filter(!(Start == 1 & Type == "COIL")) %>% # trim initial coil
  filter(Length > 5) # remove spurious/tiny coils

linkers <- features %>%
  filter(Type == "COIL" & Length >= 40 & Length <= 80) %>%
  group_by(Species) %>%
  summarize(Linker_Length = first(Length), Linker_Start = first(Start),
            Linker_End = first(End))

longs <- features %>%
  group_by(Species) %>%
  summarize(LongHelix_Start = min(Start))

shorts <- features %>%
  left_join(linkers, by = "Species") %>%
  filter(Start == Linker_End + 1) %>%
  select(Species, Length) %>%
  rename(ShortHelix_Length = Length)

feature_lengths <- longs %>%
  left_join(linkers, by = "Species") %>%
  left_join(shorts, by = "Species") %>%
  mutate(LongHelix_Length = Linker_Start - LongHelix_Start) %>%
  select(Species, LongHelix_Length, Linker_Length, ShortHelix_Length) %>%
  drop_na()

write.table(feature_lengths, file = "data/features.tsv", sep = "\t",
            row.names = FALSE)
