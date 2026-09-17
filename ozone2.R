#Author: Ghany, Date: 09/10/2026, Purpose: Build a regression model

#Load dataset
data<-airquality

Remove all the rows with NA'S
New_data<-data[complete.cases(data),]

#Take average for Ozone
mean(New_data$Ozone)

#Replace all NA;s in Ozone with above average
data$Ozone[is.na(data$Ozone)]<-42

#Take average for Solar.R
mean(New_data$Solar.R)

#Replace all the NA's in Solar.R with average of 185
data$Solar.R[is.na(data$Solar.R)]<-185

#cbind and rbind functions
variable1<-c(1:100)

variable2<-c(101:200)
variable 2

variable3<-cbind(variable1:variable2)

variable4<-c(1:99)

cbind(variable1, variable2, variable4)