library(corrplot)

mtcars

data(mtcars)

M <- cor(mtcars)

#correlation plot------------------
corrplot(M)

#kmeans----------------
kmeans(mtcars,3)

newmtcars <- mtcars[c('cyl','hp','disp','wt')]

newmtcars1 <- mtcars[c('hp','disp','wt')]

#kmeans------------------------
newmtcars2 <- kmeans(newmtcars1,3)

attributes(newmtcars2)

#plot before kmeans--------------------
ggplot(newmtcars,aes(wt,hp,col = as.factor(cyl)))+geom_point()

#plot after kmeans----------------
ggplot(newmtcars,aes(wt,hp,col = as.factor(newmtcars2$cluster)))+geom_point()

#confusio matrix-----------------------
table(as.factor(newmtcars$cyl),newmtcars2$cluster)
