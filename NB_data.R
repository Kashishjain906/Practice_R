##read the data-------------------------
NB_data <- read.csv("NB_data.csv",header = T)

glimpse(NB_data)

str(NB_data)

pairs.panels(NB_data[-5])

##NB_data$inc= by, this we create new table in data-------
NB_data$inc <- ifelse(NB_data$Income > 30000, "High", "Low")

str(NB_data)

##we change datatype---------
NB_data$inc <- as.factor(NB_data$inc) 

##removing columns for data-------------------
nb_data_adjust1 <- NB_data[c(-1,-7,-9)]

str(nb_data_adjust1)

##Data partition---------------------------
set.seed(1234)

my_random_data <- sample(2,nrow(nb_data_adjust1),replace = T, prob = c(0.90, 0.10))

train_nb_data = nb_data_adjust1[my_random_data == 1, ]

str(train_nb_data)

test_nb_data = nb_data_adjust1[my_random_data == 2, ]

str(test_nb_data)

##Naive Bayes model------------------------
library(e1071)

nb_model <- naiveBayes(inc~. , data = nb_data_adjust1)

nb_model

##Predict--------------------------

nb_predict <- predict(nb_model, test_nb_data, type = "class")
nb_predict

##confusion Matrix for test data----------------------------

(table1 <- table(nb_predict, test_nb_data$inc))
1 - sum(diag(table1)) / sum(table1)

#-----------------------------------------------------------------------#