rm(list = ls())
###########################################
# Day 3: More Data Structures
# Reading: 2.2-2.3                     
# Objectives:
#	1. data frames                             
#	2. factors					
#	3. lists					
#					
#	 				
#							
#							
###########################################
#
#
# 
#################################
# Data frames               
#################################
# Notes
# - Data frames, like matricies, are rectangular
# - columns can have different modes
# - "fundamental structure of most of R's modeling software"
# - character vectors get coerceded into factors by default
# 
# Pseudo code
#	my.data.frame<-data.frame(variable1,variable2)
#	my.data.frame[[1]]
#	my.data.frame$variable1
#	attach(my.data.frame)
#	variable1
#
# Example: 
help(data.frame)
Scores<-c(85,80,95)
Scores
Grade<-c("B","B","A")
Grade
Gradebook<-data.frame(Scores,Grade)
Gradebook
mode(Gradebook)
class(Gradebook)
str(Gradebook)
Gradebook[[1]]
Gradebook$Scores
str(Gradebook[[1]])
Gradebook[[1]][c(1,3)]
Gradebook$Scores[c(1,3)]
Gradebook[[1]][2]
class(Gradebook$Scores)
class(Gradebook$Grade)

help(iris)
iris
plot(iris)
summary(iris)
iris[1:3]
iris[1:3][1:2,]
iris[1:2,1:3]

Species
attach(iris)
Species
iris$Species
detach(iris)
Species

#
################################ 
# Factors 
################################
# 
# Notes:
# - Categorical variables are usually saved as factors
# - Factors can be nominal or ordinalDatasets are (typically)
# - They belong to the class factor and have numeric mode
# - data.frame() coerces character variables to factors automatically
#
# Pseudo code:
#
# my.factor<-factor(variable)
#
# Example
help(factor)
fertilizer<-c("l","m","h","h","l","m")
summary(fertilizer)
summary(factor(fertilizer))

yield<-c(30,40,45,46,20,25)
ag.data<-data.frame(fertilizer,yield)
ag.data
summary(ag.data)

fert.fact<-factor(fertilizer)
fert.fact
fert.ord.fact<-factor(fertilizer,order= T, levels = c("l","m","h"))
fert.ord.fact

boxplot(yield~fert.fact)
boxplot(yield~fert.ord.fact)

ag.data.ord<-data.frame(fert.ord.fact,yield)
ag.data.ord
summary(ag.data.ord)

str(ag.data)
str(ag.data.ord)

################################ 
# Lists 
################################
# 
# Notes:
# - Lists have little structure
# - Lists can be composed of any objects, including lists
#
# Pseudo code
# my.list<-list(name1=object1, name2=object2,...)
# my.list[[1]]
# my.list$name1
#
# Example
ag.summaries<-summary(ag.data.ord)
ag.information<-list(AgData = ag.data.ord, AgSummary =ag.summaries)
ag.information
ag.information[[1]]
ag.information$AgData

i<-complex(real = 0, imaginary=1)
i
i*i
as.numeric(i*i)
inception<-list(i = list(i = list(i=i)), "huh")
inception

 


