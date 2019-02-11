gaussian_kernel <- function(x1, x2, sigma){
  sim <- exp(-1*T(x1-x2) %*% (x1-x2) / (2*sigma*sigma))

  sim
}