install.packages("tree")
library(tree) 
library(caret)
library(ggplot2)
library(randomForest)

LR <- 0.15
nrounds <- 30

df <- mtcars
x_vars <- names(df[2:ncol(df)])
x_vars <- paste(x_vars, collapse = "+")
prediction <- NaN 
df <- cbind(df[1], prediction, df[2:ncol(df)])


df$pred_1 <- mean(df$mpg) 
df$prediction  <-  df$pred_1

df$resd_1 <- (df$mpg - df$prediction) 

rmse = RMSE(df$mpg, df$prediction)
results <- data.frame("Round" = c(1), "RMSE" = c(rmse))


for (i in (2:nrounds)){
  mdl <- eval(parse(text = paste0("tree(resd_", i -1, "~",  x_vars, ",data = df)")))
  df[[paste0("pred_", i)]] <- predict(mdl, df)
  df$prediction  <- df$prediction + (LR * df[[paste0("pred_", i)]])
  df[[paste0("resd_", i)]] <-(df$mpg - df$prediction)
  
  rmse = RMSE(df$mpg, df$prediction)
  results <- rbind(results, list("Round" = i, "RMSE" = rmse))
  
}


tree_mdl <- eval(parse(text = paste0("tree(mpg~", x_vars, ",data=df)")))
prediction <- predict(tree_mdl, df)
tree_rmse <- RMSE(df$mpg, prediction)


rf_mdl <- eval(parse(text = paste0("randomForest(mpg~", x_vars, ",data=df)")))
prediction <- predict(rf_mdl, df)
rf_rmse <- RMSE(df$mpg, prediction)

ggplot() +
  geom_line(data = results, aes(x = Round, y = RMSE))+
  geom_hline(yintercept = tree_rmse, color = "red", linetype = "dashed")+
  geom_hline(yintercept = rf_rmse, color = "blue", linetype = "dashed")

ggsave("Gradient_boosting/gradient_boosting_accuracy_comparison.png")
