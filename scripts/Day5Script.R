rm(list = ls())
###########################################
# Day 5: Building Graphs and Graphical Parameters
# Reading: 3.1 - 3.3                     
# Objectives:
#  1. Building Graphs
#  2. Parameters for Graphs                             			
#							
#							
###########################################
# 
#
# 
#################################
# Building Graphs    
#################################
#
# Notes:
# - You can build a graph one line of code at a time
# - A graph can be saved with commands or the file menu
#
#
# Pseudo Code 
#  plot(my.data)
#  title(parameter1 = value)
#  title(parameter2 = value)
#
# Example:
# First workspace with Social Media Data
load("H:\\WINDOWS\\SAS and R\\R\\Day 4\\.RData")
ls()
str(Class.Data)
help(plot)
attach(Class.Data)
plot(x=Introvert, y=TxtSent)
abline(lm(TxtSent~Introvert))
title(main = "Regression of Texts Sent on Introversion")
title(sub = "Figure 1: An Example Plot")
detach(Class.Data)
# 
#################################
# Saving Graphs    
#################################
#
# Notes:
# - A graph can be saved with commands or the file menu
#   or with code using pdf, png, jpeg,... functions
# - Make sure plotting window is closed first
# - You can't open the plot and view it as you make it 
#
#
# Pseudo Code 
#
# dev.off()
# pdf("mygraph.pdf")
# plot(my.data)
# dev.off()	
# 	
#
# Example:
# Click File/Save as/..."TextSentvIntroversion.pdf"

dev.off()
pdf("SocialMedia.pdf")
plot(Class.Data)
title("Social Media Variables")
dev.off()

pdf("SeveralPlots.pdf")
attach(Class.Data)
plot(TxtSent,TxtRec, col = Gender)
title(main = "Texting and Gender")
boxplot(TxtSent ~ Gender)
title(main = "Texts Sent by Gender")
# Try to open it and you'll (probably) get an error
dev.off()
# Now you can view it

#################################
# Multiple Simultaneous Graphs    
#################################
#
# Notes:
# - You can create and save multiple graphs using dev.new()
# - You can determine which code gets sent to which graph
#   using dev.set(dev.prev()) and dev.set(dev.next())
# - The plotting window will state "active" or "inactive"
#  
# Psuedo Code
# dev.new()
# make graph 1 here
# dev.new() 
# make graph 2 here
#     
#
# Example:
dev.new()
plot(TxtSent,TxtRec)
dev.new()
hist(HSClass)
dev.set(dev.prev())
title(main = "Texting")
dev.set(dev.next())
title(sub = "Figure 2")
dev.off()
dev.off()

 
#################################
# Specifying Graphical Parameters   
#################################
#
# Notes:
# - They can be set using par() function for the R session
#   - this will affect all future plots made in the session
# - Most can be set within plot() for each individual plot
#   - only affects current plot 
# - There are many many parameters. Read the help file, practice.   
#
#
# Psuedo code:
# par(parameter1 = value1)
# par(parameter2 = value2)
# plot(my.data)
#     
# plot(my.data, parameter1 = value1, parameter2 = value2)
# 	
# Example:
# First save default parameter values and view options.
opar <- par(no.readonly=TRUE)
opar
opar$lty
help(par)
par(lty = 2)
par(pch=17)
par(cex=1.5)
#Now line type is dashed
par(no.readonly = TRUE)$lty
par(no.readonly = TRUE)$pch
par(no.readonly = TRUE)$cex

dose  <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
plot(dose, drugA, type = "b")
help(plot)
# Reset Original Default Parameters 
#  and pass new values through plot
# . . . accept for "cex"
par(opar)
plot(dose, drugA, type = "b", lty=3, pch = 15, lwd = 5)
dev.off()

#################################
# Summary of graphical Parmaeters
#################################  
#
# Notes
#	- Most graphical parameter values can be specified 
#  with a number
#	- See help file otherwise
# 
# List of main parameters
# Symbols and Lines: 
#	- pch(plot character), cex(symbox size), lty(line type), lwd(line width)
# Colors:
#	- col(default col), col.axis, col.lab, col.main, col.sub
# Text scales: (scaled value relative to default)
#	- cex, cex.axis, cex.lab, cex.main, cex.sub
# Fonts: 
#	- font, font.axis, font.lab, font.main, font.sub, ps (point size)
# Margins:
# - pin(width height inches), mai (margins in inches)
#
# Example
par(opar)
plot(x = dose, y = drugA, main = "Default Plot")
dev.new()
par(cex.axis=1.5, font.axis=2, bg = "green") 
par(font.lab = 2,  col.main = "blue")
plot(x = dose, y = drugB, type= "b", pch = 1:5, lty = 3,col=2, lwd = 4)
par(adj = 0)
title(main = "Blue Left", col = 3) 
par(adj=1)
title(sub = "Red Right", col.sub = 2)
par(opar)


