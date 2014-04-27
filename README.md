## Getting and Cleaning Data Project

Downloads data collected from the accelerometers, merge datasets
and creates new clean dataset which can be easily used further.

Scripts
* run\_analysis.R
* get\_data.R
* remove.R

run\_analysis.R calls get\_data.R to download and unzip necessary files.
It also calls remove.R to delete R object which are not needed anymore.

The results of run\_analysis.R are datasets
* dataset.csv (merged dataset before averaging of each variable for each activity and each subject)
* tidy\_dataset.csv (dataset with the average of each variable for each activity and each subject)
