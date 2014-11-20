## Step 0 - Load all data files

# variable names
features<-read.table("UCI HAR Dataset/features.txt", sep=" ")
# data
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
# subject
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt", sep=" ")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt", sep=" ")
# activity
y_train<-read.table("UCI HAR Dataset/train/y_train.txt", sep=" ")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt", sep=" ")
#its descriptive name
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt", sep=" ")

## Step 1
## Merges the training and the test sets to create one data set.
data     <-rbind(X_train, X_test)
subject  <-rbind(subject_train, subject_test)
activity <-rbind(y_train, y_test)
dataset  <-cbind(data,subject,activity)

## Step 4
## Appropriately labels the data set with descriptive variable names.
colnames(dataset) <- c(as.character(features[,2]), "Subject","Activity")

## Step 3
## Uses descriptive activity names to name the activities in the data set
for (i in 1:nrow(activity_labels)) {
    dataset$Activity[dataset$Activity==i] <- as.character(activity_labels[i,2])
}

## Step 2
## Extracts only the measurements on the mean and standard deviation
## for each measurement.
filter <- grepl("std\\(|mean\\(|Subject|Activity", colnames(dataset))
subset <- dataset[,filter]

## Step 5
## From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.
byActSub <- split(subset, list(subset$Subject, subset$Activity))

tidydata<-matrix(ncol=68,nrow=0,dimnames=list(NULL, c(colnames(subset[68:67]),
                                                      colnames(subset[1:66]))))
colnames(tidydata) <- gsub("\\(|\\)","",colnames(tidydata))

for (i in 1:length(byActSub)) {
    tidydata<-rbind(tidydata, c(byActSub[[i]][1,68:67],
                                colMeans(byActSub[[i]][,1:66])) )
}

tidydata