# Funzione che implementa l'algoritmo GRADIENT DESCENT (versione Batch)
gradientDescent <- function(X, y, theta, alpha, iter){
  
  m <- length(y)
  
  
  for (i in 1:iter) {
    
    gradient <- t(X)%*%(sigmoid(X, theta) - y)
    gradient <- (1/m) * gradient
    theta <- theta - alpha * gradient
    
  }
  
  theta
}