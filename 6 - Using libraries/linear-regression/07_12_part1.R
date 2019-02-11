#----------Valutazione di un modello di regressione----------#
rm(list=ls())

# import data
data <- read.csv("wine.csv", header=F)
colnames(data) <- c("fixed_acidity", "volatile_acidity", "citric_acid", "residual_sugar", "chlorides", 
                    "free_sulfur_dioxide", "total_sulfur_dioxide", "density", "pH", "sulphates", "alcohol", "quality")

# min-max normalization
min <- apply(data[-12], 2, min)
max <- apply(data[-12], 2, max)
diff <- max - min
data_mm <- data #nor.min.max(x)
#data_mm[1:11] <- lapply( data[-12], function(x) round((x-min(x))/(max(x)-min(x)), 1))
data_mm[1:11] <- sweep( sweep(data[-12], 2L, min), 2, diff, "/")

# z-score normalization
mu <- apply(data[-12], 2, mean)
std <- apply(data[-12], 2, sd)
data_zs <- data
# data_zs[1:11] <- lapply( data[-12], function(x) round((x-mean(x))/sd(x), 1))
data_zs[1:11] <- sweep(sweep(data[-12], 2L, mu), 2, std, "/") # come all'esercitazione 

# quartile TODO
# outvals = boxplot(data_mm[1])$out

# split data 80/20
set.seed(123)
ind <- sample(2, nrow(data_zs), replace=TRUE, prob= c(0.8,0.2))
training <- data_zs[ind==1,]
test <- data_zs[ind==2,]

# training model
my_formula <- as.formula(paste(names(training)[12], " ~ ", paste(names(training)[-12], collapse= "+")))
# details in help("lm")
my_model <- lm(formula = my_formula,
               data = training)

# apply model on test set
result_1 <- predict(my_model, test)

# evaluation
error <- result_1 - test$quality
MAE <- mean(error)
MSE <- mean(error)^2
RMSE <- sqrt(mean((error)^2))
R2 <- summary(my_model)$r.squared

# k-fold split
# scrivere una funzione che effettui lo splitting k-folds e restituisca i dati necessari a realizzare gli esperimenti
library(glmnet)
library(caret)

# repeated cross-validation, number = k
custom <- trainControl(method = "repeatedcv",
                       number = 10,
                       repeats = 10)

cv_model <- train(quality ~ .,
                  training,
                  method = "lm",
                  trControl = custom)
cv_model$results

result_test_2 <- predict(cv_model, test)
