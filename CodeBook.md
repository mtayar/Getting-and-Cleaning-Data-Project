## Process for Successful Execution of R Code

The source data  should be downloaded from link below and unzipped in the working directory of R Studio (same of the R code). Once unzipped run the R script. 

#About source data

The source data for this project  was obtained from data obtained from  wearable computing devices and used for Human Activity Recognition. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## About R script

File with R code "run_analysis.R" perform the following steps (in accordance assigned task of course work):

Merging the training and the test sets to create one data set.
   Reading files
  - Reading train tables
  - Reading test tables
  - Reading feature vector
  - Reading activity labels
  - Adding the label column for the y test and train tables
  - Assigning column names for x ,subject and y tables

  Merging data
  - Merging all test data in one table
  - Merging all train  data in one table
  - Merging all test and train data in one table


Extracting only the measurements on the mean and standard deviation for each measurement

- Reading column names
- Create vector for defining ID, label, mean and standard deviation
- Create a subset from merged_Tbl using the filter above

Creating a second, independent tidy data set with the average of each variable for  each subject and each activity

- Making second tidy data set
- Writing second tidy data set in txt  and csv files
NOTE : The code takes for granted all the data is present in the same folder, un-compressed and without names altered.

## About variables:

x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
x--_Tbl, y--_Tbl and subj--_Tbl (--: Test,Train) are the tables loaded from the previous datasets to further analysis.
features contains the correct names for the x_data dataset, 
activity_labels contains the data downloaded from the file
trainMerged_Tbl contains the merged training data
testMerged_Tbl contains the merged test data
merged_Tbl contains the copmplete merged data
ColNames stores the merged_Tbl  data into new table
mean_std contains the following vectors(activityLabel, SubjectID, mean..,std..) from ColNames
subsetMeanStd_Tbl contains the sorted data as per mean_Std

tidyDataset contains the aggregated data as per activityID and subjectId and then it is ordered in ascending order as per subjectID, activityID