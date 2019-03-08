vec8 <- c(2,3,4,1,5,30,32,41,21,26,55,67,8,9,2,3)
length(vec)

matrix1 <- matrix(vec8,nrow = 4, ncol = 4)
matrix1
 
index1 <- matrix1[3,2]
index1

#Dimension
dim(matrix1)

vec9 <- c(5,6,7,4,32,56,78,54,3,2,9,10,8,7,92,4)
length(vec9)

matrix2 <- matrix(vec9,nrow = 4, ncol = 4)
matrix2

result8 <- matrix1 + matrix2
result8

result9 <- matrix1 - matrix2
result9

result10 <- matrix1 %% matrix2
result10

result_1 <- matrix1 %*% matrix2
result_1

ans <- matrix1 / matrix2
ans

answer <- matrix2 / matrix1
answer

#tignometry
sin(45) + sin(30)

sin(30) + cos(30)

cos(30) * tan(30)

cospi(30)

sinpi(30)

tan(45)

tan(45) / cos(45)

vec_1 <- c(sin(45),cos(45),tan(45),cospi(45))
vec_1

matrix3 <- matrix(vec_1,nrow = 2,ncol = 2)
matrix3

#matrix
vec_2 <- c(2,3,4,5,6,7)
length(vec_2)

matrix4 <- matrix(vec_2,nrow = 3,ncol = 2)
matrix4

vec_3 <- c(6,7,8,2,8,9)
length(vec_3)

matrix5 <- matrix(vec_3,nrow = 2,ncol = 3)
matrix5

#this is matrix multiplication
ans1 <- matrix4 %*% matrix5
ans1

#this will give error bcoz this is scalar multiplication...
ans2 <- matrix4 * matrix5 

#By this we give the name to each row and column....
rownames(ans1) <- c("R1","R2","R3")
colnames(ans1) <- c("C1","C2","C3")

ans1

#now we can run by there name...
ans1["R2","C1"]

vec10 <- c(1,2,3,6,5,9,8,7,10)
length(vec10)

matrix_1 <- matrix(vec10,nrow = 3,ncol = 3,dimnames = list(c("r1","r2","r3"),
                                                           c("c1","c2","c3")))
matrix_1

t(matrix_1)

determinant(matrix_1)

diag(matrix_1)

solve(matrix_1)

plot(vec10)

plot(vec10,xlab = "xmagnitude",ylab = "myindex",main = "my first scater plot",
     col = "green")

barplot(vec10)

max(vec10)

barplot(vec10,ylim = c(0,15))

v1 <-sample(100,10,replac = TRUE)
v1 

v2 <- sample(4,10,replace= TRUE)
v2

v2
barplot(v1,ylim = c(0,100),col = "blue",border = "yellow")
?barplot

my_name <- as.character(v1)
barplot(v1,ylim = c(0,100),col = "blue",border = "yellow",names.arg = my_name)

my_x <- sample(100,10)
my_y <- sample(100,10)
plot(my_x,my_y)

#by this we can make different type of graph....
?plot
plot(my_x,my_y,type = "l")

#by this we can make shair type graph... 
plot(my_x,type = "s",col="blue")

plot(my_x,type = "c",main = "Plot graph",xlab = "xaxis",ylab = "yaxis",
     col = "purple")

#simple quantiles
plot(x<- sort(rnorm(47)),type ="s",main ="plot(x, type =\"s\")")
plot(x,cex = .5,col = "dark red")

#distributed plot:
plot(table(rpois(100,5)), type ="h", col = "red", lwd = 10,main = "rpois(100,lambda =5)")

plot(sin,-pi,2*pi)

