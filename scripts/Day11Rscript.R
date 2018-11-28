rm(list = ls())
###########################################
# Day 11: Box Plots, Dot Charts, Descriptive Statistics
# Reading: 6.5 - 7.1                      
# Objectives:
#  1. Box Plots
#  2. Dot Charts
#  3. Descriptive Statistics
#
###########################################
# 
########################### 
# A Single Box Plot
###########################
# Notes:
# - Box plots are plots based on the 5 number summary: min, Q1, M, Q3, max
# - They are typically used to compare distributions and identify outliers  
#
# Pseudo Code:
#  boxplot(my.variable)
#	
# Understanding a Boxplot:
load("H:\\WINDOWS\\SAS and R\\R\\Day 5\\.RData")
attach(Class.Data)
boxplot(HSClass, main = "Boxplot Summary: HS Class Size")
help(boxplot)
help(boxplot.stats)
# range gets passed to coef

# Boxplot with outlier identified (Q1 - 1.5 IQR, Q3 + 1.5 IQR)
boxplot(HSClass, main = "Boxplot: Outlier Identified", yaxt = "n")
summary<-boxplot.stats(HSClass)
summary
axis(2, at = summary$stats, labels = c("Min","Q1","M","Q3","Max"))
axis(2, at = summary$out, labels = "Outlier")
outlier.cutoff<-summary$stats[4] + 1.5*(summary$stats[4] - summary$stats[2])
axis(2, at = outlier.cutoff, labels = "(Q3+1.5IQR)", padj=-2,col=2)
abline(h=outlier.cutoff, col =2, lty =2)

# Boxplot without outlier identified (using min, Q1,M,Q3, max)
boxplot(HSClass, main = "Boxplot: Outlier Removed", range = 0, yaxt = "n")
summary<-boxplot.stats(HSClass, coef = 0)
summary
axis(2, at = summary$stats, labels = c("Min","Q1","M","Q3", "Max"))

# Example: 
#
boxplot(HSClass, col=3,main = "Boxplot of HS Class with Ticks", yaxt="n", pch = 3) 
summary<-boxplot.stats(HSClass)
axis(2, at = summary$stats)
axis(2, at = summary$out)

########################### 
# Side by Side Boxplots
###########################
# Notes:
# - Side by side boxplots are useful for comparing distributions
# - The option conf marks plots a 95% confidence interval for (each) median   
#
# Pseudo Code:
#  boxplot(my.variable~my.factor, data= my.data, conf = T)
#	
# Example:
	
boxplot(TxtSent~Class, col = 3:4)
boxplot(TxtSent~Class, col = 3:4, notch=T)
# Note: confidence interval for the median (notch=T) assumes n is "large"
boxplot(TxtSent~Class, col = 3:4, notch=T)$conf
boxplot(Introvert, notch = T, col =2)
boxplot(TxtSent~Class*Gender)
boxplot(TxtSent~Gender*Class, col = 2:3, main = "Txt Sent vs Gender and Class")


###########################
# Dot Charts
###########################
#
# Notes:
# - Useful for plotting single variable and labeling each unit
#
# Pseudo Code:
#  dotchar(myvariable, labels = names(myvariable))
#
# Example:
str(USArrests)
attach(USArrests)
dotchart(UrbanPop, labels = row.names(USArrests), 
 main = "Urban Population", cex = 0.8)

UrbanPop
Ordered<-USArrests[order(UrbanPop),]
dotchart(Ordered$UrbanPop, labels = row.names(Ordered), 
  main = "Urban Population",cex = 0.8)

########################### 
# Summary Statistics
###########################
# Notes
# - The main function is summary().  
# - You could use summaryBy() in doBy package or aggregate() 
# - Many variations of summary exist in other packages
#
# Pseudo Code
#  summary(my.object)
#  aggregate(my.data, by = list(name=factor),FUN=my.summary.stat)
#  summary(my.data[factor.variable==value,])
#
# Example:
summary(Class.Data)
help(summary)
males.summary<-summary(Class.Data[Gender == "M",])
females.summary<-summary(Class.Data[Gender=="F",])
males.summary
females.summary

help(aggregate)
aggregate(Class.Data[,3:6], by = list(class=Class, gender=Gender), FUN=mean)

