# **COVID 19 Analysis**

### Overview

-   I utilized a phylogenetic tree to trace the evolution of various COVID-19 strains from their origins in Wuhan, China

-   To create the phylogenetic tree I used the ape package: I used distance alignment and the neighbor joining method to create a tree that correlates different strain of COVID-19

-   This phylogenetic analysis is important because it is crucial for understanding the virus’s evolution and formation of variants, which can inform public health responses and vaccine development strategies

-   The phylogenetic tree is fairly small right now and it would be interesting to create one on more data in the future

-   I also practice ggplot graph creation to show the rise of Covid-19 cases starting in January 2020 along with key worldwide events

### Data

-   Data is from NCBI Virus Blast

-   I used Galaxy Clustal for sequence alignment

### Packages/Requirements

Install the required packages

```{r}
install.packages("ape")
install.packages("readr")
install.packages("ggplot2")
install.packages("dplyr")
```

Load required packages

```{r}
library(readr)
library(ggplot2)
library(dplyr)
library(ape)
```
