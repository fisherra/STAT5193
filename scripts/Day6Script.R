rm(list = ls())
###########################################
# Day 6: More Advanced Graphical Techniques
# Reading: 3.4 - 3.5                     
# Objectives:
#  1. Advanced Options
#  2. Combining Graphs                             			
#							
#							
###########################################
# 
#
########################### 
# Options Overview
########################### 
#
# Notes:
# - Most options can be passed directly through ``high level''
#   plotting functions (boxplot, hist, plot). See help(par)
# - common parameters are listed in the plot function's help file
#
#
# Example:

help(par)
load("H:\\WINDOWS\\SAS and R\\R\\Day 5\\.RData")
help(plot)
ls()
plot(dose, drugA, type="b",
  col="red", lty=2, pch=2, lwd=2,
  main="Clinical Trials for Drug A",
  sub="This is hypothetical data",
  xlab="Dosage", ylab="Drug Response",
  xlim=c(0, 60), ylim=c(0, 70))

########################### 
# Title 
########################### 
#
# Notes
#  - You can add each label one at a time or all at once.
#  - Read the help file
#  - common arguments are main, sub, xlab, ylab, ...
#  - common to specify/change these fonts, cex, color 
#
# Example:
attach(Class.Data)
str(Class.Data)
boxplot(Introvert~Gender, col=2:3)
help(title)
title(main="Introversion", col.main="red", cex.main=2, font.main =3)
title(xlab="Gender",col.lab="green", cex.lab=1.5)
title(ylab="Introversion: 1 - 10",col.lab="blue", cex.lab=.8, line=0)
title(ylab="Introversion: 1 - 10",col.lab="blue", cex.lab=.8, line =1)
title(ylab="Introversion: 1 - 10",col.lab="blue", cex.lab=.8, line =2)

###########################
# Lines 
###########################
#
# Notes:
# - lines() is just like plot() but doesn't open a new window
# - so we can add more points/lines etc. to existing plot
# - see also points()
#
# Example:

x <- c(1:10)	
y <- x	
z <- 10/x	
opar <- par(no.readonly=TRUE)

par(mar=c(5, 4, 4, 8) + 0.1)	
# mar Lets change right margin (to 8.1 lines) for later use
# see help(par) for more on yaxt, ann, lwd, lty options
help(par)
plot(x, y, type="b", pch=21, col="red",
     yaxt="n", lty=3, lwd=2, ann=FALSE)

help(lines)
lines(x, z, type="b", pch=22, col="blue", lty=2, lwd =2)	

###########################
# Axis
###########################
#
# Notes: 
#  - adds custom axes.  
#  - you'd want to have yaxt = "n" and/or xaxt="n" when running plot()
#
# Psuedo Code
#  axis(side = which.side, at = tick.location, labels = tick.labels)
#
# Example: 
help(axis)
axis(2, at=x, labels=x, col.axis="red")	
axis(side = 4, at=z, labels=round(z, digits=2), col.axis="blue")	

###########################
# Margin Text
###########################
#
#
# Notes: 
#  - Allows for text to be written to margins
#
# Psuedo Code
#  mtext("my margin text", side=my.side, line=my.num.lines.indented)
#
# Example
help(mtext)
mtext("y=1/x", side=4, line =3, cex = 2, col="blue")	
mtext("y=x", side = 2,  line = 2.5, cex =2, col = "red")
title("An Example of Creative Axes",	
      xlab="X values")	
par(opar)
#
########################### 
# Legend
########################### 
#
# Notes
#  - Adds a legened to the interior of plot
#  - Use "topleft", "bottomright" etc. and inset for location
# 
# Psuedo Code
# legend(location=where.at, legend = c("name1","name2"),...)
# 
# Example:
opar <- par(no.readonly=TRUE)
par(opar)

dose  <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

par(lwd=2, cex=1.5, font.lab=2)	

plot(dose, drugA, type="b",	
     pch=15, lty=1, col="red", ylim=c(0, 60),	
     main="Drug A vs. Drug B",	
     xlab="Drug Dosage", ylab="Drug Response")	

lines(dose, drugB, type="b",	
      pch=17, lty=2, col="blue")	

abline(h=30, lwd=1.5, lty=2, col="gray")	

help(legend)
legend("topleft", inset = 0.05, title="Drug Type", c("A","B"),	
       lty=c(1, 2), pch=c(15, 17), col=c("red", "blue"))	


########################### 
# Text Annotations
########################### 
#
# Notes:
# - adds an annotation to a point on a plot (say for an outlier)
# 
# Psuedo Code
#  text(location, "my text", pos=rel.to.location)
#	
# Example:
#
#
par(opar)
attach(USArrests)
plot(Murder, Assault)
title(main = "Crime Data for USA by State")
help(text)
text(x=6.6, y=151,labels="OK",pos=4)
points(x=6.6, y=151, pch = 2, col =2, cex =2, lwd=5)

########################### 
# Combining Graphs Overview
########################### 
#
# Notes:
#  - par(mfrow = c(nrows,ncols)) splits the plot window
#  - How well this works depends on your device
#  - See the book for more information and details
#
#
#
#
#
########################### 
# par(mfrow = c(n,m))
########################### 
#
#
# Example:
#
par(mfrow = c(2,1))
attach(Class.Data)
hist(TxtSent)
hist(TxtRec)



