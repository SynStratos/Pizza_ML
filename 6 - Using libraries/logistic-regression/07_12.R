#----------Valutazione di un modello di classificazione----------#
rm(list=ls())

# import data
data <- read.csv("candy_1.csv", header=FALSE)
colnames(data) <- c("caramel", "peanutyalmondy", "nougat", "crispedricewafer", "hard", "bar", "pluribus", "sugarpercent", "pricepercent", "winpercent", "choco")

# z-score normalization
mu <- apply(data[-11], 2, mean)
std <- apply(data[-11], 2, sd)
data[-11] <- sweep(sweep(data[-11], 2L, mu), 2, std, "/")

# split 80/20
set.seed(222)
ind <- sample(2, nrow(data), replace=TRUE, prob= c(0.8,0.2))
training <- data[ind==1,]
test <- data[ind==2,]

# train the model
my_formula <- as.formula(paste(names(training)[11], " ~ ", paste(names(training)[-11], collapse= "+")))
my_model <- glm( formula = my_formula,
                 data = training,
                 family = "binomial")

# prediction su test set
result <- predict(my_model, test, type="response")

# confusion matrix e misclassification error
predict <- ifelse(result>0.5, 1, 0)
conf <- table(Predicted = predict, Actual = test$choco)
error <- 1 - sum(diag(conf)) / sum(conf)

# precision
precision <- conf[1:1]/sum(conf[1,])

# recall
recall <- conf[1:1]/sum(conf[,1])

# f1-score
f1_score <- 2 * (precision * recall) / (precision + recall)

# test on new samples (23-11-2018 es.2)
sample_1 <- cbind(1, 0, 0, 0, 1, 0, 0, 0.186, 0.26699999, 41.904308)
sample_2 <- cbind(0, 0, 0, 1, 0, 0, 1, 0.87199998, 0.84799999, 49.524113)
test_2 <- as.data.frame(rbind(sample_1, sample_2))
colnames(test_2) <- c("caramel", "peanutyalmondy", "nougat", "crispedricewafer", "hard", "bar", "pluribus", "sugarpercent", "pricepercent", "winpercent")

# prediction su test set
result_2 <- predict(my_model, test_2, type="response")
predict_2 <- ifelse(result_2>0.5, 1, 0)
