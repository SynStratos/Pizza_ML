min_max <- functionU(data){ 
 a <- 0
 b <- 1
 for(i in 1:ncol(data)){
   min <- min(data[,i])
   max <- max(data[,i])
 
   for(j in 1:nrow(data)){
    data[j,i] <- ((data[j,i]-min)/(max-min))*(b-a)+a
  }
 }
}