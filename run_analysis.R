## load test data
xTest_Tbl<- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
yTest_Tbl<- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
subjTest_Tbl<-read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
colnames(subjTest_Tbl)<- c("subjectID")
## load train data
xTrain_Tbl<- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
yTrain_Tbl<- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
subjTrain_Tbl<-read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
colnames(subjTrain_Tbl)<- c("subjectID")

## reads features and activity_lables data
features_Tbl<- read.table(".\\UCI HAR Dataset\\features.txt")
activityLbl_Tbl <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")

## sets x train and test table names
colnames(xTest_Tbl) <- features_Tbl[,2]
colnames(xTrain_Tbl) <- features_Tbl[,2]
## adds activity names column to ytest and ytrain tables and set the tables names
yTestLbl_Tbl<- merge(yTest_Tbl, activityLbl_Tbl, by.x = "V1", by.y= "V1", all.x = TRUE)
                     
colnames(yTestLbl_Tbl) <- c("activityID", "activityLabel")
yTrainLbl_Tbl<- merge(yTrain_Tbl,activityLbl_Tbl,by.x = "V1", by.y = "V1", all.x = TRUE)
                     
colnames(yTrainLbl_Tbl) <- c("activityID", "activityLabel")

## merge test  and train data  to tables
testMerged_Tbl <- cbind(xTest_Tbl,yTestLbl_Tbl,subjTest_Tbl)
trainMerged_Tbl <- cbind(xTrain_Tbl,yTrainLbl_Tbl,subjTrain_Tbl)

## merge test and train tables
merged_Tbl <- rbind( trainMerged_Tbl, testMerged_Tbl )

## get mean , std, subjectID and activityLabel columns
colNames <- names(merged_Tbl)
mean_std <- (grepl("activityLabel" , colNames) | 
                      grepl("subjectID" , colNames) | 
                     grepl("mean.." , colNames) | 
                     grepl("std.." , colNames) )
subsetMeanStd_Tbl <-  merged_Tbl[, mean_std == TRUE]  

## create a tidy dataset by aggregating columns by mean values on subjectID
## and activity groups
tidydata_Tbl <- aggregate(.  ~subjectID + activityLabel , data = subsetMeanStd_Tbl
                          , mean)
tidydata_Tbl <- tidydata_Tbl[order(tidydata_Tbl$subjectID,
                                   tidydata_Tbl$activityLabel), ]

write.table(tidydata_Tbl, "tidyDataset.txt", row.name=FALSE)
write.csv(tidydata_Tbl, "tidyDataset.csv")                                                                
