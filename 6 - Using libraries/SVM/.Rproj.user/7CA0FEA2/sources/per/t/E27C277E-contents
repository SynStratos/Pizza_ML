library(R.matlab)
library(e1071)
library(mlbench)

rm(list=ls())
# sources <- c("-- inserire file --")
# for (i in 1:length(sources)) {
#    source(sources[i])
# }

# caricamento dei dati
data <- readMat("ex6data1.mat")

X <- data$X
y <- data$y

data <- readMat("ex6data2.mat")

X2 <- data$X
y2 <- data$y
# training linear svm

dat <- data.frame(X, y=as.factor(y))
model <- svm(y ~ ., data=dat, kernel="linear", cost=1, scale=FALSE)
summary(model)
plot(model,dat )

predi <- predict(model, dat)


# implementazione gaussian kernel
# kernel="polynomial" coef0 =     degree = 
dat2 <- data.frame(X2, y2=as.factor(y2))
model2 <- svm(y2 ~ ., data=dat2, kernel="polynomial", cost=1, coef0=3, degree=10, scale=FALSE)
summary(model2)
plot(model2,dat2)

