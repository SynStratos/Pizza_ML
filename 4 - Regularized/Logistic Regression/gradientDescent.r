gradientDescent <- function(X, y, theta, alpha){
  
  m <- length(y)
  

  m = length(y)
  
  for (i in 1:10000) {
    
    h <- sigmoid(X%*%theta)
    theta1 <- c(0,theta[2:length(theta)])
    p = lambda * (theta1%*%theta1)/(2*m)
    J = ((-y)%*%log(h)-(1-y)%*%log(1-h))/m + p
    
    grad = ((t(X)%*%(h - y))+lambda*theta1)/m
    
    theta = theta - alpha * grad
  }
  
  theta
  
}