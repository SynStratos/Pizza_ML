library(R.matlab)
library(e1071)

rm(list=ls())

sources <- c("splitTarget.R", "forwardPropagation.R", "backwardPropagation.R", "costFunction.R", "sigmoidGradient.R", "randomInitialize.R", "gradientDescent.R")
for (i in 1:length(sources)) {
  cat(paste("Loading ",sources[i],"\n"))
  source(sources[i])
}

#Lettura del file da importare
#  data <- read.table(...)

#Dal dataset separo i samples (X) e la variabile target (Y)
#  X <- data[,1:...]
#  y <- data[,...]
y <- as.matrix(y)
m <- nrow(X)
X <- cbind(rep(1,m), X)
X <- as.matrix(X)
# 
# y_splitted <- splitTarget(y)

#creo rete neurale a 3 livelli di cui uno nascosto

lambda = 1

## ----------------------------------------#
## RANDOM INITIALIZATION ##
## ----------------------------------------#
# valore bibliografico
epsilon = 0.12

# n <- numero di classi

theta_random <- list()
theta_random[[1]] <- randomInitialize(epsilon, 5, ncol(X))
theta_random[[2]] <- randomInitialize(epsilon, n, 6)

## ----------------------------------------#
## GRADIENT DESCENT ##
## ----------------------------------------#
# training della rete neurale
initialcost <- costFunction(theta_random, X, y, lambda)
updated_thetas <- gradientDescent(theta_random, X, y, lambda)
finalcost <- costFunction(updated_thetas, X, y, lambda)
