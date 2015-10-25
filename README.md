# This readme file describes the content of the file run_analysis.R.

## The file loads the data from the following files:

* features.txt
* activity_labels.txt
* ./test/X_test.txt
* ./test/subject_test.txt
* ./test/y_test.txt
* ./train/X_train.txt
* ./train/subject_train.txt
* ./train/y_train.txt

The files mentioned above can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A description of the data set including the variables can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

# The R scribt **run_analysis.R** performs the following operations on the data sets (description is taken from the assignment):

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


For detailed descriptions of the steps please see the comments in the file.

