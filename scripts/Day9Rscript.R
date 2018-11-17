rm(list = ls())
###########################################
# Day 9: Loops, Conditionals, Functions
# Reading: 5.4 - 5.5                      
# Objectives:
# 1. Loops 
# 2. Conditionals                          			
# 3. Functions
###########################################
# 
########################### 
# Loops
###########################
# Notes
# - Loops allow you to run the same code repeatedly without retyping it
# - The main functions are the for and while
# - Make good use of tabs / spacing to keep your script organized 
# - Don't forget the logical in the while loop
#
# Pseudo Code:
# for(value in sequence)
#  {
#  some code here
#  }
#
# while(logical ==  TRUE)
#  {
#  some code here
#  }
#
# Simple Example

for(i in 1:10)
 {
 print(paste("This is line: ", i))
 }

i<-1
while(i<10)
	{
	print(paste("This is line: ", i))
	i<-i+1
	}

i<-0
while(i<10)
	{i<-i+1
	print(paste("This is line: ", i))
	}

# Random Walk Example:
# Here's the idea
x<-0
x<-c(x,rnorm(1, mean =x[1]))
x
x<-c(x, rnorm(1, mean = x[2]))
x
x<-c(x, rnorm(1, mean = x[3]))
x
#
# Using a loop
x<-0
plot(x, xlim = c(1,500), ylim = c(-30,30), 
xlab="t", ylab = expression(x[t]), main = "Random Walk: Length 500") 
abline(h=0)
for(i in 1:500)
	{
	x<-c(x, rnorm(1, mean = x[i]))
	points(x,type = "l") 
	}
x
# Random Walk Stopping Time
x<- -10
plot(x, ylim = c(-10,3), xlab="t", ylab = expression(x[t]),
main = "Random Walk: Random Stopping Time") 
abline(h= 0, lty = 3, col=3)
set.seed(2)
while(max(x)<0)
 {
 x<-c(x, rnorm(1, mean = x[length(x)]))
 plot(x, type = "l",xlab="t",ylab = expression(x[t]),
 main = "Random Walk: Random Stopping Time")
 abline(h = 0)
 }

########################### 
# Conditionals
###########################
# Notes
# - They allow you to only run code if a condition is true
# - The main functions are if, ifelse
# - ifelse() is good for vectors
# - Make good use of tabs / spacing to keep your script organized 
#
# Pseudo Code:
# if(cond)
#  {
#  execute line 1 of code
#  exectue line 2 of code
#  ...
#  }else  
#  {
#  execute line 1 of code
#  execute line 2 of code
#  }
#
# ifelse(cond, 
#  execute line 1 of code
#  exectue line 2 of code,
#  execute line 1 of code
#  execute line 2 of code)
#
# Example
x<-6
if(x<5)
 {
 print("X is less than 5")
 print("The condition is true")
 }else
 {
 print("X is not less than 5")
 print("The conditions is false")
 }
x<-3
if(x<5)
 {
 print("X is less than 5")
 print("The condition is true")
 }else
 {
 print("X is greater than or equal to 5")
 print("The conditions is false")
 }
x<-1:10
y<-ifelse(x<5, y<-"small", y<-"large")

load("H:\\WINDOWS\\SAS and R\\R\\Day 8\\.RData")
attach(roster)

if(is.character(grade)) {grade <- as.factor(grade)}

if(!is.factor(grade))
	{
	grade <- as.factor(grade)
	}else
	{ 
	print("Grade already is a factor")
	}

ifelse(score>0.5, print("Passed"), print("Failed"))
outcome<-ifelse(score>0.5, print("Passed"), print("Failed"))
outcome
# Note that each potential execution of code is printed, then
# the code is executed for each element of the vector.
#
########################### 
# functions
###########################
# Notes
# - You can create your own custom functions 
# - Objects created in your function aren't saved to your workspace
# - Make good use of spacing / tabs
# - Remark: A package is really just a collection of functions and data.  
# - You don't have to set a default value for parameters
#
# Pseudo Code
#  my.function<-function(parameter1 = default.value1, parameter2,...)
#  {
#  some code here
#  some code here
#  return(my.output)
#  }
# my.function(parameter1 = value1, parameter2=value2)
#
# Example
#
get.ci<-function(my.data, plot.it=T, alpha = 0.05){
 if(plot.it==T)
  {
  par(mfrow = c(2,1))
  boxplot(my.data)
  qqnorm(my.data)
  qqline(my.data)
  }
 xbar<-mean(my.data)
 n<-length(my.data)
 df<-n-1
 MOE<-qt(alpha/2, df = df, lower.tail=FALSE)*sd(my.data)/sqrt(n)
 lower<-xbar - MOE
 upper<-xbar + MOE
 Interval<-c(lower = lower, upper = upper)
 return(Interval=Interval)
}

x<-rexp(25)
get.ci(my.data=x,plot.it=F)
get.ci(x,alpha=.2, plot.it=T)
my.data
plot.it
MOE
	
	
	 

