Getting and Cleaning Data Course Project CodeBook
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.
The site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 The run_analysis.R script performs the following steps to clean the data:
 
1. Download and unzip the zip file with the initial data 
2. Read X_train.txt, y_train.txt and subject_train.txt from the "./data/train" folder and store them in "dataTrain", "dataTrainL",
  and  "dataTrainS" variables respectively.
3. Read X_test.txt, y_test.txt and subject_test.txt from the "./data/test" folder and store them in "dataTest", "dataTestL" and
  "dataTestS" variables respectively.
4. Bind "dataTrainL" (as "activity" column) and "dataTrainS" (as "subject" column ) variable to "dataTrain" set
5. Bind "dataTestL" (as "activity" column) and "dataTestS" (as "subject" column ) variable to "dataTrain" set
6. Concatenate "dataTest" to "dataTrain" to generate a 10299x563 data frame, "allData"; 
7. Read the features.txt file from the "/data" folder and store the data in a variable called "featuresTmp". Find indices of
  "featureTmp" elements corresponding to the measurements of the mean and standard deviation. Store the indices as vector xC [1:79].
8. Extract the measurements on the mean and standard deviation and store them as 10299x81 "dataMeanStd" data frame.
9. Clean the column names of the subset by removing the "()" and "-" symbols in the names, as well as make the first letter of "mean"
  and "std" a capital letter "M" and "S" respectively.
10. Read the activity_labels.txt file from the "./data"" folder and store the data in a variable called "activityLabels".
11. Transform the values of "dataMeanStd$activity" column according to the activity data frame. The "subject" column contains integers
  that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 79 columns contain different  measurements.
12. Write the "dataMeanStd" to the "merged_data.csv" file in current working directory.
13. Generate a data set by computing the average of each measurement for each activity and each subject. The resulting data set, "newD",
  contains 180 rows (30 unique subjects and 6 unique activities) and 81 rows
14. Rows of the "newD" set contain the activity variable, so the set cannot be considered as tidy. Therefore, a tidy data set, "tidyData",
  containing 30 rows (one for each subject) and 475 columns (measurements for all 6 activities) is produced
15.  Write "tidyData" to "tidyData.csv" file in current working directory.
