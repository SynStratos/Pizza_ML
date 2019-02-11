randomInitialize <- function(epsilon, lenrow, lencol) {
  t = matrix(runif(lenrow*lencol, -epsilon, epsilon), lenrow, lencol)
  t
}