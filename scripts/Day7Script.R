rm(list = ls())
###########################################
# Day 7: Data Management
# Reading:4.1 - 4.7                      
# Objectives:
#	1. Creating New Variables
#	2. Recoding Variables                           			
#	3. Renaming Variables
#	4. Missing Values						
#	5. Type Conversion
#	6. Sorting
#	7. Merging
#	8. Subsetting						
###########################################
# 
#
########################### 
# Working Example
########################### 
#
# 5 managers were asked if they agree on 5 questions
#	- 1 = stongrly disagree agree and 5 = strongly agree
# - other variables are gender, country, date, age.

manager <- c(1, 2, 3, 4, 5)
date <- c("10/24/08", "10/28/08", "10/1/08", "10/12/08", "5/1/09")
country <- c("US", "US", "UK", "UK", "UK")
gender <- c("M", "F", "F", "M", "F")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)
leadership <- data.frame(manager, date, country, gender, age,
                         q1, q2, q3, q4, q5)

###########################
# Creating variables
###########################
#
# Notes
# - You'll want to create or transform a variable first
# - Then add it to you existing data
# - be careful with attach and detach
#	- you can't detach an altered data frame
#
# Psuedo code
#
#	new.variable<-f(my.data$variable1,my.data$variable2,..)
#	my.data<-data.frame(mydata,new.variable)
#
# Example: qbar12 is the average of questions 1 and 2
str(leadership)
qbar12<-(leadership$q1 +leadership$q2)/2
leadership<-data.frame(leadership, qbar12)
leadership
leadership<-leadership[-11]
leadership

###########################
# Recoding / discretizing variables 
###########################
#
# Notes
# - You'll need to use logical operators 
#	- <, <=,>,>=,==,!=,!x, x|y, x&y
# Psuedo code
#  	my.data$variable[condition]<-new.value
#     my.data$new.variable[condtion]<-new.value
#	
#
#
# Example 1: Chaning age = 99 to NA
indicator<-leadership$age==99
indicator
leadership$age[indicator]<-NA
leadership$age[indicator]<-99
leadership$age[leadership$age==99]<-NA

# Creating a new age cateogry variable
leadership$agecat[leadership$age  > 75]   <- "Elder"
leadership$agecat[leadership$age >= 55 & leadership$age <= 75]   <- "Meh"
leadership$agecat[leadership$age  < 55]   <- "Young"
leadership

###########################
# Renaming Variables
###########################
#
# Notes
# - You can use fix() or use names() to rename variables
# - see also rownames() and colnames()
# names(my.data)[i]<-"new name"
# 
# Psuedo code
#	names(my.data)[i]<-"new variable name"
# fix(my.data)
#
# Example:
fix(leadership)
names(leadership)
names(leadership)[2]<-"TestDate"
colnames(leadership)


###########################
# Missing Values
###########################
#
# Notes
# - Some funnctions get confused by NA (many don't though)
# - IF(big if here) you want to remove data with missing values you can
#
# Psuedo code
# is.na(my.data)
# new.data<-na.omit(old.data) 
#
# Example:
leadership
is.na(leadership)
newdata<-na.omit(leadership)
newdata

###########################
# Type Conversion
###########################
#
# Notes
# - The following types of data can be converted
#	- numeric, character, vector, matrix, data.frame, factor, logical
# Psuedo code
#	is.type(variable)
#	new.variable<-as.type(old.variable)	
#
#
# Example:
leadership
Complete.Qs<-cbind(leadership$q1,leadership$q2,leadership$q3)
Complete.Qs
is.numeric(Complete.Qs)
is.matrix(Complete.Qs)
is.data.frame(Complete.Qs)
Complete.Qs.df<-as.data.frame(Complete.Qs)
is.data.frame(Complete.Qs.df)
plot(Complete.Qs.df)
plot(Complete.Qs)

x<-c(TRUE,TRUE,FALSE)
is.logical(x)
as.numeric(x)
mean(x)

###########################
# Sorting
###########################
#
# Notes
# - Sorting can be done through order()
# - NA's are always ordered last by default.  See help file.
#
# Psuedo code
#	ordered.data<-mydata[order(mydata$variable1,mydata$variable2),]
#
#
# Example:
order(leadership$age)
leadership[order(leadership$gender,-leadership$age),]

###########################
# Merging 
###########################
#
# Notes
# - cbind, rbind, and merge are used merge rows and/or columns
#   merge allows for merging to happen according to an ID
# 
# Pseduo Code
#	rbind(mydata1, mydata2)
#	cbind(mydata1, mydata2)
#	merge(mydata1, mydata2, by = "variable.name")
#
# Example:

more.data<-data.frame(manager = 1:5, q6= c(1,3,3,2,5))
sorted<-leadership[order(leadership$gender,-leadership$age),]
more.data
sorted

# Incorrect merge
cbind(sorted,more.data)
# Correct
leadership<-merge(sorted, more.data, by = "manager")



###########################
# Subseting and sampling
###########################
#
# Notes:
#	- you refer or eleminate elements / portions of data frame via [x,y]
#	- you can sample from them using sample()
# Pseudo code
#	my.data.frame[,B]
#	my.data.frame[A,]
#	my.data.frame[A,B]
#	my.data.frame[-A,]
#	sample(my.data.frame)
#
# Example
#
leadership
leadership[,1:10]
leadership<-leadership[,c(1:10,12,11)]
leadership[-c(1,3,5),]

sample(1:5,3, replace = T)
leadership[sample(1:nrow(leadership),2, replace=F),]
leadership[sample(1:nrow(leadership),3, replace=F),]

