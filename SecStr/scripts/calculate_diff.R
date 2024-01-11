data <- read.delim("data/features.tsv")

long_diff <- outer(data$LongHelix_Length, data$LongHelix_Length,
                   function(x, y) abs(x - y))
rownames(long_diff) <- data$Species
colnames(long_diff) <- data$Species

short_diff <- outer(data$ShortHelix_Length, data$ShortHelix_Length,
                    function(x, y) abs(x - y))
rownames(short_diff) <- data$Species
colnames(short_diff) <- data$Species

linker_diff <- outer(data$Linker_Length, data$Linker_Length,
                     function(x, y) abs(x - y))
rownames(linker_diff) <- data$Species
colnames(linker_diff) <- data$Species

write.table(colnames(long_diff), "data/names.txt", row.names = FALSE,
            col.names = FALSE, quote = FALSE)

write.table(long_diff, "data/long_diff.tsv",
            quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)
write.table(short_diff, "data/short_diff.tsv",
            quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)
write.table(linker_diff, "data/linker_diff.tsv",
            quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)
