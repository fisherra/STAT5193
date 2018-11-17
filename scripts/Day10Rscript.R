rm(list = ls())
###########################################
# Day 10: Bar Charts, Pie Charts, Histograms
# Reading: 6.1 - 6.4                      
# Objectives:
# 1. Bar charts 
# 2. Pie charts                         			
# 3. Histograms
###########################################
# 
########################### 
# Basic Bar Charts
###########################
# Notes
# - Bar charts summarize the frequency distribution of a categorical variable  
#
# Pseudo Code
#  my.table<-table(factor)
#  barplot(my.table)
#
# Example
#	
load("H:\\WINDOWS\\SAS and R\\R\\Day 5\\.RData")
str(Class.Data)
attach(Class.Data)
Gender.table<-table(Gender)
barplot(Gender.table)
help(barplot)
dev.new()
barplot(Gender.table, names.arg = c("Female","Male"), horiz=T, 
 col = 2:3, ylab = "Gender", xlab = "Count")
title("Bar Plot of Gender")

########################### 
# Advanced Bar Plots
###########################
# Notes
# - We may have a jxk table for a pair of cateogrical variables  
# - transponsing and aggregating data can be useful
# 	
# Pseudo Code
#  my.table<-table(factor1,factor2)
#  barplot(my.table)
#
#  my.agg.data<-aggretate(Cont.Var~Factor, data = my.data, FUN=function)
#  barplot(my.agg.data)
#
# Example
#
GenVPin<-table(Gender,Pinterest)
GenVPin
barplot(GenVPin,main = "Pinterest vs. Gender", xlab = "Pinterest", col = 2:3,
 legend = rownames(GenVPin))

barplot(GenVPin,main = "Pinterest vs. Gender", xlab = "Pinterest", col = 2:3, 
 legend = rownames(GenVPin), beside = TRUE)

GenVPin<-t(GenVPin)
GenVPin

barplot(GenVPin,main = "Gender vs. Pinterest", xlab = "Gender", col = 2:3, 
 legend = rownames(GenVPin), args.legend = list(title = "Pinterest"),beside = TRUE)

meanInt<-aggregate(Introvert~Pinterest, data = Class.Data, FUN = mean)
meanInt

barplot(meanInt$Introvert, names.arg = rownames(Gender.table), 
 ylab = "Mean Introversion Level", col = 2:3, main = "Intovert v. Gender")

Summary.Int.v.Gender<-aggregate(Introvert~Pinterest, data = Class.Data, FUN = summary)
Summary.Int.v.Gender


########################### 
# Pie Chart
###########################
#
# Notes
# - Pie charts summarize the frequency distribution of a categorical variable  
# - It can input a table or a numeric vector of relative portions of pie
#
# Pseudo Code
#  my.table<-table(factor)
#  pie(my.table)
#
# Example: 
#
help(pie)	
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls,
    main="Simple Pie Chart")

pct <- round(slices/sum(slices)*100)	
lbls2 <- paste(lbls, " ", pct, "%", sep="")	
pie(slices, labels=lbls2, col=rainbow(length(lbls2)),	
    main="Pie Chart with Percentages")	


########################### 
# Histograms
###########################
#
# Notes: 
# - Displays the distribution of a single continuous variable
# - density gets a "kernel density" estimate of the pdf
# Pseudo Code:
# - hist(my.variable)
# 
# Example:
str(faithful)
attach(faithful)

hist(waiting, main = "Default Plot")

dev.new()
hist(waiting, probability = T, breaks = 25, col = "red", 
 xlab = "Time", main = "Using Some Options")
rug(jitter(waiting))
lines(density(waiting), lwd = 3, lty = 2)
