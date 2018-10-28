rm(list = ls())
###########################################
# Day 4: Data Input and Packages
# Reading: 2.3 -2.4                     
# Objectives:
#	1. Manual Entry                             				
#	2. Importing
#	3. Exporting
#		
#							
#							
###########################################
#
#
# 
#################################
# Manual Entry               
#################################
#
# Notes:
# - you can use a text editor via edit()
# - you can create a txt file manually too
#
#
# Pseudo Code:
#
# my.data<-data.frame()
#	my.data<-edit(mydata)
# 
# my.data.txt<-"data here"
#	my.data<-read.table(text = my.data.txt)
#
# Example:

Class.Data<-data.frame()
Class.Data<-edit(Class.Data)
Class.Data

Class.Data.txt<- "
Gender TxtSent
M 10
M 25
F 45
F 70
"
Class.Data.txt

Class.Data<-read.table(text = Class.Data.txt, header = T)
Class.Data

Class.Data.txt<- "
Student Gender TxtSent
1 M 10
2 M 25
3 F 45
4 F 70
"

Class.Data<-read.table(text=Class.Data.txt, row.names = 1, header = T)



#################################
# read.table()            
#################################
#
# Notes:
# - Make sure that the text file (ASCI) is in your working directory
# - Alternatively double check the address for the file
# - sep = "" option is default and means white space -spaces, tabs, newlines
#	- can be sep = "," for comma or "\t" for tab only
# - Remark: Scripters will need to get good at using this function
# 
# Pseudo Code
#	
# my.data<-data.frame(file = "MyFile.txt", options = list())
#
# Example:
#
help(read.table)
getwd()
Class.Data<-read.table(file = "H:/WINDOWS/SAS and R/R/Day 4/StudentData.txt")
Class.Data

Class.Data<-read.table(file = "H:/WINDOWS/SAS and R/R/Day 4/StudentData.txt",
     header = T)
Class.Data<-read.table(file = "StudentData.txt", header = T)

Class.Data<-read.table(file = "clipboard", header = T)
Class.Data<-read.table(file = "http://jdhabiger.okstate.edu/StudentData.txt",
     header = T)
str(Class.Data)



#################################
# read.csv()            
#################################
#
# Notes:
# - First save your excel file as .csv tom
# - Then use read.csv()
# - Alternatively copy data and use read.table()
# 
#
# Pseudo Code
#
#	my.data<-data.frame(file = "MyFile.txt", options = list())
#
# Example:
help(read.csv)

Class.Data<-read.csv(file = "H:/WINDOWS/SAS and R/R/Day 4/StudentDataExcelComma.csv", 
   header = T)
Class.Data
# Notice the right border on the file confused read.csv()

# You can still just copy the data and use read.table()
Class.Data<-read.table(file = "clipboard", header = T)

#
#################################
# writing files            
#################################
#
# Notes
#	- you probably want quote = F in the options, especially for write.csv
#	- make sure the file isn't already open
#	- default is to write over the top of a file
# Pseudo code
#	write.csv(x=my.R.Data, file = "my.Excel.Data.csv")
#	write.table(x = my.R.Data, file = "my.text.Data.txt")
#
help(write.csv)
help(USArrests)
USArrests
write.csv(x=USArrests, file = "ArrestsData.csv", quote = F)

help(write.table)
write.table(x = USArrests, file = "ArrestsData.txt", quote = F)

save.image("H:\\WINDOWS\\SAS and R\\R\\Day 4\\.RData")



