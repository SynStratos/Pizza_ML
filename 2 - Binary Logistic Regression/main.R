#Pulisco tutte le variabili precedentemente utilizzate
rm(list=ls())

#Carico tutti i file in cui sono definite le varie funzioni
sources <- c("costFunction.R", "sigmoid.R", "gradient.R", "predict.R")
for (i in 1:length(sources)) {
  source(sources[i])
}

#Lettura del file da importare
#  data <- read.table(...)

#Dal dataset separo i samples (X) e la variabile target (Y)
#  X <- data[,1:...]
#  y <- data[,...]
#Salvo parametri utili nel corso dello script
m <- length(y)

#Ai samples precedentemente prelevati dal dataset, unisco la colonna di tutti "1" pari alla variabile "X_0"
X <- cbind(rep(1,m),X)
X <- as.matrix(X)

#Creo vettori di theta "iniziali", messi pari a zero
theta <- rep(0,ncol(X))

#Decido numeri di iterazioni e parametro alpha
iter <- 1500
alpha <- 0.001

#Calcolo il costo -> ATTENZIONE: Sistema non ancora "trainato", quindi i theta sono ancora zero -> Costo iniziale
cost <- costFunction(X,y,theta)

#Training del sistema -> Usato l'algoritmo BATCH GRADIENT DESCENT
theta_new <- gradientDescent(X, y, theta, alpha, iter)


#Import di nuovi sample
#  sample <- read.table(...)
#Predizione del suddetto sample
prediction1 <- predict(theta, sample)
