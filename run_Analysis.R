## Getting and Cleaning Data Final Project
#INSTRUCTIONS
#You should create one R script called run_analysis.R that does the following.

#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement.
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names.
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Step 1 Call out the libraries used
library(dplyr)
library(plyr) 
path <- 'C:/Users/KEVIN/Documents/getdata_2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset'
#Step 2 Data Preparation

# read train data
X_train <- read.table("C:/Users/KEVIN/Documents/getdata_2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("C:/Users/KEVIN/Documents/getdata_2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt")
sub_train <- read.table("C:/Users/KEVIN/Documents/getdata_2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

# read test data
X_test <- read.table("C:/Users/KEVIN/Documents/getdata_2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("C:/Users/KEVIN/Documents/getdata_2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt")
sub_test <- read.table("C:/Users/KEVIN/Documents/getdata_2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

# read data description
variable_names <- read.table("C:/Users/KEVIN/Documents/getdata_2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/features.txt")

# read activity labels
activity_labels <- read.table("C:/Users/KEVIN/Documents/getdata_2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")


#Step 3 Contatenate/Merge training and test sets Description: rbind is the R studio equivalent of the Concatenate Matrix Function that MATLAB has. 
X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
sub_total <- rbind(sub_train, sub_test)

#Step 4 Call out the Mean and Standard Deviation data for each entry.

selected_var <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X_total <- X_total[,selected_var[,1]]

#Step 5 Input descriptive acitivity names for the entries in the data set

colnames(Y_total) <- "activity"
Y_total$activitylabel <- factor(Y_total$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_total[,-1]

#Step 6 Label the data with descriptive variable names. Description: This will call out all entries in the X_total file.
colnames(X_total) <- variable_names[selected_var[,1],2]
colnames(sub_total) <- "subject"
total <- cbind(X_total, activitylabel, sub_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_all(funs(mean))

#Step 7 Create a .txt file containing the processed final dataset.

write.table(total_mean, file = "C:/Users/KEVIN/Documents/getdata_2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
