library(caret)
library(class) 
library(tidyverse)

data <- iris
iris$Species <- as.numeric(factor(iris$Species)) - 1
set.seed(123)
hKNEIGHBORS <- 5

# Shuffle the dataset and create an index for splitting
shuffled_indices <- sample(1:nrow(data), nrow(data))
train_indices <- shuffled_indices[1:round(train_ratio * nrow(data))]
test_indices <- shuffled_indices[(round(train_ratio * nrow(data)) + 1):nrow(data)]

# Split the data
train <- data[train_indices, ]
test <- data[test_indices, ]

model_knn <- knn(train, test,cl = train$Species, k = KNEIGHBORS)
cf<- table(knnTest$SMAR, model_knn)
accuracy_knn <- sum(diag(cf))/nrow(knnTest)
print(accuracy_knn)