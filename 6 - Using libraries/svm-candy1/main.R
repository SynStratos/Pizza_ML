library(e1071)

dataset <- read.csv(file = "candy_1.csv", header=FALSE)

X <- dataset[1:10]
y <- dataset[11]
y <- as.matrix(y)

data <- data.frame(X, y=as.factor(y))
model <- svm(y~., data=data, kernel="polynomial", cost=1, scale=FALSE)
summary(model)
plot(model, data=data, V8~V10, slice = list(V1=1, V9=1))

tuned_model <-  tune(svm, y~., data=data, ranges=list(epsilon = seq(0,1,0.1), cost=2^(2:7)))
plot(tuned_model) #regione più scura presenta un errore minore
summary(tuned_model)

best_model <- tuned_model$best.model 
summary(best_model)

pred <- predict(best_model, data=data)
tab <- table(Predicted = pred, Actual = data$y)
print(tab)

print("misclassification error") 
print(1-sum(diag(tab))/sum(tab))
