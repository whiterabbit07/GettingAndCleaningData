tidyData<-{
#  install.packages("downloader")
#  library(downloader)
#  install.packages("stringr")
#  library(stringr)
#  install.packages("tidyr")
#  library(tidyr)
#  install.packages("dplyr")
#  library(dplyr)
  dir.exists("./data")
  dir.create("./data")
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download(fileUrl, dest="dataset.zip", mode="wb") 
  unzip("dataset.zip",exdir="./data")
#
  dataTrain<-read.table("data/UCIHAR_Dataset/train/X_train.txt")
  dataTrainL<-read.table("data/UCIHAR_Dataset/train/y_train.txt")
  dataTrainS<-read.table("data/UCI HAR Dataset/train/subject_train.txt")
  dataTest<-read.table("data/UCI HAR Dataset/test/X_test.txt")
  dataTestL<-read.table("data/UCI HAR Dataset/test/y_test.txt")
  dataTestS<-read.table("data/UCI HAR Dataset/test/subject_test.txt")

  allTrain<-cbind(activity=dataTrainL$V1,subject=dataTrainS$V1,dataTrain)
  allTest<-cbind(activity=dataTestL$V1,subject=dataTestS$V1,dataTest)
  allData<-rbind(allTrain,allTest)

  featuresTmp<-read.table("data/UCI HAR Dataset/features.txt")
  activityLabels<-read.table("data/UCI HAR Dataset/activity_labels.txt")

# find indexes of the columns containing means and std values 
  l1<-grep("std",featuresTmp$V2)
  l2<-grep("mean",featuresTmp$V2)
  indexFeatures<-sort(c(l1,l2))
  newColNames<-c("activity","subject",as.character(featuresTmp$V2))     #change column names
  colnames(allData)<-newColNames
  dataMeanStd<-allData[,c(1,2,(indexFeatures+2))]  # extract measurements of mean and std

  newRowLabels<-activityLabels$V2[dataMeanStd$activity] # create a vector of activity labels
  dataMeanStd<-mutate(dataMeanStd,activity=as.character(newRowLabels))  # add the new activity column to the data set
# tidy the dataset
  colnames(dataMeanStd)<-sub("mean","Mean",colnames(dataMeanStd)) # substitute "mean" with "Mean" in column names
  colnames(dataMeanStd)<-sub("std","Std",colnames(dataMeanStd))   # substitute "std" with "Std" in column names
  colnames(dataMeanStd)<-str_replace_all(colnames(dataMeanStd), "[[:punct:]]", "")  # remove all symbols from column names
  write.csv(dataMeadStd,"merged_data.csv")
#
  newD<-dataMeanStd %>% group_by(activity,subject) %>% summarise_each(funs(mean))  #compute average values for each activity and subject
  tidyData<-newD %>% gather(variable,value,-(activity:subject)) %>% unite(newC,activity,variable,sep="_",remove=TRUE) %>% spread(newC,value)  # create a tidy dataset
  write.csv(tidyData,"tidyData.csv")
  head(tidyData)
}