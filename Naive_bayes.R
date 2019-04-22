#install.packages("e1071")
library(e1071)
library(dplyr)
library(ggplot2)
#install.packages("psych")
library(psych)

##Data----------------------------
setwd("G:/Dataset")
binary_data <- read.csv("binary.csv",header = T)
glimpse(binary_data)

str(binary_data)

xtabs(~admit+rank, data = binary_data)
binary_data$admit <- as.factor(binary_data$admit)
binary_data$rank <- as.factor(binary_data$rank)

##Visualisation---------------------------
##pairs.panel is done for see the correlation---
pairs.panels(binary_data[-1])

binary_data %>% ggplot(aes(x=admit,y=gpa, fill = admit)) +
  geom_boxplot() +
  ggtitle("box plot")

binary_data %>% ggplot(aes(x= gpa, fill = admit))+
  geom_density(alpha = 0.8 , color = "black")+
  ggtitle("Density plot")

##Data partition------------------------
#for generating same random number---------
set.seed(1234)

ind <- sample(2, nrow(binary_data), replace = T, prob = c(0.8, 0.2))

train = binary_data[ind == 1,]

test = binary_data[ind == 2,]

##Naive Bayes Model----------------------
model <- naiveBayes(admit~ . , data = train, laplace = 0)

model

train %>% filter(admit == "1") %>%
  summarise(mean(gre), sd(gre))

plot(model)


##Predict--------------------------
p <- predict(model, train, type = "raw")

head(cbind(p,train))


##Confusion Matrix - train data------------
##compare the predicted and actual value is confusion matrix----------
##column == predicted----------------
p1 <- predict(model, train)
(tab1 <- table(p1, train$admit))
1 - sum(diag(tab1)) / sum(tab1)


##Confusion Matrix - test data--------------
p2 <- predict(model, test)
(tab2 <- table(p2, test$admit))
1 - sum(diag(tab2)) / sum(tab2)


