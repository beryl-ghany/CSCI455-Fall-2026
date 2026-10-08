# Author: Ghany, Date: 10/8/2026, Purpose: Set up a Neural network
instal.packages("caret", dependencies = TRUE)

#Load the packae caret
library(caret)

#Upload a dummy dataset for training
dataset<-iris

#Split the dataset into training and testing groups
validation_index<-createDataPartition(dataset$Species, p=0.80, list=FALSE)

validation<-dataset[-va;idtaion_index,]
dataset<-dataset[validation_index,]