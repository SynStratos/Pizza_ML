library(calibrate)

url <- "https://raw.githubusercontent.com/steviep42/youtube/master/YOUTUBE.DIR/marks.dat"
data <- read.csv(url)

plot(data, cex=0.9, col="blue")
options(digits=3)
par(mfrow=c(1,1))

#scaling the data
standardize <- function(x){ (x-mean(x))}
scaled_data <- apply(data, 2, standardize)
plot(scaled_data ,cex=0.9, col="blue", main="Scaled data")

#eigen values of covariance matrix
cov_matrix <- cov(scaled_data)
eigen_v <- eigen(cov_matrix)

rownames(eigen_v$vectors)=c("Physics", "Stats")
colnames(eigen_v$vectors)=c("PC1", "PC2") #eigen vectors == principal components
print(eigen_v$vectors)

#la somma degli eigen values è uguale alla varianza totale
sum(eigen_v$values)
var(scaled_data[,1])+var(scaled_data[,2])
# :)

#per il plot
pc1_slope <- eigen_v$vectors[1,1]/eigen_v$vectors[2,1]
pc2_slope <- eigen_v$vectors[1,2]/eigen_v$vectors[2,2]
#perpendicolari tra di loro per definizione
abline(0, pc1_slope, col="red")
abline(0, pc2_slope, col="green")

#variation per eigenvector
pc1_var <- 100*round(eigen_v$values[1]/sum(eigen_v$values),digits=2)
pc2_var <- 100*round(eigen_v$values[2]/sum(eigen_v$values),digits=2)

#scaled data * eigenvectors
scores <- scaled_data%*%eigen_v$vectors
#nuovo plot su principal components
plot(scores, ylim=c(-10,10), col="blue", main="Plot on eigenvectors")
abline(0,0, col="red")
abline(0,90, col="green")
