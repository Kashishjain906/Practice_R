iris

#tells the min, max,mean, median, 1&3 qu.....
summary(iris)

#tell the datatype of data frame...
str(iris)

#by this,species is removed(or null)....
myiris$Species<- NULL

str(iris)

#by this,kmeans is done...
myiris<-kmeans(iris,3)
attributes(myiris)
class(myiris)
myiris$centers
myiris$cluster
myiris$size

ggplot(iris,aes(Sepal.Length,Petal.Length,col = Species))+geom_point()

ggplot(iris,aes(Sepal.Length,Petal.Length,col =myiris$cluster ))+geom_point()
