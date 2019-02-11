library(neuralnet)

data <- read.csv("binary.csv", header=TRUE)


# min-max normalization
data$gre <- ( data$gre - min(data$gre))/(max(data$gre)- min(data$gre))
data$gpa <- ( data$gpa - min(data$gpa))/(max(data$gpa)- min(data$gpa))
data$rank <- ( data$rank - min(data$rank))/(max(data$rank)- min(data$rank))

# data partition
set.seed(222)
ind <- sample(2, nrow(data), replace=TRUE, prob= c(0.7,0.3))
training <- data[ind==1,]
test <- data[ind==2,]

# neural networks

set.seed(333)
# store the network, we want to predict "admit" as a function of "gre" "gpa" e "rank"
# we have to specify the number of nodes in hidden layer
# specify function to mesure the output error "err.fct"
n <- neuralnet(admit~gre+gpa+rank, 
               data = training, 
               hidden = 5, #c(5,2),
               rep = 5, #quante volte voglio ripetere il training del modello
               err.fct = "ce",
               # lifesign  opzione per quante info deve stampare durante il training
               # posso specificare l'algoritmo algorithm = "____"
               linear.output = FALSE)
plot(n)


# prediction
output <- compute(n, training[,-1]) #excluded "admit" column #posso specificare anche rep

p1 <- output$net.result
pred1 <- ifelse(p1>0.5, 1, 0)
# confusion matrix
tab1 <- table(pred1, training$admit)
tab1
# misclassification error
1-sum(diag(tab1))/sum(tab1)

# prediction and evaluation on test set
output2 <- compute(n, test[,-1])
p2 <- output2$net.result
pred2 <- ifelse(p2>0.5, 1, 0)
# confusion matrix
tab2 <- table(pred2, test$admit)
tab2
# misclassification error
1-sum(diag(tab2))/sum(tab2)
