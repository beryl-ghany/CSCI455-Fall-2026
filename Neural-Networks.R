# Author: Ghany, Date: 10/8/2026, Purpose: Set up a Neural network
install.packages("caret", dependencies = TRUE)

#Load the packae caret
library(caret)

#Upload a dummy dataset for training
dataset<-iris

#Split the dataset into training and testing groups
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)

validation <- dataset[-validation_index, ]
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
  setosa          8          0         0
  versicolor      0          8         0
  virginica       0          0         8

Overall Statistics
                                     
               Accuracy : 1          
                 95% CI : (0.8575, 1)
    No Information Rate : 0.3333     
    P-Value [Acc > NIR] : 3.541e-12  
                                     
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


