library(tidyverse)

genderSubmission <- read_csv('./data/gender_submission.csv')
test <- read_csv('./data/test.csv')
train <- read_csv('./data/train.csv')

View(train)
View(test)

str(train)