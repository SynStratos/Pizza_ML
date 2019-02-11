library(neuralnet)

rm(list=ls())

data <- read.csv("candy_2.csv", header=FALSE)

# rinomino le colonne perchè altrimenti "toffa"
colnames(data) <- c("caramel", "peanutyalmondy", "nougat", "crispedricewafer", "hard", "bar", "pluribus", "sugarpercent", "pricepercent", "winpercent", "choco", "fruit", "other")

# normalizzo la colonna con i valori brutti
data$winpercent <- ( data$winpercent - min(data$winpercent))/(max(data$winpercent) - min(data$winpercent))

# creo training set e test set
set.seed(222)
ind <- sample(2, nrow(data), replace=TRUE, prob= c(0.7,0.3))
training <- data[ind==1,]
test <- data[ind==2,]

# traino il modello della rete neurale

my_formula<- as.formula(paste(paste(names(training)[11:13], collapse= "+"), " ~ ", paste(names(training)[1:10], collapse= "+")))
model <- neuralnet(formula = my_formula,
                   data = training,
                   hidden=c(5,5),
                   rep=2)
plot(model)      


# provo sul test set generato in precedenza
X <- test[,1:10]
output <- compute(model, X)
p1 <- output$net.result
result1 <- max.col(p1)


# provo sul test set di walter
pred1 <- cbind(0, 0, 0, 0, 0, 0, 1, 0.31299999, 0.31299999, 44.375519)
pred2 <- cbind(1, 0, 0, 0, 1, 0, 0, 0.186, 0.26699999, 41.904308)
pred3 <- cbind(0, 0, 0, 1, 0, 0, 1, 0.87199998, 0.84799999, 49.524113)

test2 <- rbind(pred1, pred2, pred3)
output2 <- compute(model, test2)
p2 <- output2$net.result
result2 <- max.col(p2)
print(result2)