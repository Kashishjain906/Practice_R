num1<-32
num1
class(num1)

num2<-45

result1<-num1+num2
print(result1)

num3 <-4.2
class(num3)

num4 <- as.integer(43)

var1 <- "HELLO"
class(var1)

logic1 <- TRUE
class(logic1)

num1 ^ 2
num1 /3
num1 %% 2
floor(num1/3)
round(num1/3)

string2 <- as.character(num1)
string2
ls()
length(string2)

vec1<-c(3,4,2,5,6,7,8)
vec1
length(vec1)
vec1 ^2
vec1 + 4
vec1 /3
vec1 %% 6

log1 <- log2(2)
log1

log2 <- log10(40)
log2

log1 + log2

vec2 <- c(4,5,6,7,8,20,7)
vec2
length(vec2)

result3 <- vec1 + vec2
print(result3)

result4 <- vec1 %% vec2
result4

var3 <- sqrt(44)
var3

var4 <- sqrt(16)
var4

result5 <- sqrt(var3) + sqrt(var4)
result5

var5 <- factorial(5)
var5

vec5 <- c(4,5,6,7,8,90,1,2,8)
vec5
length(vec5)

#longer ogject length is not a multiple of shorter object length
result6 <- vec1 + vec5 
result6


vec6 <- c(2,3,4,5,6,7,8,9,21,34,50,7)
vec6

vec7 <- c(5,6,7,8)
vec7

result7 <- vec6 + vec7
result7

length(vec6)

plot(vec6)

sample(10)

#By set.seed we can generate fix ramdom number....
set.seed(5) 
sample(10)
sample(10)

set.seed(5)
sample(10)

