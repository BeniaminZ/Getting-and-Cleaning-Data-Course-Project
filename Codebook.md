# Code Book

This code book describes the steps to creating a tidy dataset from the oroginal test and train data porvided in the Course Project

## Steps

1- Reading the test data (x_test, y_test, subject) \
2- Reading the features and activity label files (features and ActLalel) \
3- Reading the train data (x_train, y_train, subject) \
4- Creating filter using grep function to select features with mean () and std () \
5- Applying filter to x_test and x_train \
6- Creating testdata and traindata tables \
7- Binding testdata and traindata to create big data table \
8- Adding labels according to ActLebel table to data \
9- Reshaping data using melt function based on "code" and "subject" variables \
10- Obtaining the mean of each variable for each subject using dcast function \
11- Writing the tidy_data to a txt file