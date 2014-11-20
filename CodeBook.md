#Feature Selection, Meaning of variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ per Activity and Subject. 

*Activity* contains 6 different types - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.
This database takes 30 different *Subjects* for its measurement. Each subject performas above six activities and data is measured with below rules.

These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Activity
Subject
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

`*-mean-*`: Mean value of each measurment per activity and subject
`*-std-*` : Standard deviation of each measurment per activity and subject

For example, first few variable names for feature set look like below:
* tBodyAcc-mean-X
* tBodyAcc-mean-Y
* tBodyAcc-mean-Z
* tBodyAcc-std-X
* tBodyAcc-std-Y

#Transformations done to get this tidydata set
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
2. check its colume number, names and consider relocation 
3. create empty matrix to stack up each splitted subsets with its mean (per subject and activity)
4. rename colume names to remove (), keep its upper case as making all lower case is not easy to read.
5. go through each category (list this case) and get its colume means and add into matrix
6. return final matrix as tidy data set

