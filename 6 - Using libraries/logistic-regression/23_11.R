#----------Regressione Logistica multi-classe----------#
rm(list=ls())

data <- read.csv("candy_2.csv", header=FALSE)
colnames(data) <- c("caramel", "peanutyalmondy", "nougat", "crispedricewafer", "hard", "bar", "pluribus", "sugarpercent", 
                    "pricepercent", "winpercent", "choco", "fruit", "other")

my_formula <- as.formula(paste(names(data)[11], " ~ ", paste(names(data)[1:10], collapse= "+")))
choco_model <- glm( formula = my_formula,
                    data = data,
                    family = binomial(link="logit"))

my_formula <- as.formula(paste(names(data)[12], " ~ ", paste(names(data)[1:10], collapse= "+")))
fruit_model <- glm( formula = my_formula,
                    data = data,
                    family = binomial(link="logit"))

my_formula <- as.formula(paste(names(data)[13], " ~ ", paste(names(data)[1:10], collapse= "+")))
other_model <- glm( formula = my_formula,
                    data = data,
                    family = binomial(link="logit"))

# test on new samples
sample_1 <- cbind(0,0,0,0,0,0,1,0.31299999,0.31299999,44.375519)
sample_2 <- cbind(1,0,0,0,1,0,0,0.186,0.26699999,41.904308)
sample_3 <- cbind(0,0,0,1,0,0,1,0.87199998,0.84799999,49.524113)

test_2 <- as.data.frame(rbind(sample_1, sample_2, sample_3))
colnames(test_2) <- c("caramel", "peanutyalmondy", "nougat", "crispedricewafer", "hard", "bar", "pluribus", "sugarpercent", "pricepercent", "winpercent")

result_1 <- predict(choco_model, test_2) #1
result_2 <- predict(fruit_model, test_2) #2
result_3 <- predict(other_model, test_2) #3

result <- cbind(result_1, result_2, result_3)
result_index <- max.col(result)
print(result_index)
