rm(list = ls())
################################################
# Day 1: Getting familiar with R
# Reading: 1.1 - 1.4, 1.6, 1.8 
# Objectives:
#	1. Understand the R language
#	2. Running and Saving R scripts and workpaces
#################################################
#
#
################################ 
# Interacting with R #####
################################
# Notes
# - you can write code/scripts in the R editor.  Open it via file/new script
# - a line of code is run from the R console by hitting return or ctrl R from the R editor 
# - the `#' tells R to ignore this line of code
# - data/objects are analyzed by applying functions to them
# - output generated with a function can be printed
# - output is saved as an object using `<-' or '=' 
# - type the name of an object to view it 
# - R is case sensative 
# 	
# Psuedo Code
#  my.output <- function1(my.object)
#  my.output
#  my.processed.output <- function2(my.output)
#  my.processed.output     
#
# Example: Age and weights of babies are below
#
# Q: What are the functions and objects below? 
5+3
x<-5+3
x
y<-x*2
y

c(1,3,5,2,11,9,3,12,3)
age<-c(1,3,5,2,11,9,3,9,12,3)
age
weight<-c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)
weight
mean(age)
sd(age)  

# Q: Which objects below are saved?  

xbar<-mean(age)
mean(weight)
sdev<-sd(age)
n<-length(age)

age.ci<- c(xbar - 1.96*sdev/sqrt(n), xbar+1.96*sdev/sqrt(n))
age.ci
plot(age,weight)

################################ 
# Getting help with R 
################################
# Notes:
# - A lot of help is available in the help files, vignettes, and url
# - The first step in learning to use a function is ALWAYS to read its help file
# - There is a lot general help at https://www.r-project.org/ too
#		  
# 	
# Psuedo Code:
#  help(object)
#	
# Q: What is the input and output for the mean function? 
# Q: What does the trim option do? 
help(mean)
example(mean)
mean(weight, trim = .25)
mean(weight)

# Q: What type of object is the co2 data below?
# R: We'll learn more about classes of objects later.
data()
help(CO2)
plot(CO2)

# R: Some more examples of using functions for graphics.
demo(graphics)


######################## 
# R workspace 
########################
# Notes:
# - The workspace refers to your R environment with all of your saved objects
# - Save your scripts, workspace, and keep your workspaces organized
# - You can do all of this from the file menu or by running code below
# - History vs. workspace: History is just the history of commands ran
#   while the workspace is a list of your created objects	  
# 
# Pseudo Code
#  rm(objectlist)
#  ls()
#  setwd()
#  getwd()
#  options() 
#  history(n)  

getwd()
setwd("H:\\WINDOWS\\SAS and R\\R\\Day 1")
save.image("H:\\WINDOWS\\SAS and R\\R\\Day 1\\DirtyWorkspace.RData")
ls()
rm(age, age.ci)
ls()
rm(list = ls())
ls()
save.image("H:\\WINDOWS\\SAS and R\\R\\Day 1\\EmptyWorkspace.RData")
load("H:\\WINDOWS\\SAS and R\\R\\Day 1\\DirtyWorkspace.RData")
ls()
load("H:\\WINDOWS\\SAS and R\\R\\Day 1\\EmptyWorkspace.RData")
ls()
history(5)
#R: Loading a workspace just adds objects to existing objects


######################### 
# Input and Output
#########################
# Notes:
# - You can call and run scripts using source()
# - You can generate .pdfs,.png,... using pdf(), png() or from the file menu
#  - have to run dev.off() to generate the plot / stop writing
#
# 
# Pseudo Code:
#  source("my.RScript.R") 
#
#  pdf("myplot.pdf")
#  plot()
#  dev.off()
#
# Example:

source("Day1Script2.R")
source("Day1Script2.R", print.eval=T)

pdf("Day1Plots.pdf")
plot(co2)
abline(h = mean(co2))
dev.off()


######################### 
# Packages
#########################
# Notes:
# - You are currently using the "Base package" of basic functions
# - Many others are already installed and just need loaded
# - More advanced packages can be installed then loaded 
#  - 1. Go to packages/install packages
#  - 2. Then Load package
# - See https://cran.r-project.org/web/packages/available_packages_by_date.html
# 
#
# Pseduo code
#  - Go to the packages menu, find a package, and click load
#  - Go to the install packages and install it.  Then go back to step 1.
#
# Examples
#
#  
library(MASS)
help(package = "MASS")
citation(package ="MASS")

# Install the A3 package
install.packages("A3")
library(A3)




	 

