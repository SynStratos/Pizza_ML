backwardPropagation <- function(theta_all, X, y, lambda){
  
  m <- length(X)
  
  fp <- forwardPropagation(theta_all, X)
  
  fp_length <- length(fp)
  
  
  delta_piccoli <- list()
  
  #ultimo livello -> formula a se stante -> esterno dal ciclo for
  d = fp[[fp_length]] - y
  delta_piccoli[[fp_length]] <- d
  
  #calcolo tutti i delta piccoli da (L-1) a 2 -> il primo livello viene escluso in quanto relativo all'entrate
  for( i in (fp_length-1) : 2 ){
    g <-  fp[[i]] * (1 - fp[[i]])

    #moltiplico d_piccolo dell'iterazione precedente per il theta corrente che avrà dimensione pari a d_piccolo precedente
    d <- ( d%*%theta_all[[i]] ) * g
    d <- d[,-1]
    delta_piccoli[[i]] <- d
  }
  
  #calcolo dei delta grandi
  delta_grandi <- list()
  
  # #inverto l'ordine degli elementi nella lista delta_piccoli in quanto li ho iterati da m a 2
  # delta_piccoli <- list.reverse(delta_piccoli)s
  for( i in 2:(length(delta_piccoli))){
    # questo perchè i delta piccoli vanno da 2 a m
    D <- t( delta_piccoli[[i]]) %*% fp[[i-1]]
    
    delta_grandi[[i]] <- D
  }
  
  #per ogni livello
  #la prima colonna la riempio di zeri in modo da avere un prodotto nullo quando j=0
  #in questo modo vado a trascurare la componente data da lambda*Theta
  
  theta_grad <- list()
  
  for( i in 2:length(delta_grandi)){
    theta <- theta_all[[i-1]]
    temp <- cbind(rep(0, nrow(theta)), theta[,-1])
    temp <- as.matrix(temp)
    
    t_grad <- ( delta_grandi[[i]] / m ) + ( lambda * temp)
    theta_grad[[i-1]] <- t_grad
  }
  
  theta_grad
}