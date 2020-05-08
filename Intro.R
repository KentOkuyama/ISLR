# c() for concatenate
x = c(1,3,2,5)
x

x = c(1,6,2)
x
y = c(1,4,3)

length(x)
length(y)
x+y

# ls() lists all the objects 
# i.e. data and functions
ls()
# rm() delete
rm(x,y)
ls()

# remove all objects at once
"""
rm(list=ls())
"""

#?matrix

"""
matrix(data = NA, nrow = 1, ncol =1, byrow = FALSE,
dimnames = NULL)
"""

x=matrix(data=c(1,2,3,4), nrow=2, ncol=2)
x
x=matrix(c(1,2,3,4),2,2)
# omit data, nrow, ncol 
matrix(c(1,2,3,4),2,2,byrow=TRUE)

sqrt(x)
x^2

# rnorm() creates variables with mean 0 and std 1
# f(x) = 1/(√(2 π) σ) e^-((x - μ)^2/(2 σ^2))
#?rnorm()
x=rnorm(50)
y=x+rnorm(50,mean=50,sd=.1)
cor(x,y)

# reproduce the same rand numbers
#?set.seed()
set.seed(1303)
rnorm(50)

set.seed(3)
y=rnorm(100)
mean(y)
var(y)
sqrt(var(y))
sd(y)


#?plot
x=rnorm(100)
y=rnorm(100)
plot(x,y)
plot(x,y,xlab="this is the x-axis",ylab="this is the y-axis",
              main="Plot of X vs Y")

pdf("Figure.pdf")
# jpeg() function also possible
plot(x,y,col="green")
# dev.off() indicates done creating the plot
# also possible to copy the plot window and paste
dev.off()

x=seq(1,10)
x
x=1:10
x
x=seq(-pi,pi,length=50)


#?contour()
y=x
f=outer(x,y,function(x,y)cos(y)/(1+x^2))
contour(x,y,f)
contour(x,y,f,nlevels=45,add=T)
fa=(f-t(f))/2
contour(x,y,fa,nlevels=15)

# image() ka heatmap
image(x,y,fa)
# persp() theta and phi control the angles
?persp()
persp(x,y,fa)
persp(y,y,fa,theta=30)
persp(y,y,fa,theta=30,phi=20)
persp(y,y,fa,theta=30,phi=70)
persp(y,y,fa,theta=30,phi=40)

A=matrix(1:16,4,4)
A
A[2,3]

A[c(1,3),c(2,4)]
A[1:3,2:4]
A[1:2,]
A[,1:2]
A[1,]
A[-c(1,3),]  
A[-c(1,3),-c(1,3,4)]
# dim() num of rows, num of columns
dim(A)

library(ISLR)
# read.table() imports data 
# write.table() exports data

# row data can be found here
# http://faculty.marshall.usc.edu/gareth-james/ISL/data.html
Auto=read.table("Auto.data")
# view it in a spreadsheet like window
fix(Auto)

Auto=read.table("Auto.data",header=T,na.strings="?")
fix(Auto)

Auto=read.csv("Auto.csv",header=T,na.strings="?")
fix(Auto)
dim(Auto)
Auto[1:4,]

Auto=na.omit(Auto)
dim(Auto)

# check variable names
names(Auto)

# gives error
plot(cylinders, mpg)

plot(Auto$cylinders, Auto$mpg)
attach(Auto)
plot(cylinders, mpg)

# as.factor converts quantitative variables 
# into qualitative variables
cylinders=as.factor(cylinders)

# boxplot will be produced if x-variable is plotted
?boxplot()
plot(cylinders, mpg)
plot(cylinders, mpg, col="red")
# if varwidth is TRUE, the boxes are drawn with widths 
# proportional to the sqrt of the num of observations in the groups
plot(cylinders, mpg, col="red", varwidth=T)
plot(cylinders, mpg, col="red", varwidth=T, horizontal=T)
plot(cylinders, mpg, col="red", varwidth=T, xlab="cylinders",
     ylab="MPG")

hist(mpg)
# col=2 is the same as col="red"
hist(mpg,col=2)
hist(mpg,col=2,breaks=15)

?pairs()
pairs(Auto)
pairs(~ mpg + displacement + horsepower + weight +
        acceleration, Auto)

plot(horsepower,mpg)
# identify() provides a usefuli nteractive method
# for identifying the value for a particular variable 
# for points on a plot
identify(horsepower, mpg, name)

# for qualitative variables, 
# R will list the num of observations
# that fall in each category
summary(Auto)
summary(mpg)

# savehistory()
# loadhistory()