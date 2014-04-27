## Getting and Cleaning Data
## Martin Kersner, m.kersner@gmail.com
##
## 04/25/2014

setwd("..//COURSERA-Getting-and-Cleaning-Data")

source("get_data.R")
#source("remove.R")
get_data()

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(y_train, subject_train, X_train)

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(y_test, subject_test, X_test)

# combining train and test datasets
full_dataset <- rbind(train, test)

# removing unnecessary objects from memory
rm(list=ls(pat="train|test"))

features <- read.table("UCI HAR Dataset/features.txt")
mean_std_features <- c(1, 2, as.vector(grep("mean\\(\\)|std\\(\\)", features[,2])) + 2)

dataset <- full_dataset[, mean_std_features]
rm(list=ls(pat="full_dataset"))