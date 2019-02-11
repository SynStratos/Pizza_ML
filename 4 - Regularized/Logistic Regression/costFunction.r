costFunction <- function(theta, X, y) {
  
  #Implementazione scalare regolarizzata
  
  m = length(y)
  
  h <- sigmoid(X%*%theta)
  sum2 <- 0
  for (j in 2:length(theta)){
    sum2 = sum2 + theta[j]^2
  }
  sum2 = sum2 * lambda/(2*m)
  cost <- 1/m * (-y%*%log(h)-(1-y)%*%log(1-h)) + sum2
  return(cost)
  
}