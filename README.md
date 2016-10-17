# GettingAndCleaningData
Getting and Cleaning Data Course Project

This project contains the run_analysis.R script.
 
The script uses the "downloader", "stringr", "tidyr", and "dplyr" packages, which should be installed prior to running the script

Assuming that an url to a dataset is provided the script does the following:

1. Gets the initial data
	- creates a directory "data"
	- stores the Url in variable "fileUrl"
	- installs the "downloader" package
	- downloads and unzip the dataset

2. Read data files for the test and training sets along with the feature and activity label files 

3. Adds activity and subject data to the test and training sets and combines the resulting sets into a data frame (allData)

4. Reformats the data frame
	- Changes column names V1,V2, etc. to corresponding feature names
	-  Identifies columns containing mean and std values 
	- creates a new data frame called dataMeanStd that contains only activity, subject and  mean and std measurements columns

5. Modifies columns names of the dataMeanStd set (e.g., by removing special characters)

6. computes average values for each activity and subject and stores them as the "newD" data frame

7.  Creates a tidy data set, "tidyData", containing 30 rows (one for each subject) and 475 variables (measurements for all six activities)
