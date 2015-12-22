###### 0. Load libraries needed and download dataset

library(dplyr)
library(tidyr)

#download and unzip the file
setwd("~/Coursera/Getting_Cleaning_Data/project/")
file.url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file.url,"./tech_wear.zip",method="curl")
unzip("tech_wear.zip")

######  1. Merges the training and the test sets to create one data set.
#test
X.test<-read.table("./UCI HAR Dataset/test/X_test.txt") 
Y.test<-read.table("./UCI HAR Dataset/test/Y_test.txt")
subject.test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
test <- cbind(SUBJECT=subject.test,ACTIVITY=Y.test, X.test)

#train
X.train<-read.table("./UCI HAR Dataset/train/X_train.txt")
Y.train<-read.table("./UCI HAR Dataset/train/Y_train.txt")
subject.train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
train <- cbind(subject.train,Y.train,X.train)

both <- rbind(test,train)
names(both)[c(1,2)]<- c("SUBJECT","ACTIVITY")

######  2. Extracts only the measurements on the mean and standard deviation for each measurement. 

#txt file that contains the metadata. The variable names corresponding to the columns of 
# X.train and X.test
features <- read.table("./UCI HAR Dataset/features.txt")
feat.num <- grep("mean\\(\\)|std\\(\\)",tolower(features$V2)) #Use \\ to mask the ()
feat.name <- as.character(features$V2[feat.num]) #To be used later in step 4

V <- rep("V",length(feat.num))
col.select <- paste0(V,feat.num) #All the column names that we want to keep from our merged dataset

ds <- both[,c("SUBJECT","ACTIVITY",col.select)]

######  3. Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("ACTIVITY","LABEL")

ds <- inner_join(ds,activity_labels,by="ACTIVITY") %>% 
  select(SUBJECT,LABEL, V1:V543, -ACTIVITY) %>%
  rename(ACTIVITY=LABEL)

######  4. Appropriately labels the data set with descriptive variable names. 

# Instead of having the variables to remain as V1,V2,V3,... replace them with
# the descriptive feature names given from features.txt file

names(ds) <- c("SUBJECT","ACTIVITY",feat.name)

######  5. From the data set in step 4, creates a second, independent tidy data 
######    set with the average of each variable for each activity and each subject.

tidy.ds <- ds %>% gather(VAR, VALUE,-c(SUBJECT,ACTIVITY)) %>%
                  separate(VAR,into=c("FEATURE","STAT","AXIAL"))
            
      
