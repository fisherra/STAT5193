rm(list = ls())
###########################################
# Day 8: Data Management II
# Reading:5.1 - 5.3 
# https://cran.r-project.org/doc/contrib/Short-refcard.pdf                     
# Objectives:
#  1. Numerical functions
#  2. Character functions                           			
#  3. Apply functions
###########################################
# 
########################### 
# Motivating Data
###########################
Student <- c("John Davis", "Angela Williams", "Bullwinkle Moose",
               "David Jones", "Janice Markhammer", "Cheryl Cushing",
               "Reuven Ytzrhak", "Greg Knox", "Joel England",
               "Mary Rayburn")
Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)
roster <- data.frame(Student, Math, Science, English,
                       stringsAsFactors=FALSE)
roster 
#
#
########################### 
# Numerical Functions
###########################
#
# Notes: 
#  - See https://cran.r-project.org/doc/contrib/Short-refcard.pdf
#  - Mathematical functions: abs,sqrt,ceiling, floor, trunc, round, signif
#    cos, sin, tan, log, exp
#  - Statistical functions: mean, median, sd, mad, quantile, range, sum, 
#    min, max, scale
#  - Probability functions: (quantile,probability, random number, density) 
#    dnorm,rnorm,qnorm,pnorm,
#    dbinom,rbinom,pbinom,qbinom, 
#    rf,df,pf,qf, 
#    rt,dt,pt,qt, 
#    runif,dunif,punif,qunif... (see url) 
#  
# Example: see url above for more.  Just try them out and read help file.
args(pt)
help(pt)
args(rbinom)
help(rbinom)
args(dnorm)
help(dnorm)

options(digits=2)	
runif(10)
runif(10)
set.seed(1)
runif(10)
set.seed(1)
runif(10)
help(curve)
curve(dunif(x), xlim = c(-.1,1.1), lwd =3, ylab = "",
 main="Uniform distribution")
curve(punif(x), lwd = 3, lty =2, col =2, add = T)
legend(x="topleft", legend = c("density", "CDF"), 
 lty = c(1,2), col = c(1,2),lwd=3, inset = 0.2) 

punif(.7)
dunif(.7)
punif(-.2)
dunif(1.2)

curve(dt(x, df = 10), main = "Students T denisty with 10 df", 
	xlim = c(-4,4), ylab = "density", xlab = "t", xaxt="n")
qt(c(.025,.975),10)
pt(-2.2,10)
axis(side =1, cex =2, at=qt(c(.025,.975), df =10), 
  labels = c(expression(t[.025]),expression(t[.975])))
t.data<-rt(1000,10)
hist(t.data, probability=T)
curve(dt(x, df = 10), main = "Students T denisty with 10 df", 
	xlim = c(-4,4), ylab = "density", xlab = "t", xaxt="n", add= T)
mean(t.data<2.228)
pt(2.228,df=10)

plot(pbinom(0:20, size =20, p=.5), type = "s", 
 main="CDF of binomial", sub="n=20, p=0.5", ylab="F(x)",xlab="x")

library(MASS)
help(mvrnorm)
mu<-rep(0,3)
Sigma<-matrix(c(1,.8,-.5,.8,1,0,-.5,0,1),nrow=3)
Sigma
mvn.data<-mvrnorm(10000,mu = mu, Sigma=Sigma)
plot(mvn.data)
plot(data.frame(mvn.data), pch = ".")


# The beauty of randomization 
plot(NULL,xlim = c(-3,3), ylim = c(-3,3), xlab = "", ylab = "",
main = "I'm an Artist?", xaxt="n", yaxt="n")
# Rerun the code below 
col<-sample(1:50,4)
mu<-rnorm(2)
rho<-2*(rbeta(1,.5,.5) - .5)
Sigma<-matrix(c(1,rho,rho,1),2)
n<-rpois(1,lambda=1000)
x<-mvrnorm(n,mu,Sigma)
points(x,xlab="",ylab="",cex = runif(1,.5,3),col=col, xlim = c(-5,5),ylim = c(-5,5))

########################### 
# Character Functions
###########################
#
# Notes: 
# - Character functions manipulate characters/texts
# - Main functions are
#  nchar, sustr, grep, sub, strsplit, paste, toupper, tolower, cat	
# - strsplit and paste are most common 
x<-"I am Josh Habiger"
help(strsplit)
strsplit(x, split = " ")
First<-strsplit(x, split = " ")[[1]][3]
Last<-strsplit(x,split=" ")[[1]][4]
First
Last
paste(First,Last)
strsplit(x, split = "ig")


########################### 
# Apply functions 
###########################
#
# Notes:
# - apply() is apply functions to rows,columns, etc.
# - see also by() and help files for other functions
# Psuedo Code:
#  apply(my.data, margin, my.function)
#
#
# Example:
apply(roster[-1],2,mean)
apply(roster[-1],2, mean, trim = .2)
sums<-apply(roster[-1],1,sum)
cbind(roster[1], sums)


########################### 
# Revisiting Example 
###########################

roster 

# Goals
# 1. Combine scores to get a single score for each student
# 2. Assigne a letter grade using a Bell Curve
# 3. Sort Alphabetically
#

# 1. 
# Observe scores aren't on same scale
# 
Math
scale(Math)
(Math - mean(Math))/sd(Math)

z <- scale(roster[,2:4])
z		
score <- apply(z, 1, mean)		
score
roster <- cbind(roster, score)
roster	

# 2. 
y <- quantile(score, c(.8,.6,.4,.2))
y		
roster$grade[score >= y[1]] <- "A"		
roster

roster$grade[score < y[1] & score >= y[2]] <- "B"		
roster$grade[score < y[2] & score >= y[3]] <- "C"		
roster$grade[score < y[3] & score >= y[4]] <- "D"		
roster$grade[score < y[4]] <- "F"		
roster

# 3. 
name <- strsplit((roster$Student), " ")
name

# Wierd trick: '[' is a function
'['(c(5,10),1)
'['(c(5,10),2)

sapply(name, "[",2)
Lastname <- sapply(name, '[', 2)		
Firstname <- sapply(name, '[', 1)		

roster <- cbind(Firstname,Lastname, roster[,-1])		
roster <- roster[order(Lastname,Firstname),]
roster
