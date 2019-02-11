library(ggplot2)
# ---LOAD DATA---
data(iris)
# head(iris)
# summary(iris)

# ---PCA---
pr <- prcomp(iris[,1:4], scale = TRUE)
summary(pr)
plot(pr, type="l")

biplot(pr, scala=0)

# ---EXTRACT SCORES---
iris2 <- cbind(iris, pr$x[,1:2])
head(iris2)

# ---PLOT W/ GGPLOT---
ggplot(iris2, aes(PC1, PC2, col=Species, fill=Species)) +
 stat_ellipse(geom = "polygon", col = "black", alpha=0.5) +
 geom_point(shape=21, col="black")

# ---CORRELATION BETWEEN VARS AND PCS---
cor(iris[,1:4], iris2[,6:7])
