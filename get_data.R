## Getting and Cleaning Data
## Martin Kersner, m.kersner@gmail.com
##
## 04/25/2014

get_data <- function()
{
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI_HAR_Dataset.zip", "curl")
  #unz("UCI_HAR_Dataset.zip", "UCI_HAR_Dataset")
}