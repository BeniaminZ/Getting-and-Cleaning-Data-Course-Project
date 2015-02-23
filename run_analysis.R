## instal the following packages
install.packages ("data.table")
install.packages ("stringr")
install.packages ("reshape2")

library("data.table")
library("stringr")
library("reshape2")


## Read the test data
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features[,2], check.names=FALSE)
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt", col.names="code")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

features<-read.table("./UCI HAR Dataset/features.txt")
ActLabel<-read.table("./UCI HAR Dataset/activity_labels.txt",  col.names=c("code", "activity"))

## Read the train data
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt",col.names=features[,2], check.names=FALSE)
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt", col.names="code")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="subject")

## Filtering the features for mean () and std () values
filter<-grep("mean\\(|std\\(", features[, 2])

## Applying filter to test and train data
x_test<-x_test[, filter]
x_train<-x_train[, filter]

## Creating testdata and traindata 
testdata<-cbind(y_test, subject_test, x_test)

traindata<-cbind(y_train, subject_train, x_train)

## Merge test and train data
data<-rbind(testdata, traindata)

## Descriptive activity names to name the activities in the data set
data$code<-factor(data$code, levels=ActLabel$code, label=ActLabel$activity)

## Melting data to reshape 
melt_data<-melt(data, id=c("code", "subject"))

## Tidy data set with the average of each variable for each activity and each subject
tidy_data <- dcast(melt_data, code + subject ~ variable, mean)

## write tidy_data as txt file
write.table(tidy_data, file="tidy_data.txt", quote=FALSE, row.names=FALSE, sep="\t")
