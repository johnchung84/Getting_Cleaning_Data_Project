# Getting_Cleaning_Data_Project
Repository for the project of Getting and Cleaning Data course

## Step 0. Load libraries needed and download dataset
* Libraries needed are "dplyr" and "tidyr"
* Downloaded the entire zip file, then using the **unzip** function unzipped the file
  
## Step 1. Merges the training and the test sets to create one data set.
* First concatenated the datasets(X, Y, subject) hoziontally within *test* and *train* datasets
* Then combinded the concatenated datasets vertically to have a full dataset
* Then changed the column names for the first 2 columns since the first 3 are all named "V1"

## Step 2. Extract only the measurements on the mean and standard deviation for each measurement. 
* Read in the txt file that contains the feature names to get the descriptive names
* From that used the **grep** function to locate only the feature names that have "mean()" and "std()" in it
* Subsetted the dataset from Step 1. to only those variables of interest

## Step 3. Uses descriptive activity names to name the activities in the data set
* Changed undescriptive activity number to a descriptive value from the activity_labels.txt file

## Step 4. Appropriately labels the data set with descriptive variable names. 
* Changed the variables names from undescriptive V1,V2,V3,... to descriptive ones (tBodyAcc-mean-X,...) from the features.txt file

## Step 5. From the data set in step 4, creates a second, independent tidy data 
######    set with the average of each variable for each activity and each subject.
* Reshape the data using the **gather** function from wide format to long format as the columns contain 3 different variables it's measuring
* Separate the values of the gathered keys to 3 different columns (FEATURE, STAT, AXIAL)
* Then take the average all the measurements by it's unique combination (SUBJECT, ACTIVITY, FEATURE, STAT, AXIAL) which is done by group_by and then summarize
* Lastly, take the STAT column and spread the values into it's own unique column
