# **Gradient Boosting**

### Overview

-   Gradient boosting is an ensemble technique that combines weak learners to create a strong predictive model

-   Gradient boosting is a type of boosting model in which each model is trained on the residuals of the previous, thus increasing accuracy

-   Gradient boosting is typically performed using an R package such as XGBoost, but to further my understanding of the process, I decided to make it more manually

-   I also implemented a learning rate to ensure that the model is not overfit

### Packages/Requirements

Install required packages

```{r}
install.packages("tree")
install.packages("caret")
install.packages("ggplot2")
install.packages("randomForest")
```

Load required packages

```{r}
library(tree)
library(caret)
library(ggplot2)
library(randomForest)
```
