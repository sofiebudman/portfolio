library(ggplot2)
library(cowplot)
library(randomForest)
#from the statquest tutorial
url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data"

data <- read.csv(url, header=FALSE)

colnames(data) <- c("age","sex","cp", "trestbps", "chol", "fbs", "restecg", "thalach", "exang","oldpeak", "slope","ca", "thal", "hd" )
#clean data
data[data == "?"] <- NA
data[data$sex == 0,]$sex <- "F"
data[data$sex == 1,]$sex <- "M"

data$sex <- as.factor(data$sex)
data$cp <- as.factor(data$cp)
data$fbs <- as.factor(data$fbs)
data$restecg <- as.factor(data$restecg)
data$exang <- as.factor(data$exang)
data$slope <- as.factor(data$slope)

data$ca <- as.integer(data$ca)
data$ca <- as.factor(data$ca)

data$thal <- as.integer(data$thal)
data$thal <- as.factor(data$thal)

data$hd <- ifelse(test = data$hd ==0, yes = "Healthy", no = "Unhealthy")
data$hd <- as.factor(data$hd)

str(data)
set.seed(42) #reproducabililty
data.imputed <- rfImpute(hd ~ ., data = data, iter=6)

model <- randomForest(hd ~ ., data = data.imputed, proximity = TRUE)

model 

oob.error.data <- data.frame(
  Trees=rep(1:nrow(model$err.rate), times=3),
  Type=rep(c("OOB", "Healthy", "Unhealthy"), each=nrow(model$err.rate)),
  Error=c(model$err.rate[,"OOB"], 
          model$err.rate[,"Healthy"], 
          model$err.rate[,"Unhealthy"]))

ggplot(data=oob.error.data, aes(x=Trees, y=Error)) +
  geom_line(aes(color=Type))+
  labs(
    title = "Random Forest Accuracy as Number of Decision Trees Increases"
  )
ggsave("Machine_Learning_Algorithms/random_forest_accuracy.png")

model1 <- randomForest(hd ~ ., data = data.imputed, ntree = 1000, proximity = TRUE)
