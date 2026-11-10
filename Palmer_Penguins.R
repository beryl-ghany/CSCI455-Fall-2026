# Author: Ghany, Date: 11/10/2026, Purpose: LDA Model on Palmer Penguins

# Load the package caret
library(caret)

# Read the penguins dataset and remove rows with missing values (NA)
dataset <- read.csv("penguins.csv")
dataset <- na.omit(dataset)
dataset$species <- as.factor(dataset$species)

# Split the dataset into training (80%) and validation (20%) groups
validation_index <- createDataPartition(dataset$species, p=0.80, list=FALSE)

validation <- dataset[-validation_index, ]
dataset <- dataset[validation_index, ]

# Setting variables for accuracy measurement
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"

# Train the model using LDA/Linear Discriminant Analysis
set.seed(7)
fit.lda <- train(species ~ ., data=dataset, method="lda", metric=metric, trControl=control)

# Predictions on the validation dataset
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$species)

Confusion Matrix and Statistics

           Reference
Prediction  Adelie Chinstrap Gentoo
  Adelie        29         0      0
  Chinstrap      0        13      0
  Gentoo         0         0     23

Overall Statistics
                                     
               Accuracy : 1          
                 95% CI : (0.9448, 1)
    No Information Rate : 0.4462     
    P-Value [Acc > NIR] : < 2.2e-16  
                                     
                  Kappa : 1          
                                     
 Mcnemar's Test P-Value : NA         

Statistics by Class:

                     Class: Adelie Class: Chinstrap Class: Gentoo
Sensitivity                 1.0000              1.0        1.0000
Specificity                 1.0000              1.0        1.0000
Pos Pred Value              1.0000              1.0        1.0000
Neg Pred Value              1.0000              1.0        1.0000
Prevalence                  0.4462              0.2        0.3538
Detection Rate              0.4462              0.2        0.3538
Detection Prevalence        0.4462              0.2        0.3538
Balanced Accuracy           1.0000              1.0        1.0000
> 

