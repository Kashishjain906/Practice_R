######################################################
library(ggplot2)
data("Cars93")


table1<-table(Cars93$airbags)

mychitest<-chisq.test(table1)


car.data <- data.frame(Cars93$AirBags, Cars93$Type)

car.data = table(Cars93$AirBags, Cars93$Type) 

chisq.test(car.data)

########################################################

library(ggplot2)
data("diamonds")

mytable <- data.frame(diamonds$price,diamonds$clarity)

mytable <- table(diamonds$price, diamonds$clarity)

chisq.test(mytable)

#########################################################

data("mtcars")

mytable1 <- table(mtcars$hp,mtcars$wt)

chisq.test(mytable1)

##########################################################