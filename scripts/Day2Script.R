rm(list = ls())
#################################
# Day 2: Data Structures        
# Reading: 2.1 - 2.2            
# Objectives:                   
#  1. vectors                
#  2. matricies              
#  3. arrays 			  
#			  
#					  
#################################
#
#
########################### 
# Data Sets            
###########################
# Notes:
# - Datasets are (typically) rectangular arrays of data
# - Columns/rows represent variable/units
# - Each row is an element/unit/observation
# - The i,j'th entry is the `value' of jth variable for the ith unit
# - The value that the variable takes on determines whether
#   its categorical(ordinal or nominal) or continuous. 
# - Different structures are used for different types of variables
#  
# Q: What are the variables and units.
# Q: Which variables are continuous and which are categorical?   
help(USArrests)
USArrests
help(mtcars)
mtcars
#
# 
# More notes:
# - all objects have one and only one (storage) mode
#  - numeric, character, logical
# - all objects have one or more classes assigned to it
# - the class of an object tells functions what to do when applied
#
#
###########################
# Vectors            
###########################
# Notes
# - Elements of vectors have mode and class numerical, character, or logical
# - All elements must belong to the same mode and class
# 
# Psuedo Code
# 	my.vector<-c(element1, element2,...)
#	my.vector[i]
#
# Examples
help(c)
a<-c(1,2:5,3)
a
1:6
a - 1:6
a+1:6
a/1:6
a*1:6
a^2
exp(a)
log(a)
round(log(a),2)
a[-2]

b<-c("one","two","three",NA)
b
c<-c(TRUE,TRUE, FALSE)
c
d<-c(a,b)
d
mode(a)
class(a)
mean(a)
str(a)

mode(d)
class(d)
mean(d)
str(d)

mode(c)
class(c)
mean(c)
str(c)

###########################
# Matricies          
###########################
# Notes
# - Matricies are rectangular arrays
# - They belong the class "matrix"
# - all elemements must have the same mode
# 
# Pseudo code
#  my.matrix<-matrix(my.vector,nrow=n)
#  my.matrix[i,j]
#  function(my.matrix)
#
# Example
help(matrix)
a
matrix(a)
A<-matrix(a,nrow = 3)
A
B<-matrix(a, nrow = 3, byrow = T)
B
mean(B)
plot(B)
mode(B)
class(B)
str(B)

summary(B)

C<- matrix(c(T,T,F,F),2)
C
mode(C)
class(C)
mean(C)
summary(C)

cnames<-c("Exam1","Exam2")
rnames<-c("Sam","Max","Billy-Bob")
ExamScores<-matrix(c(80,90,95,70,75,99), ncol=2,
 dimnames = list(rnames,cnames))
ExamScores
ExamScores[2,1]
ExamScores[2,]
ExamScores[,1]
ExamScores[1,2]<-0
ExamScores
mean(ExamScores)
summary(ExamScores)

Exam1<-c(80,90,95)
Exam2<-c(70,75,99)
ExamScores<-cbind(Exam1,Exam2)
ExamScores
rownames(ExamScores)<-c("Sam","Max","Billy-bob")
ExamScores

# 
###########################
# Arrays             
###########################
# Notes
# - Arrays are similar to matricies but can have 3 dimensions
# - They belong the class "array"
# - all elemements must have the same mode
# 
# Pseudo code
#  my.array<-array(vector,dimensions, dimnames)
#  my.array[i,j,k]
#  function(my.array)
help(array)
args(array)
letters
dim1<-c("A1","A2")
dim2<-c("B1","B2","B3")
dim3<-c("C1","C2","C3","C4")
alphabet<-array(letters, c(2,3,4), list(dim1,dim2,dim3))
mode(alphabet)
class(alphabet)
alphabet[,,1]
alphabet[,,2]
alphabet[,,3]
alphabet[,,4]
alphabet[,,5]
alphabet[1,,]
alphabet[2,,]
alphabet[2,1,]
#

