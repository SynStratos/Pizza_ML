#Funzione che predice, dati i parametri del sistena (thteta), i sample che si passano in input
predict <- function(X, theta_matrix){
  
  sigmoid_matrix <- sigmoid(t(X), theta_matrix)
  
  #Restituisco l'indice del valore massimo delle sigmoidi di ogni sample
  #L'indice corrisponderà alle tre classi differenti indicate come 1, 2 o 3
  max_v <- rep(0,ncol(theta_matrix))
  for(it in 1:3){
    max_v[it] <- which.max(sigmoid_matrix[it,])
  }
  
  max_v
}