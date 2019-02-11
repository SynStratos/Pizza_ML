forwardPropagation <- function(theta_all, X){
  
  m <- length(theta_all)
  
  a <- X
  
  l <- list()
  
  l[[1]] <- a
  
  for( i in 1:m){
    theta_xx <- theta_all[[i]]
    
    z <- a %*% t( theta_xx )
    a <- sigmoid(z)

    a <- cbind(rep(1, nrow(a)), a)
    a <- as.matrix(a)
    
    l[[i+1]] <- a
  }
  tmp <- l[[length(l)]]
  #per ogni livello ad a aggiungo il bias +1 tranne per l'ultimo livello corrispondente alle uscite
  l[[length(l)]] <- tmp[,-1]
  l
}