library(tidyverse)

features <- read.delim("data/features.tsv")

longs <- features$LongHelix_Length

long_mu <- mean(longs)
long_sigma <- sd(longs)
long_rsd <- long_sigma / long_mu * 100

long_plot <- ggplot(features) +
  aes(x = LongHelix_Length) +
  geom_histogram(aes(y = after_stat(density)),
                 fill = "dodgerblue2",
                 binwidth = 1) +
  stat_function(fun = dnorm, args =
                  list(mean = long_mu,
                       sd = long_sigma)) +
  annotate("text", x = 190, y = 0.15, label =
             paste("Mean =", long_mu), size = 8) +
  annotate("text", x = 190, y = 0.14, label =
             paste("SD =", long_sigma), size = 8) +
  annotate("text", x = 190, y = 0.13, label =
             paste("%RSD =", long_rsd), size = 8)

print(long_plot)
ggsave("images/long_vertebrates_dist.png")

linkers <- features$Linker_Length

linker_mu <- mean(linkers)
linker_sigma <- sd(linkers)
linker_rsd <- linker_sigma / linker_mu * 100

linker_plot <- ggplot(features) +
  aes(x = Linker_Length) +
  geom_histogram(aes(y = after_stat(density)),
                 fill = "#F8766D",
                 binwidth = 1) +
  stat_function(fun = dnorm, args =
                  list(mean = linker_mu,
                       sd = linker_sigma)) +
  annotate("text", x = 80, y = 0.15, label =
             paste("Mean =", linker_mu), size = 8) +
  annotate("text", x = 80, y = 0.14, label =
             paste("SD =", linker_sigma), size = 8) +
  annotate("text", x = 80, y = 0.13, label =
             paste("%RSD =", linker_rsd), size = 8)

print(linker_plot)
ggsave("images/linker_vertebrates_dist.png")

shorts <- features$ShortHelix_Length

short_mu <- mean(shorts)
short_sigma <- sd(shorts)
short_rsd <- short_sigma / short_mu * 100

short_plot <- ggplot(features) +
  aes(x = ShortHelix_Length) +
  geom_histogram(aes(y = after_stat(density)),
                 fill = "dodgerblue3",
                 binwidth = 1) +
  stat_function(fun = dnorm, args =
                  list(mean = short_mu,
                       sd = short_sigma)) +
  annotate("text", x = 120, y = 0.30, label =
             paste("Mean =", short_mu), size = 8) +
  annotate("text", x = 120, y = 0.28, label =
             paste("SD =", short_sigma), size = 8) +
  annotate("text", x = 120, y = 0.26, label =
             paste("%RSD =", short_rsd), size = 8)

print(short_plot)
ggsave("images/short_vertebrates_dist.png")
