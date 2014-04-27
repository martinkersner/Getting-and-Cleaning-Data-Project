## Code Book

Data collected from accelerometers which are going to be used can be downloaded
from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
Data which need to be merged together are saved in these files:

* train/X\_train.txt
* train/y\_train.txt
* train/subject\_train.txt
* test/X\_test.txt
* test/y\_test.txt
* test/subject\_test.txt
* features.txt
* activity\_labels.txt

X\_train.txt and X\_test.txt contain 561 features.
y\_train.txt and y\_test.txt contain only one variable which determines what type of movement is described by appropriate data from X\_\*.txt.
This column is later called activity.
X\_subject\_train.txt and X\_subject\_test contain also one column whose values identify observed subject.
X\_\*.txt, y\_\*.txt and subject\_\*.txt are combined together by collumns.
These two (train, test) merged dataset are subsequently combined together by rows.

Because we are interested only in some features of newly formed dataset, columns are filtered and only the columns whose name contain "mean()" or "std()" remain.
The name of features are taken from file features.txt.
The dataset now consist from 68 columns (66 mean or std columns, one subject column and one activity column).

Activity column which consist from number of activity is decoded to description of activity according to file activity\_labels.txt.
Available activities are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.

At last the tidy data set is created with the average of each variable for each activity and each subject. 

First column of tidy dataset is header.
Since there are 30 different subjects and 6 different activities for each of them, the dimensionality of dataset is 180 rows 68 columns.
