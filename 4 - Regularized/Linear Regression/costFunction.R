costFunction <- function (theta, X, y) {
  #Funzione costo che supporta la regolarizzazione (lambda)
  
  m = length(y)
  
  h <- X %*% theta
  theta1 <- c(0,theta[2:length(theta)])
  p <- (lambda/(2*m)) * (theta1%*%theta1)
  J <- 1/(2*m) * t(h-y)%*%(h-y) + p
  
  J
}