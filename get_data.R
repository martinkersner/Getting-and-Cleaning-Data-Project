## Getting and Cleaning Data Project (https://class.coursera.org/getdata-002)
##
## Martin Kersner, m.kersner@gmail.com
##
## created: 04/25/2014
## updated: 04/27/2014

# Function tests if data are already downloaded and unzipped, otherwise it will download and uzip them.
get_data <- function()
{
  if (!file.exists("UCI\ HAR\ Dataset"))
  {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI_HAR_Dataset.zip", "curl")
    unzip("UCI_HAR_Dataset.zip")
  }
}