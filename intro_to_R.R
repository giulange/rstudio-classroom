x <- 1

print(x)

x

msg <- 'hello'
msg2 = "hello"

# this is a comment and R doesn't evaluate what is written after an hashtag


x <-  ## Incomplete expression

  
x <- 5  ## nothing printed

x       ## auto-printing occurs

print(x)  ## explicit printing

x <- 11:30
x
# subsetting:
x[1]
x[3]
# ...

# R has five basic or “atomic” classes of objects:
#   
#   character
# 
#   numeric (real numbers)
# 
#   integer
# 
#   complex
# 
#   logical (True/False)


## how to create vectors
x <- c(0.5, 0.6)       ## numeric
x <- c(TRUE, FALSE)    ## logical
x <- c(T, F)           ## logical
x <- c("a", "b", "c")  ## character
x <- 9:29              ## integer


## the vector function
x <- vector("numeric", length = 10) 
y <- vector("numeric", 10) 
z <- vector(10,"numeric") 
t <- vector(length=10,mode="numeric")
x

## Mixing objects
y <- c(1.7, "A")   ## character
y <- c(TRUE, 2)    ## numeric
y <- c("a", TRUE)  ## character

## Explicit coercion:
x <- 0:6
class(x)
# [1] "integer"
as.numeric(x)
# [1] 0 1 2 3 4 5 6
as.logical(x)
# [1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
as.character(x)
# [1] "0" "1" "2" "3" "4" "5" "6"

## NA coercion
x <- c("a", "b", "c")
as.numeric(x)
# Warning: NAs introduced by coercion
# [1] NA NA NA
as.logical(x)
# [1] NA NA NA
as.complex(x)
# Warning: NAs introduced by coercion
# [1] NA NA NA

## Matrices
m <- matrix(nrow = 2, ncol = 3) 
m
# [,1] [,2] [,3]
# [1,]   NA   NA   NA
# [2,]   NA   NA   NA

dim(m)
# [1] 2 3

attributes(m)
# $dim
# [1] 2 3

m <- matrix(1:6, nrow = 2, ncol = 3) 
m
# [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

## creating a matrix inderectly:
m <- 1:10 
m
# [1]  1  2  3  4  5  6  7  8  9 10

dim(m) <- c(2, 5)
m
# [,1] [,2] [,3] [,4] [,5]
# [1,]    1    3    5    7    9
# [2,]    2    4    6    8   10

## rbind , cbind
x <- 1:3
y <- 10:12

cbind(x, y)
# x  y
# [1,] 1 10
# [2,] 2 11
# [3,] 3 12

rbind(x, y) 
# [,1] [,2] [,3]
# x    1    2    3
# y   10   11   12

## LISTs
x <- list(1, "a", TRUE, 1 + 4i) 
x
# [[1]]
# [1] 1
# 
# [[2]]
# [1] "a"
# 
# [[3]]
# [1] TRUE
# 
# [[4]]
# [1] 1+4i

# the same can be produced with
x <- vector("list", length = 5)

## DATA FRAME
x <- data.frame(foo = 1:4, bar = c(T, T, F, F)) 
x

L3 <- LETTERS[1:3]
fac <- sample(L3, 10, replace = TRUE)
d <- data.frame(x = 1, y = 1:10, fac = fac)
d

## NAMES
x <- 1:3

names(x)
# NULL

names(x) <- c("New York", "Seattle", "Los Angeles") 
x
# New York     Seattle Los Angeles 
# 1           2           3 

names(x)
# [1] "New York"    "Seattle"     "Los Angeles"

# when a label is made by two words, we use (double) quotes to delimit the label:
x <- list("Los Angeles" = 1, Boston = 2, London = 3) 

## dimension names:
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d")) 
m
# c d
# a 1 3
# b 2 4

colnames(m) <- c("h", "f")
rownames(m) <- c("x", "z")
m
# h f
# x 1 3
# z 2 4

## READ TABLE
Tmean <- read.table("XY_Tmean.csv")
Tmean <- read.table("XY_Tmean.csv",sep=",")
Tmean <- read.table("XY_Tmean.csv",sep=",",header = TRUE)
# or you can use
XY_Tmean <- read.csv("~/work/Didattica/XY_Tmean.csv")

head(Tmean)
summary(Tmean)

# subsetting
Profile2[1,1] # single element
Profile2[ ,1] # column
Profile2[1, ] # row
Profile2[3:6,1:4] # range
Profile2[c(1,3,5,10),1:4] # list


sapply(Tmean, mean)
sapply(Tmean, min)
sapply(Tmean, max)
sapply(Tmean, quantile)
sapply(Tmean, median)

# apply a condition to a variable, e.g. clay content above a specified threshold:
library(readr)
Profile2 <- read_table2("Profile2.txt")
View(Profile2)

clay = Profile2$clay

clay > 25

# what about a selected soil profile?
Profile2$SOIL_PROFILE == '052P6'

Profile2[6,]

plot(Profile2$X_Coord,Profile2$Y_Coord)
plot(Profile2$X_Coord,Profile2$Y_Coord,type='p')
plot(Profile2$X_Coord,Profile2$Y_Coord,type='p',lwd=2)
plot(Profile2$X_Coord,Profile2$Y_Coord,type='p',lwd=2,col='red')
plot(Profile2$X_Coord,Profile2$Y_Coord,type='p',lwd=2,col='red',pch=19)
plot(Profile2$X_Coord,Profile2$Y_Coord,type='p',lwd=2,col='red',pch=25)

?plot    # generic function for plotting R objects
?points  # draw a sequence of points
?pch     # point character

## NA values
x <- c(1, 2, NA, 4, NA, 5)

bad <- is.na(x)
print(bad)
# [1] FALSE FALSE  TRUE FALSE  TRUE FALSE

x[!bad]
# [1] 1 2 4 5

# let remove a value using NA and then interpolate the missing value:
clay = Profile2$clay
mean(clay)

my_na = clay[82]
clay[82] <- NA

mean(clay)
mean(clay,na.rm=TRUE)

# interpolate the missing value, by means of the average value od clay in that study area:
clay[82] <- mean(clay,na.rm=TRUE)
clay[82]


