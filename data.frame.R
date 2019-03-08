#Data frame..
mtcars
class(mtcars)

attributes(mtcars)

#we are creating data frame...
num1 <- c(4,5,6,7,2,5)
char1 <- c("vini","kashish","jyoti","shivi","namo","alok")
num2 <- c(TRUE,FALSE,TRUE,TRUE,FALSE,FALSE)

data_fram1 <- data.frame(num1, char1, num2)
class(data_fram1)
View(data_fram1)

mtcars$disp
mtcars$mpg
mtcars$cyl

data_fram1$char1

my_factor <- as.factor(mtcars$cyl)
my_factor

levels(my_factor)

#correalation matrix 
corr1 <- cor(mtcars)
corr1

class(corr1)

##corrplot...
corrplot(corr1)

##order is hclust and draw rectangle....
corrplot(corr1, order = "hclust")
corrplot(corr1, order = "hclust", addrect = 2)
corrplot(corr1, order = "hclust", addrect = 3, rect.col = "red")
corrplot(corr1, order = "hclust", addrect = 4, rect.col = "blue")
corrplot(corr1, order = "hclust", hclust.method = "ward.D2", addrect = 4)

data(mtcars)
M <- cor(mtcars)
set.seed(0)

##white-black print only.....
wb <- c("white", "black")
corrplot(M, col = wb, bg = "gold2",  order = "AOE", cl.pos = "n")

##circle + ecilpse...
corrplot(M, order = "AOE", type = "upper", tl.pos = "d")
corrplot(M, add = TRUE, type = "lower", method = "ellipse", order = "AOE",
         diag = FALSE, tl.pos = "n", cl.pos = "n")

##circle + square...
corrplot(M, add = TRUE, type = "lower", method = "square", order = "AOE",
         diag = FALSE, tl.pos = "n", cl.pos = "n")

##circle + colourfull numbers...
corrplot(M, add = TRUE, type = "lower", method = "number", order = "AOE",
         diag = FALSE, tl.pos = "n", cl.pos = "n")

##circle + black numbers...
corrplot(M, add = TRUE, type = "lower", method = "number", order = "AOE",
         col = "black", diag = FALSE, tl.pos = "n", cl.pos = "n")

##visualise a matrix in [0,1]...
corrplot(abs(M), order = "AOE", cl.lim = c(0,1))

##visualise a matrix in [-100,100]...
ran <- round(matrix(runif(225, -100,100), 15))
corrplot(ran, is.corr = FALSE)
corrplot(ran, is.corr = FALSE, cl.lim = c(-100, 100))

corrplot(M, order = "AOE", tl.srt = 45)

##the input matrix is not square...
corrplot(M[1:8,])
corrplot(M[,1:8])

corrplot(M, low = res1$lowCI, upp = res1$uppCI,
         col = c("white", "black"), bg = "gold2", order = "AOE",
         plotCI = "square", addg = NULL, cl.pos = "n")
