# What is done to get this tidydata set
## Basic Assumption
run_analysis.R script assume whole Samsung Galaxy S smartphone data is present in working directory as folder name, `"UCI HAR Dataset"` as is when given data is unzipped.

## Step 0
run_analysis.R will read below,
* features.txt : for whole data names, colume names
* X_train.txt, X_test.txt : train and test measurment data itself
* subject_traintxt, subject_test.txt : subject number id who performed each observation in above data
* y_train.txt, y_test.txt : activity type which is performed for each measurement
* activity_labels.txt : y_train.txt and y_test.txt has number for activity type, its descriptive name is logged in this file.

## Step 1
Merges the training and the test sets to create one data set.
 1. row bind X_train and X_test
 2. row bind subject_train and subject_test
 3. row bind y_train and y_test
 4. column bind above three sets

## Step 2 (step 4 in Course Project)
Appropriately labels the data set with descriptive variable names.
 1. add colnames to data set above from features, add two more columns Subject and Activity.

## Step 3 (step 3 in Course Project)
Uses descriptive activity names to name the activities in the data set
 1. compare dataset$Activity values with activity_lables and assign descriptive names

## Step 4 (step 2 in Course Project)
Extracts only the measurements on the mean and standard deviation for each measurement.
 1. use grepl to filter colume names which has mean(, std( and Subject and Activity.
 2. use that filter to entire dataset and extract those columes only.

## Step 5 (step 5 in Course Project)
From the data set in step 4, creates a second, independent tidy data set
with the average of each variable for each activity and each subject.
 1. use split function to devide data set above by Subject and Activity
 2. check its colume number, names and bring Activity and Subject in front
 3. create empty matrix to stack up each splitted subsets with its mean (per subject and activity)
 4. rename colume names to remove (), keep its upper case as making all lower case is not easy to read.
 5. go through each category (list this case) and get its colume means and add into matrix
 6. return final matrix as tidy data set

