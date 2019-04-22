
# Implementing the support vector machine

# SVM is a supervised machine learning algorithm

library(e1071)

#plot(iris)
iris1 <- read.csv("Iris.csv")
View(iris1)

# withe certain combinations we can see taht data can be linearly seperable

library(ggplot2)

ggplot(iris1, aes(SepalLengthCm, PetalLengthCm, col = Species)) + geom_point()

ggplot(iris1, aes(SepalLengthCm, SepalWidthCm, col = Species)) + geom_point()

# This can also seperate the data linearly....
ggplot(iris1, aes(PetalWidthCm, PetalLengthCm, col = Species)) + geom_point()

# In these we can seperate the data quite well that too linearly.....
ggplot(iris1, aes(PetalWidthCm, SepalWidthCm, col = Species)) + geom_point()

# Accessing the data using names
iris1["PetalLengthCm"]

set.seed(4242)

#sample is generated bcoz of generating the train and test data......
my_sample <- sample(150, 100)

print(my_sample)


my_columns <- c("PetalLengthCm","PetalWidthCm","Species")

##View(my_columns)

my_train_data <- iris1[my_sample,my_columns]

my_test_data <- iris1[-my_sample,my_columns]


head(my_train_data)


head(my_test_data)

# Now, applying the svm and giving a formula to create the svm model
my_svm_model1 <- svm(Species~.,data = my_train_data,kernel = "linear", cost = 0.1, scale = FALSE)


class(my_svm_model1)


# Telling that 52 support vectors have been found....
print(my_svm_model1)

# Plotting the svm model

# Kind of plotting the model on the train data
plot(my_svm_model1, my_train_data[,my_columns])

# Now, we are tuning the model
svm_model1_tuned <- tune(svm, Species~., data = my_train_data, kernel = "linear", 
                         ranges = list(cost = c(.0001, .001,.01,.1,1,10,100,1000)))

# tune will identify which will be the best cost value

# it is telling that best cost will be .0001
summary(svm_model1_tuned)

# Now, applying the svm and giving a formula to create the svm model
# Best cost value is 0.1 after tuning as well

my_svm_model2 <- svm(data = my_train_data, Species~.,kernel = "linear", cost = 0.1, scale = FALSE)

class(my_svm_model2)

# Telling that 52 support vectors have been found....
print(my_svm_model2)

# Plotting the svm model
# Kind of plotting the model on the train data
plot(my_svm_model2, my_train_data[,my_columns])

# Now, predicting the data
my_prediction <- predict(my_svm_model2,my_test_data[,my_columns], type = "class")

plot(my_prediction)

# plotting a table against prediction and actual
table(my_prediction, my_test_data[,3])

summary(table(my_prediction, my_test_data[,3]))

# Getting the accuracy 
mean(my_prediction == my_test_data[,3])
