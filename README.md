#GetAndCleanDataProject

This project aims at getting data from an online source and cleaning the data set. 

The run_analysis.R script does the following tasks:
<li> Merges the training and the test sets to create one data set.
<li> Extracts only the measurements on the mean and standard deviation for each measurement. 
<li> Uses descriptive activity names to name the activities in the data set
<li> Appropriately labels the data set with descriptive variable names. 
<li> From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Workings of the script

Step - 1 : Download the zipped data set from the given URL

Step - 2 : Create a new working directory called "getcleandata" and extract the contents there.

Step - 3 : From the train and test directories load the gyroscope and accelerometer readings into a data table after rbind.

Step - 4 : From the train and test directories get the activity labels and load it into a data table after rbind.

Step - 5 : Column bind the labels and the readings tables.

Step - 6 : Load the names of the columns from the features.txt.

Step - 7 : Clean the feature names by removing unwanted punctuations and converting it to lower case.

Step - 8 : From all the readings choose the columns which have mean or std in the name.

Step - 9 : Add detailed acitivity description in a separate column.

Step - 10 : As the last requirement suggests, create a new data table after grouping and taking averages of all the columns.

#Result of the script
The tidy.txt contains the cleaned data set downloaded from the Nike website. It consists of *89 variables* and *180 rows* (header excluded)
