# Getting-and-Cleaning-Data-Week-4-Assignment
Repository for Module 3: Getting and Cleaning Data Week 4.
#This README document contains the description of the script used to process the assignment dataset.

The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. 

The variable in the data Y indicates activity type the subjects performed during recording.

Unzip the source file with the data in a local directory of your machine (you can find the zip file here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

Copy the "run_analysis.R" script in your R working directory.

Make sure that all the files your are going to read from the unzipped folder, are placed in your working directory. So that R Studio will not act like an idiot. (HAHA)
MAIN FILES to use listed below:
features.txt 
activity_labels.txt
X_train.txt  
subject_train.txt
y_train.txt
X_test.txt
subject_test.txt
y_test.txt

Proceed to run the "run_analysis.R" script.
The main steps performed in the "run_analysis.R" script have been the following:

1.Read the data from each single .txt file using the read.table command
2.Compute for the measurements of the mean and standard deviation for your selected datasets.
3.Merge/Concatenate train and test data vertically using the rbind function.
4.Merge/Concatenate train data horizontally with its corrspondent subject and activity columns, using cbind function. Do the same with test data.

5.Create a new independent data set with the average of each variable for each activity and each subject, using the "summarize_all(funs(mean))" function.
6.Write the resulting data set into a .txt file names "tidydata.txt".
