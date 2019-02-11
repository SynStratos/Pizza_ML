library(datasets)
library(ggplot2)
library(cluster)
library(factoextra)
library(dbscan)
library(mclust)
library(fpc)

rm(list=ls())

ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()


#---------- K-MEANS ---------#
# Perform k-means clustering on a data matrix.
kmx = kmeans( iris[,3:4], 3, nstart=20) 
table(kmx$cluster, iris$Species)

kmx$cluster <- as.factor(kmx$cluster)
ggplot(iris, aes(Petal.Length, Petal.Width, color=kmx$cluster)) + geom_point()

# Provides ggplot2-based elegant visualization of partitioning methods
fviz_cluster(object = kmx, data = iris[, 3:4], geom = "point",
             # choose.vars = c("Sepal.Length", "Sepal.Width"), stand = FALSE, 
             ellipse.type = "norm") + theme_bw()

#---------- K-MEDOIDS ---------#
# Partitioning (clustering) of the data into k clusters “around medoids”, a more robust version of K-means.
pamx <- pam(iris[,3:4], 3) 
pamx$cluster <- as.factor(pamx$cluster)
ggplot(iris, aes(Petal.Length, Petal.Width, color = pamx$cluster)) + geom_point()
fviz_cluster(pamx, geom = "point",
             ellipse.type = "norm") + theme_bw()

#---------- GAUSSIAN MIXTURE MODELS ---------#
# Model-based clustering based on parameterized finite Gaussian mixture models.
# G == number of clusters
gmm <- Mclust(iris[,3:4], G = 3, modelNames = c("VVE"))
plot(gmm, what = "classification")
fviz_cluster(object = gmm, data = iris, geom = "point",
             ellipse.type = "norm") + theme_bw()

# BIC for parameterized Gaussian mixture models fitted by EM algorithm initialized by model-based hierarchical clustering.
bic <- mclustBIC(iris[,3:4])
gmm <- Mclust(iris[,3:4], x = bic)
plot(gmm, what = "classification")
fviz_cluster(object = gmm, data = iris, geom = "point",
             ellipse.type = "norm") + theme_bw()

#---------- DBSCAN ---------#
# Fast calculation of the k-nearest neighbor distances in a matrix of points.
kNNdistplot(iris[, 3:4], k=4) # k == number of nearest neighbors
abline(h=0.2,lty=2)
dbm = fpc::dbscan(iris[, 3:4], eps=0.2, MinPts=4)
fviz_cluster(dbm, iris[, 3:4], geom = "point")

#---------- HDBSCAN ---------#
# Fast implementation of the HDBSCAN (Hierarchical DBSCAN) and its related algorithms using Rcpp.
hdbm = hdbscan(iris[, 3:4], minPts=5,     gen_simplified_tree = T)
plot(iris[, 3:4], col=hdbm$cluster+1, pch=20) # vengono solo due cluster ?????

#---------- BOXPLOT OUTLIERS ----------#
# Produce box-and-whisker plot(s) of the given (grouped) values.
res <- boxplot(iris[,3:4], outline=F)
