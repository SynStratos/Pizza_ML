gradientDescent <- function(X, y, theta, alpha){
  
  m = length(y)
  
  for (i in 1:10000) {
    
    h <- X %*% theta
    theta1 <- c(0,theta[2:length(theta)])
    grad <- (t(X) %*% (h-y) + lambda*theta1)/m
    
    theta = theta - alpha * grad
  }
  
  theta
  
}