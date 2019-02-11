boxplot <- function(X) {
  for (i in 2:ncol(X)) {
    test = t(X[,i])
    m <- length(test)
    sorted_test = sort(test)
    
    Q2 = median(sorted_test)  
	middle <- m/2
	
    #effettuo una suddivisione differente a seconda che il vettore considerato sia di elementi pari o dispari
    if( length(sorted_test) %% 2 == 0){
      v1 <- sorted_test[1:middle]
      v3 <- sorted_test[(middle+1) : length(sorted_test)]
    }else{
      v1 <- sorted_test[1:middle-1]
      v3 <- sorted_test[(middle+1) : length(sorted_test)]
    }
    
    Q1 = median(v1)
    Q3 = median(v3)
    
    IQR = Q3 - Q1
    
    sup = Q3 + 1.5 * IQR
    inf = Q1 - 1.5 * IQR
    
    for (j in 1:length(test)) {
      if (test[j] > sup) {
        X = X[-j,]
      }
      if (test[j] < inf) {
        X = X[-j,]
      }
    }
  }
  
  X
}