# getNCleanData

Course Project for Getting and Cleaning Data ( getdata-030 )
############################################################

Readme file for the project file - run_analysis.R

(a) Merges the training and the test sets to create one data set.
(b) Extracts only the measurements on the mean and standard deviation for each measurement. 

(c) Uses descriptive activity names to name the activities in the data set
(d) Appropriately labels the data set with descriptive variable names. 
(e) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#############################################################

Steps and conditions for execution --- 
(a) The R file should be stored in the working directory
(b) It is assumed that the data has been downloaded already and stored in the folder called 'UCIHAR'. This is a sub-folder in the working directory. 
(c) It is assumed that a folder called 'result' is present in the working directory ( not in UCICHAR )
(d) Execute the command while in the working directory - source('run_analysis.R')
(e) The end result will be a file called `assignmentTidyData.txt'` in the 'result` folder.
(f) Each row in the final, clean dataset contains _subject_, _activity_, and _measures_ for all required features (i.e., mean or standard deviation).
