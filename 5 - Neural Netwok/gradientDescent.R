gradientDescent <- function(theta_all, X, y, lambda) {
  
  alpha <- 0.01
  iter <- 100000
  
  for (i in 1:iter){
    theta_grad <- backwardPropagation(theta_all, X, y, lambda)
    
    for( j in 1:length(theta_all)){
      theta_all[[j]] <- theta_all[[j]] - alpha * theta_grad[[j]]
    }
    message(i,"\r",appendLF=FALSE)
    flush.console()
  }
  theta_all
}