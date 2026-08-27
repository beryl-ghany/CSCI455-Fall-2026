traini#Author:Beryl Ghany, Date:08/25/26, Purpose: Regression Analysis

#Import dummy dataset
training_data<-mtcars

#Plot the data as a scater plot
scatter.smooth(x=training_data$disp,y=training_data$wt,main="SpeedVSdistance")

# 50% split
# 70% split
# 90% split

# Create a trainig dataset with 50% split
training_dataset<-training_data[1:16,]
test_dataset<-training_data[17:32,]

# Creating regression model on mpg and wt of the car
regression_model<-lm(mpg~wt,data=training_dataset)