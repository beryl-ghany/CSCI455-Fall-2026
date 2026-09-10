# Author: Beryl Ghany
# Date: 09/10/26
# Purpose: Regression Analysis

# Import airquality dataset
training_data <- airquality

# Remove missing Ozone and Day values
training_data <- training_data[complete.cases(training_data[, c("Ozone", "Day")]), ]
rownames(training_data) <- NULL

# Plot and save the data as a scatter plot
scatter.smooth(x=training_data$Day,y=training_data$Ozone,main="OzoneVSday")

# Create a training dataset with 50% split
training_dataset <- training_data[1:58,]
test_dataset <- training_data[59:116,]

# Create regression model using Ozone and Day
regression_model <- lm(Ozone~Day,data=training_dataset)

# Predict Ozone using the test dataset
prediction_result <- predict(regression_model,test_dataset)

# Result of prediction
actual_prediction_values <- data.frame(cbind(actuals=test_dataset$Ozone,predicteds=prediction_result))
print(actual_prediction_values)

 actuals predicteds
59       50   38.12514
60       64   38.08634
61       59   38.04754
62       39   39.21166
63        9   39.17285
64       16   39.13405
65       78   39.09524
66       35   39.05644
67       66   39.01764
68      122   38.97883
69       89   38.94003
70      110   38.90122
71       44   38.78481
72       28   38.74601
73       65   38.70720
74       22   38.62960
75       59   38.59079
76       23   38.55199
77       31   38.51318
78       44   38.47438
79       21   38.43558
80        9   38.39677
81       45   38.31916
82      168   38.28036
83       73   38.24156
84       76   38.16395
85      118   38.12514
86       84   38.08634
87       85   38.04754
88       96   39.21166
89       78   39.17285
90       73   39.13405
91       91   39.09524
92       47   39.05644
93       32   39.01764
94       20   38.97883
95       23   38.94003
96       21   38.90122
97       24   38.86242
98       44   38.82362
99       21   38.78481
100      28   38.74601
101       9   38.70720
102      13   38.66840
103      46   38.62960
104      18   38.59079
105      13   38.55199
106      24   38.51318
107      16   38.47438
108      13   38.43558
109      23   38.39677
110      36   38.35797
111       7   38.31916
112      14   38.28036
113      30   38.24156
114      14   38.16395
115      18   38.12514
116      20   38.08634