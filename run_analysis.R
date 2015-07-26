# The assignment is divided into 5 steps. The steps mentioned below here do not exactly match.
# I thought it is a better idea to read all the files in the first block of code.
# Each step has been marked seperately in the code below
# The initial idea was to make functions for each step but it became difficult
# to debug the entire flow. 
# Various methods were tried for each of the steps but only the final ones have 
# been retained for easier readability 


#STEP 1 - READING ALL FILES TOGETHER
#Step 1.1 Read the test dataset from the file subject_test into a table using read.table()
#Step 1.2 Read the training data set from the file subject_train into another table 
#Step 1.3 Repeat process for X_test and y_test from the folders test and similar files from the folder train
#Step 1.4 Read selected features from the file features.txt from the root folder
#Step 1.5 Read selected activity information from activity_labels into activityInfo. Will give list of 6 actiites only. 

testData <- read.table('./UCIHAR/test/subject_test.txt')
trainData <- read.table('./UCIHAR/train/subject_train.txt')

testXData <- read.table('./UCIHAR/test/X_test.txt')
trainXData <- read.table('./UCIHAR/train/X_train.txt')

testYData <- read.table('./UCIHAR/test/y_test.txt')
trainYData <- read.table('./UCIHAR/train/y_train.txt')

featuresSet <- read.table('./UCIHAR/features.txt', header=FALSE, col.names=c('id', 'name'))

activityInfo <- read.table('./UCIHAR/activity_labels.txt', header=FALSE, col.names=c('id', 'name'))



#STEP 2 - MERGING -
#Step 2.1 Merge the test and train data using rbind() Call the result mergedData
#Step 2.2 Repeat the merging process for X data and Y data calling the result mergedXData and mergedYData

mergedData <- rbind( trainData, testData)
names(mergedData) <- "subject"

mergedXData  <- rbind(trainXData, testXData)
mergedYData  <- rbind(trainYData, testYData)


#STEP 3 - Extraction -
#Step 3.1 Search for the columns which include 'mean' and 'std' from the featuresSet
#Step 3.2 Using these column names filter the data set from the mergedXData
#Step 3.3 Result has only 6 columns, 3 means and 3 std deviations 	

selectedColumnsOnly <- grep('mean\\(\\)|std\\(\\)', featuresSet$name)
filteredColData <- mergedXData[, selectedColumnsOnly]
names(filteredColData) <- featuresSet[featuresSet$id %in% selectedColumnsOnly, 2]


#STEP 3 - Labelling
#Step 3.1 Label the Y data set with the activity labels extracted in Step 1  

mergedYData[, 1] = activityInfo[mergedYData[, 1], 2]
names(mergedYData) <- "activity"

#STEP 4 - Data for processing
#Step 4.1 Now create the data which is not tidy but merged from all the sources.  Use cbind()

tempDataProcess <- cbind(mergedData, mergedYData, filteredColData)


#Step 5 - Tidying up :-) 
#Step 3.1 Search for the columns which include 'mean' and 'std' from the featuresSet
#Step 3.2 Using these column names filter the data set from the mergedXData
#Step 3.3 Result has only 6 columns, 3 means and 3 std deviations 	

actualMeasurements <- tempDataProcess[, 3:dim(tempDataProcess)[2]]
finalTidyData <- aggregate(actualMeasurements, list(tempDataProcess$subject, tempDataProcess$activity), mean)
names(finalTidyData)[1:2] <- c('subject', 'activity')
write.table(finalTidyData, "./result/assignmentTidyData.txt")

