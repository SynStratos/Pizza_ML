#Funzione che predice, dati i parametri del sistena (thteta), i sample che si passano in input
predict <- function(theta, X){
  
  prediction_vector = sigmoid(X, theta)
  
  # Nel vettore "prediction_vector" si inseriscono, uno per ogni sample, i valori "0" o "1" a seconda che il sample abbia avuto 
  # una predizione pari a >=0.5 oppure <= 0.5
  for (i in 1:length(prediction_vector)) {
    ifelse(prediction_vector[i]>=0.5,prediction_vector[i]<-1,prediction_vector[i]<-0)
  }
  
  prediction_vector
}