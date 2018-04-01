library(tidyverse)
library(caret)

genderSubmission <- read_csv('./data/gender_submission.csv')
test <- read_csv('./data/test.csv')
train <- read_csv('./data/train.csv')

train$Survived <- paste0('val_', train$Survived)
genderSubmission$Survived <- paste0('val_', genderSubmission$Survived)
train$Pclass <- paste0('val_', train$Pclass)
test$Pclass <- paste0('val_', test$Pclass)

fitControl <- trainControl(
  method = "repeatedcv",
  number = 10,
  repeats = 1)

fit <- train(Survived ~ Pclass + Sex, data = train, 
                 method = "xgbTree", 
                 trControl = fitControl,
                 verbose = TRUE)

varImp(fit)

predictions <- predict(fit, newdata = test)

confusionMatrix(predictions, as.factor(genderSubmission$Survived))






