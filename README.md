#GetAndCleanDataProject

This project aims at getting data from an online source and cleaning the data set. 

The run_analysis.R script does the following tasks:
<li> Merges the training and the test sets to create one data set.
<li> Extracts only the measurements on the mean and standard deviation for each measurement. 
<li> Uses descriptive activity names to name the activities in the data set
<li> Appropriately labels the data set with descriptive variable names. 
<li> From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Executing the script
THe run_analysis.R is the only script required and present to download and process the data to transform it into the required format. The details of the workings of the script can be found in the codebook.

#Result of the script
The tidy.txt contains the cleaned data set downloaded from the Nike website. It consists of *89 variables* and *180 rows* (header excluded)
