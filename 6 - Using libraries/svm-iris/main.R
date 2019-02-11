# libraries
library(ggplot2)
library(e1071)
# data
data(iris)
str(iris)

# first plot
qplot(Petal.Length, Petal.Width, data=iris, color = Species)

# support vector machine
# kernel = [linear, radial, polynomial, sigmoid]
model <- svm(Species~., data=iris, kernel="radial")
summary(model)
plot(model, data=iris, Petal.Width~Petal.Length, slice = list(Sepal.Width=3, Sepal.Length=4))

# tuning
set.seed(123)
#seq(0,1,0.1) da 0 a 1 con passo di 0.1
#2^(2:9) esponenti di 2 da 2^2 a 2^9
tuned_model <-  tune(svm, Species~., data=iris, ranges=list(epsilon = seq(0,1,0.1), cost=2^(2:7)))
plot(tuned_model) #regione più scura presenta un errore minore
summary(tuned_model)

# best model
best_model <- tuned_model$best.model 
summary(best_model)
plot(best_model, data=iris, Petal.Width~Petal.Length, slice = list(Sepal.Width=3, Sepal.Length=4))


 # confusion matrix e misclassification error
pred <- predict(best_model, iris)
tab <- table(Predicted = pred, Actual = iris$Species)
print(tab)

print("misclassification error") 
print(1-sum(diag(tab))/sum(tab))
