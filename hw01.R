# HW01 - reading plink files

# clean shit
rm(list = ls())

# install plink package from library
install.packages("plink", repos = "http://www2.uaem.mx/r-mirror")
library(plink)
install.packages("tidyverse")
library(tidyverse)

# set workspace
setwd("~/Desktop/Fall 2017/Stat Gen/r things")

### ------------------------------ load data ------------------------------------ ###
df.imiss <- read.table("~/Desktop/Fall 2017/Stat Gen/r things/miss_stat.imiss.csv", sep = "" , header = T , nrows = 100,
                   na.strings = "", stringsAsFactors = F)
df.lmiss <- read.table("~/Desktop/Fall 2017/Stat Gen/r things/miss_stat.lmiss.csv", sep = "" , header = T , nrows = 100,
                      na.strings = "", stringsAsFactors = F)
nrow(df.imiss); ncol(df.imiss)
nrow(df.lmiss); ncol(df.lmiss)


### ------------------------------- clean data ---------------------------------- ###
df.indv <- select(df.imiss, FID, N_MISS, F_MISS) %>%
  mutate(N_MISS = as.numeric(N_MISS), F_MISS = as.numeric(F_MISS))
df.loci <- select(df.lmiss, SNP, N_MISS, F_MISS) %>%
  mutate(N_MISS = as.numeric(N_MISS), F_MISS = as.numeric(F_MISS))

summary(df.indv)
summary(df.loci)

# about the variables:
# for each SNP, we see the number of missing individuals (N_MISS) and the proportion of 
# individuals missing (F_MISS)
# The final column is the actual genotyping rate for that individual -- we see the genotyping 
# rate is very high here. (??)


# explore data set of missing individuals
ggplot(data = df.indv) + geom_point(aes(x = N_MISS, y = F_MISS)) + scale_color_manual(values = orchid2)
ggplot(data = df.indv) + geom_point(aes(x = FID, y = F_MISS)) + scale_color_manual(values = orchid2)
ggplot(data = df.indv) + geom_point(aes(x = FID, y = N_MISS)) + scale_color_manual(values = orchid2)
ggplot(data = df.indv, aes(N_MISS)) + geom_histogram(binwidth = 1)
ggplot(df.indv, aes(x = FID, y = N_MISS)) + geom_boxplot()

# can we try to remove the number of individuals who are not missing this SNP?


# explore data set of missing locus
ggplot(data = df.loci) + geom_point(aes(x = N_MISS, y = F_MISS)) + scale_color_manual(values = orchid2)
ggplot(data = df.loci) + geom_point(aes(x = SNP, y = F_MISS)) + scale_color_manual(values = orchid2)
ggplot(data = df.loci) + geom_point(aes(x = SNP, y = N_MISS)) + scale_color_manual(values = orchid2)



summary(df.indv); summary(df.loci)
line(df.indv$N_MISS); line(df.loci$N_MISS)



