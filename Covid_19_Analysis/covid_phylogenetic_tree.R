install.packages("ape")
library(ape)
library(ggplot2)
#ape package for phylogenic tree
sequences <- read.dna("Covid_19_Analysis/data/finalCovid.fasta", format = "fasta")

dist_matrix <- dist.dna(sequences) #quantifies distance between sequences
phylo_tree <- nj(dist_matrix) #creates a neighbor joining tree

plot(phylo_tree) #plots the tree

