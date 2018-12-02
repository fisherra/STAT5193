rm(list = ls())
###########################################
# Day 13: 1 and 2 sample tests, linear models
# Reading: 7.4, 7.5                     
# Objectives:
#  1. One and Two Independent Samples Tests
#  2. Dependent Samples Tests
#  3. Linear Models
#	
###########################################
# 
########################### 
# One and Two Independent Sample T - Test 
###########################
# Notes:
# - Assumptions for one sample t-test
#  - Data are iid normal (or sample size large)
# - Assumptions for two independent sample t-test
#   - Data are independent within and across samples
#   - Data are normally distributed (or sample sizes are large)
# - We can use Welch (unequal variance) or the pooled (equal) variance test
#   - We typically use the unequal variance test (default). It generally works well (default)
# 
#
# Pseudo Code:
#  t.test(y~factor, data = my.data)
#  t.test(y,x) 
#	
# Example: 1 sample
#  
load("H:\\WINDOWS\\SAS and R\\R\\Day 5\\.RData")
ls()
attach(Class.Data)
hist(TxtSent)
qqnorm(TxtSent)
qqline(TxtSent)
length(TxtSent)

help(t.test)
t.test(TxtSent)
t.test(TxtSent, alternative = "greater", mu = 30, conf.level = .9)
# Interpretations: 
# - We are 90% confident that students send at least 36.6 texts on average.
# - There is strong evidence to suggest that students sent more than 
#  30 texts on average because the p-value = 0.022 is small. 


# Example: 2 sample
boxplot(Fbtime~Gender, col = 2:3, main = "Checking for outliers and equal variance")

maleFb<-Class.Data[Gender=="M",]$Fbtime
femaleFb<-Class.Data[Gender=="F",]$Fbtime
t.test(femaleFb,maleFb, conf.level = .9)
t.test(Fbtime~Gender, conf.level = .9)
t.test(Fbtime~Gender, var.equal = T, conf.level = .99)

# - We are 99% confident the mean difference in male and female Facebook
#  time is between is between -19.25 and 41.17 minutes (female - male).
# - There is not enough evidence to suggest that the mean Facebook time
#  for males is different than the mean Facebook time for females because 
#  the p-value = 0.3287 is large.
# 
###########################################
# 
########################### 
# Independent Sample Wilcoxon Rank Sum/Mann Whitney Test
###########################
# Notes
# - Assumptions: 
#  - Data are independent within and across samples
#  - The null hypothesis is that their distributions are the same
#  - data are continuous (no normality necessary, but no ties allowed) 
#
# Pseudo Code:
#  wilcox.test(y,x)
#  wilcox.test(y~factor)
#
# Example:
wilcox.test(femaleFb,maleFb)
set.seed(1)
y<-rexp(20)
x<-rexp(20)+1
boxplot(y,x)
wilcox.test(y,x)
# -There is very strong evidence to suggest that Y and X were sampled
#  from different populations because the p-value = .00029 is small  
#
#
#
########################### 
# Dependent Sample T - Test
###########################
# Notes:
# - Two variables measured on each unit 
#   - Data independent across units but 2 dependent variables measured per unit 
#   - Differences are normally distributed (or sample sizes are large) 
#
#
# Pseudo Code:
#  t.test(y, x, paired = T)
#  d <- y - x
#  t.test(d)
d<-TxtSent - TxtRec
t.test(d)
t.test(TxtSent,TxtRec, paired = T)
boxplot(d, main = "Text Sent - Text Received", col =2)

########################### 
# Dependent Wilcoxon Test
###########################
# Notes:
# - Two variables measured on each unit 
#   - Data independent across units but 2 dependent variables measured per unit 
#   - Data are continuous - i.e. don't need normality 
#
# Pseudo Code:
#  wilcox.test(y, x, paired = T)
#  d<-y-x
#  wilcox.test(d)
#
# Example: 
wilcox.test(TxtSent,TxtRec, paired = T)
TxtSent - TxtRec

###########################
# Linear Models           #
###########################
# Notes:
# - Y = b0 + b1 X + e
#   - b0 and b1 are fixed unknown regression parameters
#   - Y is a random variable
#   - X is fixed (or conditioned upon)
#   - errors (e) are iid normal(0, sigma^2)
# Psuedo code
#  model<-lm(y~x)
#  summary(model)
#  conf.int(model)
#  plot(model)
#  resid(model)
#  abline(model)
#  predict(model)
#
# Example

plot(TxtRec, TxtSent)
model<-lm(TxtSent~TxtRec)
model
summary(model)
confint(model)
abline(model)
plot(model)