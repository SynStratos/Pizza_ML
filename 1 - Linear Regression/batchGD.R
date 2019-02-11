# Funzione che implementa l'algoritmo GRADIENT DESCENT (versione Batch)
gradientDesc <- function(X, y, theta_passed ,iter_number, alpha)
{

  theta <- theta_passed
  m <- length(y)
  
  for (iter in 2:(iter_number + 1))
  {
    gradient = (1/m)*(t(X)%*%(X%*%theta - y))
    theta <- theta - alpha*gradient
  }
  theta
}