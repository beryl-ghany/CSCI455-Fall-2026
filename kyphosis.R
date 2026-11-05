#Author: Ghany; Date: 11/05/2026; Purpose: Test decision trees in R

install.packages("rpart")

library(rpart)

#load dummy dataset
kyphosis<-kyphosis

#Create a decision tree
fit<-rpart(Kyphosis~Age+Number+Start, method="class",data=kyphosis)

Plot the results
 plot(fit, main="Classification plot for Kyphosis", uniform=TRUE)
text(fit, use.n=TRUE, all=TRUE,cex=.8)