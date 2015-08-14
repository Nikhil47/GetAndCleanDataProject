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
