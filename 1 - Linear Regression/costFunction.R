#Funzione che implementa la funzione costo
computeCost  <- function(X, y, theta, m) {
 
  J <- 0
 
  diff= X%*%theta-y
  J<-(t(diff)%*%(diff))/(2*m)
  J
  
}