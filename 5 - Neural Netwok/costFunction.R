costFunction <- function(theta_all, X, y, lambda) {
  
  # FORWARD PROPAGATION
  res <- forwardPropagation(theta_all, X)
  
  # Calcolo il termine di regolarizzazione
  p <- 0
  for(i in 1 : length(theta_all) ){
    theta <- theta_all[[i]]

    p <- p + sum( rowSums( theta[,-1]^2) )
  }
  # Calcolo del costo
  
  h <-res[[length(res)]]
  
  J = sum(rowSums(-y * log(h) - (1-y) * log(1-h)))/m + lambda*p/(2*m)
}