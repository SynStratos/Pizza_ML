#----------Stima dei parametri del modello----------#
library(glmnet)
library(caret)
rm(list=ls())

# import data
data <- read.csv("wine.csv", header=F)
colnames(data) <- c("fixed_acidity", "volatile_acidity", "citric_acid", "residual_sugar", "chlorides", 
                    "free_sulfur_dioxide", "total_sulfur_dioxide", "density", "pH", "sulphates", "alcohol", "quality")

# aggiungere quadrati delle feature
squared_features <- lapply( data[-12], function(x) (x^2))
names(squared_features) <-  c("sq_fixed_acidity", "sq_volatile_acidity", "sq_citric_acid", "sq_residual_sugar", "sq_chlorides", 
                                 "sq_free_sulfur_dioxide", "sq_total_sulfur_dioxide", "sq_density", "sq_pH", "sq_sulphates", "sq_alcohol")
data <- cbind(data[1:11], squared_features, data[12])

# REGOLARIZZAZIONE L2 ("RIDGE") -> nella funzione built-in di linear_model non è prevista

# split dataset 70/10/20
ind <- sample(3, nrow(data), replace=TRUE, prob= c(0.7,0.1,0.2))
training <- data[ind==1,]
validation <- data[ind==2,]
test <- data[ind==3,]

# TRAINING DEL MODELLO
# valutare errore sul validation set al variare di lambda
# valuta in modo autonomo il valore ottimale di lambda e utilizza quello
ridge_model <- train(quality ~ .,
                     data = training,
                     method = "glmnet",
                     tuneGrid = expand.grid(alpha = 0, 
                                            # 0.000100 0.250075 0.500050 0.750025 1.000000
                                            lambda = seq(0.0001, 1, length=5)
                                            )
                     )
# mi stampa i valori di alpha e beta scelti per il modello migliore
ridge_model$bestTune

# errori sul training e sul validation set
result_training <- predict(ridge_model, training)
result_validation <- predict(ridge_model, validation)

error_training <- result_training - training$quality
error_validation <- result_validation - validation$quality

# vettori necessari per curve di apprendimento TFS

# RMSE su test set
result_test <- predict(ridge_model, test)
error_test <- result_test - test$quality
RMSE <- sqrt(mean((error_test)^2))
