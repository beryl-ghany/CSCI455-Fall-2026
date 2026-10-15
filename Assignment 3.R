# Author: Ghany, Date: 10/15/2026, Purpose: Set up a Neural network and do a 60% split
install.packages("caret", dependencies = TRUE)

#Load the packae caret
library(caret)

#Upload a dummy dataset for training
dataset<-iris

#Split the dataset into training and testing groups
validation_index <- createDataPartition(dataset$Species, p=0.60, list=FALSE)

# Testing dataset (40%)
validation <- dataset[-validation_index, ]

# Training dataset (60%)
dataset <- dataset[validation_index, ]

# Setting variables for accuracy measurement
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"

#Train the model using LDA/Linear Determinant Analysis
set.seed(7)
fit.lda <- train(Species ~ ., data=dataset, method="lda", metric=metric, trControl=control)

#predictions on the validation dataset
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)

Confusion Matrix and Statistics

            Reference
Prediction   setosa versicolor virginica
  setosa         20          0         0
  versicolor      0         20         0
  virginica       0          0        20

Overall Statistics
                                     
               Accuracy : 1          
                 95% CI : (0.9404, 1)
    No Information Rate : 0.3333     
    P-Value [Acc > NIR] : < 2.2e-16  
                                     
                  Kappa : 1          
                                     
 Mcnemar's Test P-Value : NA         

Statistics by Class:

                     Class: setosa Class: versicolor Class: virginica
Sensitivity                 1.0000            1.0000           1.0000
Specificity                 1.0000            1.0000           1.0000
Pos Pred Value              1.0000            1.0000           1.0000
Neg Pred Value              1.0000            1.0000           1.0000
Prevalence                  0.3333            0.3333           0.3333
Detection Rate              0.3333            0.3333           0.3333
Detection Prevalence        0.3333            0.3333           0.3333
Balanced Accuracy           1.0000            1.0000           1.0000


