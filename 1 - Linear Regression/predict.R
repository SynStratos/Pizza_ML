#Funzione che predice il valore di un nuovo sample
predict <- function(X, y, theta){
  
  prediction_vector = X %*% theta
  
  prediction_vector
  
}