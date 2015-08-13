#library(data.table)

#data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(data_url, "project.zip", method = "curl")

#if(!dir.exists("getcleandata")){
#    dir.create("getcleandata")
#    setwd("getcleandata")
#}

#unzip("~/project.zip")
#setwd(paste(getwd(), "UCI HAR Dataset", sep = "/"))

# Reading "readings"
x_train <- data.table(read.table("train/X_train.txt"))
x_test <- data.table(read.table("test/X_test.txt"))
x.readings <- rbindlist(list(x_train, x_test))
rm(x_train, x_test)

# Reading activity labels
x_train_lab <- data.table(read.table("train/y_train.txt"))
x_test_lab <- data.table(read.table("test/y_test.txt"))
x.labels <- rbindlist(list(x_train_lab, x_test_lab))
rm(x_train_lab, x_test_lab)

# Loading features into data.table as transpose using t()
feature.names <- data.table(t(read.table("features.txt")))
# Replace all punctuation signs in the feature names
feature.names <- gsub("[[:punct:]]", "", feature.names[2,])
# Replace all upper case letters with lower case letters
feature.names <- tolower(feature.names)

# Giving names to the selected columns
setnames(x.readings, feature.names)
# Binding the labels to the readings
x.data <- cbind2(x.labels, x.readings)
# Giving name to the label columns
setnames(x.data, "V1", "activitylabels")
rm(x.labels, x.readings, feature.names)

# Choosing columns with mean or std
wantedcols <- grep("mean|std", colnames(x.data), value = T)
wantedcols <- c(wantedcols, "activitylabels")
x.data <- x.data[, wantedcols, with = F]

activityarray <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
activityarray <- tolower(activityarray)

# Creating a new column for description of activities according to activity labels
x.data[, activitydescription := activityarray[activitylabels]]
rm(activityarray)

subject_train <- data.table(read.table("train/subject_train.txt"))
subject_test <- data.table(read.table("test/subject_test.txt"))
subjects <- rbindlist(list(subject_train, subject_test))
rm(subject_test, subject_train)

x.data <- cbind2(x.data, subjects)
setnames(x.data, old = "V1", new = "subjects")
wantedcols <- colnames(x.data)
rm(subjects)

# Step 4 dataset is now ready

tidy.x.data <- x.data[order(activitydescription, subjects), lapply(.SD, mean), by = list(activitydescription, subjects)]
write.table(tidy.x.data, file = "tidy.txt", row.names = F)
rm(x.data, tidy.x.data)