#Funzione che implementa la funzione costo
costFunction <- function(theta, X, y)
{
  m <- nrow(X)
  
  g <- sigmoid(X, theta)
  
  J <- (1/m)*sum((-y*log(g)) - ((1-y)*log(1-g)))
  
  J
}