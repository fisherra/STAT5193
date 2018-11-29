rm(list = ls())
###########################################
# Day 12: Frequency Distributions
# Reading: 7.2                     
# Objectives:
#  1. Frequency Tables
#  2. Tests of Independence
#  3. More Graphs for Descrete Data
#
###########################################
# 
########################### 
# Generating Tables
###########################
# Notes:
# - Functions for generating tables are table() and xtabs()
# - variables for creating tables must be factors or coercible to factors  
# 
# Pseudo Code:
#  table(factor1, factor2,...)
#  xtabs(~factor1 + factor2, data = my.data.frame)
#
# Example:
# install.packages("vcd")
library(vcd)
help(Arthritis)
attach(Arthritis)
str(Arthritis)

# Basic 1 - way tables
table(Improved)
xtabs(~Improved, data = Arthritis)

# Basic 2 - way tables
table(Improved, Treatment)
xtabs(~Improved + Treatment)
t(table(Improved, Treatment))
table(Treatment,Improved)

# Graphical Displays of Two way tables in the vcd package
mosaic(table(Treatment,Improved), legend = T, gp = shading_max)

# Three way tables
table(Treatment, Improved, Sex) 
xtabs(~Treatment + Improved + Sex)


########################### 
# Margins 
###########################
# Notes:
# - We often create a k-way table but what to look at one factor at a time 
#   by marginizing (summing) over all other factors
#
# Pseudo Code:
#  margin.table(my.table, margin.numbers)
#  addmargins(my.table, margin.numbers)
#	
#
# Example:
TrtImpSex<-xtabs(~Treatment + Improved + Sex)
TrtImpSex
margin.table(TrtImpSex,1)
margin.table(TrtImpSex,2)
margin.table(TrtImpSex,3)

margin.table(TrtImpSex,c(1,2))
TrtImpSex[,,1] + TrtImpSex[,,2]
addmargins(TrtImpSex,1:2)
addmargins(TrtImpSex,1)

############################
# Proportions and flat tables
############################
# Notes:
# - typically row or column proportions are more meaningful
# - we might also want to print out a "flat" table
# - do proportions before adding margin sums
# Pseudo Code:
#  prop.table(my.table, margin.number)
#  ftable(my.table)
#	
#
# Example
TrtImp<-margin.table(TrtImpSex,1:2)
TrtImp
prop.table(TrtImp,1)

#In placebo group _16.3____ percent showed marked improvement while
# __51.2____ of patients in treatment group showed marked improvement.
#
# Would we interpret column percentages? 

TrtImpSex
ftable(TrtImpSex)
ftable(addmargins(TrtImpSex))

############################
# Tests of independence
############################
# Notes:
# - The Chi-square test of independence for jxk tables tests that 
#    row proportions are same across columns or vice versa, i.e.
#	  X and Y factors are independent.
# Recall: Under Ho: X and Y independent
#  E = Expected Count under Ho = total count * row prop * col prop
#  O = observed count
#  Chi.square = sum( (0 - E)^2/E)
#    -(0 - E)/sqrt(E) is a "Pearson (standardized) residual"
#    -(0 - E)/sqrt(E) is roughly normal(0,1) under Ho 
#  Chi.square has (#row -1)(#col -1) df under Ho
#
# - Fisher's exact tests is used when an E value is small, say < 5
# 
# Pseudo Code:
#       
# chisq.test(my.table)
# fisher.test(mytable)
#
# Example:
# Are these proportions the same for each column?   
prop.table(TrtImp,1)
# What are the Pearson residuals
resid(chisq.test(TrtImp))
# Observe 
addmargins(TrtImp)
E11 = 84*43/84* 42/84
O11 = 29
(O11 - E11)/sqrt(E11)
chisq.test(TrtImp)
# Observe
sum(resid(chisq.test(TrtImp))^2)
mosaic(TrtImp, legend = T, gp = shading_max)
barplot(t(TrtImp), col = 2:4, beside=T, legend=rownames(t(TrtImp)))
fisher.test(TrtImp)

my.fake.data<-as.table(matrix(c(2,3,9,5),2))
my.fake.data
chisq.test(my.fake.data)
fisher.test(my.fake.data)



