#--------------------REGRESSIONE LINEARE MULTIVARIATA--------------------#
rm(list=ls())

# import data
data <- read.csv("wine.csv", header=F)
colnames(data) <- c("fixed_acidity", "volatile_acidity", "citric_acid", "residual_sugar", "chlorides", 
                    "free_sulfur_dioxide", "total_sulfur_dioxide", "density", "pH", "sulphates", "alcohol", "quality")

# SCEGLIERE UN TIPO DI NORMALIZZAZIONE
# z-score normalization
mu <- apply(data[-12], 2, mean)
std <- apply(data[-12], 2, sd)
data[1:11] <- sweep(sweep(data[-12], 2L, mu), 2, std, "/") # come all'esercitazione 

# TRAINING DEL MODELLO
my_model <- lm(data$quality~., data)

# APPLICARE IL MODELLO AL NUOVO SAMPLE
sample <- data.frame(t(c(6.0, 0.31, 0.47, 3.6, 0.067, 18.0, 42.0, 0.99549, 3.39, 0.66, 11.0)))
names(sample) <- c("fixed_acidity", "volatile_acidity", "citric_acid", "residual_sugar", "chlorides", 
                   "free_sulfur_dioxide", "total_sulfur_dioxide", "density", "pH", "sulphates", "alcohol")

norm_sample <- sweep(sweep(sample, 2L, mu), 2, std, "/")
result_sample <- predict(my_model, norm_sample)

#--------------------REGRESSIONE POLINOMIALE MULTIVARIATA--------------------#
#------------AGGIUNGERE FEATURE CORRISPONDENTE A fixed_acidity*pH------------#
rm(list=ls())

# import data
data <- read.csv("wine.csv", header=F)
colnames(data) <- c("fixed_acidity", "volatile_acidity", "citric_acid", "residual_sugar", "chlorides", 
                    "free_sulfur_dioxide", "total_sulfur_dioxide", "density", "pH", "sulphates", "alcohol", "quality")

new_feature <- data$pH * data$fixed_acidity
data <- cbind(data[1:11], new_feature, data[12])

mu <- apply(data[-13], 2, mean)
std <- apply(data[-13], 2, sd)
data[1:12] <- sweep(sweep(data[-13], 2L, mu), 2, std, "/")

my_model <- lm(data$quality ~., data)

sample <- data.frame(t(c(6.0, 0.31, 0.47, 3.6, 0.067, 18.0, 42.0, 0.99549, 3.39, 0.66, 11.0, 6.0*3.39)))
colnames(sample) <- c("fixed_acidity", "volatile_acidity", "citric_acid", "residual_sugar", "chlorides", 
                    "free_sulfur_dioxide", "total_sulfur_dioxide", "density", "pH", "sulphates", "alcohol", "new_feature")
norm_sample <- sweep(sweep(sample, 2L, mu), 2, std, "/")

result_sample <- predict(my_model, norm_sample)
