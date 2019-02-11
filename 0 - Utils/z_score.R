z_score <- function(data){
 for(i in 1:ncol(data)){
  media <- mean(data[,i])
  dev <- sd(data[,i])
  
  for(j in 1:nrow(data)){
    data[j,i] <- (data[j,i]-media)/dev
  }
 }
}