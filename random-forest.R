# Author: Ghany, Date: 10/27/2026, Purpose: Set up a Random Forest and do a 60% split
library(caret)

# Upload a dummy dataset for training
dataset <- iris

# Split the dataset into training and testing groups
validation_index <- createDataPartition(dataset$Species, p=0.60, list=FALSE)

# Testing dataset (40%)
validation <- dataset[-validation_index, ]

# Training dataset (60%)
dataset <- dataset[validation_index, ]

# Setting variables for accuracy measurement
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"

# Train the model using Random Forest instead of LDA
set.seed(7)
fit.rf <- train(Species ~ ., data=dataset, method="rf", metric=metric, trControl=control)

# predictions on the validation dataset using the new random forest model
predictions <- predict(fit.rf, validation)
confusionMatrix(predictions, validation$Species)

Confusion Matrix and Statistics

            Reference
Prediction   setosa versicolor virginica
  setosa         20          0         0
  versicolor      0         20         2
  virginica       0          0        18

Overall Statistics
                                          
               Accuracy : 0.9667          
                 95% CI : (0.8847, 0.9959)
    No Information Rate : 0.3333          
    P-Value [Acc > NIR] : < 2.2e-16       
                                          
                  Kappa : 0.95            
                                          
 Mcnemar's Test P-Value : NA              

Statistics by Class:

                     Class: setosa Class: versicolor Class: virginica
Sensitivity                 1.0000            1.0000           0.9000
Specificity                 1.0000            0.9500           1.0000
Pos Pred Value              1.0000            0.9091           1.0000
Neg Pred Value              1.0000            1.0000           0.9524
Prevalence                  0.3333            0.3333           0.3333
Detection Rate              0.3333            0.3333           0.3000
Detection Prevalence        0.3333            0.3667           0.3000
Balanced Accuracy           1.0000            0.9750           0.9500

