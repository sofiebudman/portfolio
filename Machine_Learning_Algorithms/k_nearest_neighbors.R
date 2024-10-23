library(caret)
library(class) 
library(tidyverse)

set.seed(123)
model_knn <- knn(knnTrain, knnTest,cl = knnTrain$SMAR, k = KNEIGHBORS)
cf<- table(knnTest$SMAR, model_knn)
accuracy_knn <- sum(diag(cf))/nrow(knnTest)
print(accuracy_knn)