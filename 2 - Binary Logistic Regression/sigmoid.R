#Funzione che modella la sigmoide
sigmoid <- function(X, theta){
  
  z <- X%*%theta
  
  g <- 1/(1+exp(-z))
  
  g
  
}