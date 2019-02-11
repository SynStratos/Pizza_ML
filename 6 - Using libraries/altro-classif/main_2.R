# MULTICLASS LOGISTIC REGRESSION

rm(list=ls())

# import data
data <- read.csv("candy_2.csv", header=FALSE)
colnames(data) <- c("caramel", "peanutyalmondy", "nougat", "crispedricewafer", "hard", "bar", "pluribus", "sugarpercent", "pricepercent", "winpercent", "choco", "fruit", "other")

# funzione per unire tutte le 3 classi in una singola colonna e assegnare un valore diverso per classe
all_classes <- function(y){
  c <- rep(1,nrow(y))
  for( i in 1:nrow(y)){
    if(y[i,1]==1)   c[i] <- 0
    if(y[i,2]==1)   c[i] <- 1
    if(y[i,3]==1)   c[i] <- 2
  }
  c
}

multi <- all_classes(data[,11:13])
data <- cbind(data[,1:10], multi)

# min-max normalization
normalized <- lapply( data[,1:10], function(x) round((x-min(x))/(max(x)-min(x)), 1))
data <- cbind(normalized, data[11])

# split data
set.seed(222)
ind <- sample(2, nrow(data), replace=TRUE, prob= c(0.8,0.2))
training <- data[ind==1,]
test <- data[ind==2,]

# train the model
my_formula<- as.formula(paste(names(training)[11], " ~ ", paste(names(training)[-11], collapse= "+")))
library(nnet)
my_model1 <- multinom( formula = my_formula,
                       data = training)
# my_model <- glm( formula = my_formula,
#                  data = training)
summary(my_model1)
result <- predict(my_model1, test)
print(result)

# confusion matrix
conf <- table(result, test[,11])
print(conf)
error <- 1 - sum(diag(conf)) / sum(conf)
print(error)


# test set esercitazione
sample_1 <- cbind(0,0,0,0,0,0,1,0.31299999,0.31299999,44.375519)
sample_2 <- cbind(1,0,0,0,1,0,0,0.186,0.26699999,41.904308)
sample_3 <- cbind(0,0,0,1,0,0,1,0.87199998,0.84799999,49.524113)

test_2 <- as.data.frame(rbind(sample_1, sample_2, sample_3))
colnames(test_2) <- c("caramel", "peanutyalmondy", "nougat", "crispedricewafer", "hard", "bar", "pluribus", "sugarpercent", "pricepercent", "winpercent")

# prediction su test set
result_2 <- predict(my_model1, test_2)
print(result_2)
