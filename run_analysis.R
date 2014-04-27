## Getting and Cleaning Data Project (https://class.coursera.org/getdata-002)
##
## Martin Kersner, m.kersner@gmail.com
##
## created: 04/25/2014
## updated: 04/27/2014

library(reshape2)
source("get_data.R")
source("remove.R")

# downloads and unzips data
get_data()

# load and combine training data
X_train <- read.table("UCI\ HAR\ Dataset/train/X_train.txt")
y_train <- read.table("UCI\ HAR\ Dataset/train/y_train.txt")
subject_train <- read.table("UCI\ HAR\ Dataset/train/subject_train.txt")
train <- cbind(y_train, subject_train, X_train)

# load and combine testing data
X_test <- read.table("UCI\ HAR\ Dataset/test/X_test.txt")
y_test <- read.table("UCI\ HAR\ Dataset/test/y_test.txt")
subject_test <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
test <- cbind(y_test, subject_test, X_test)

# combining train and test data
full_dataset <- rbind(train, test)

# removing unnecessary objects from memory
remove("train|test")

# loading names of measured features
features <- read.table("UCI\ HAR\ Dataset/features.txt")

# looking for features calculated by mean() and std()
mean_std_features <- as.vector(grep("mean\\(\\)|std\\(\\)", features[, 2]))

# vector of numeric values which are pointing at desired collumns of full dataset
complete_features <- c(1, 2,  mean_std_features + 2)

# selecting the right columns
dataset <- full_dataset[, complete_features]

# removing unnecessary objects from memory
remove("full_dataset")

# appropriately labels the data columns
names(dataset) <- c("activity", "subject", as.vector(features[mean_std_features, 2]))

# using descriptive activity names to name the activities in the dataset
activity_labels <- read.table("UCI\ HAR\ Dataset/activity_labels.txt")
dataset <- merge(dataset, activity_labels, by.x="activity", by.y="V1")
dataset$activity <- dataset$V2

# deleting unnecessary column
dataset$V2 <- NULL

# saving data
write.table(dataset, "dataset.csv", row.names=FALSE)

# melting, summarizing and saving tidy dataset 
dataset_melt <- melt(dataset, id.vars=c("activity","subject"))
tidy_dataset <- dcast(dataset_melt, activity + subject ~ variable, mean)
write.table(tidy_dataset, "tidy_dataset.csv", row.names=FALSE)

# removing unnecessary objects from memory
remove("activity_labels|dataset_melt|features|complete_features|mean_std_features")