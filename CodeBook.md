## Study Design
* Collected the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* This zip file contained a folder called "UCI HAR Dataset" which contains the following:
  + activity_labels.txt - lookup dataset that contains the activity labels corresponding to the activity code
  + features_info.txt - info on all the features and the data that was collected
  + features.txt - name of the features collected in the X datasets
  + README.txt
  + test folder
    + Inertial Signals
    + subject_test.txt - subjects selected for test
    + X_test.txt - data collected of the subjets in test
    + Y_test.txt - activities that subjects in test carried out
  + train folder
    + Inertial Signals
    + subject_train.txt - subjects selected for train
    + X_train.txt - data collected of the subjets in train
    + Y_train.txt - activities that subjects in train carried out
* Used the **read.table** function to read the data from the txt files
* Though initially it was not entirely clear how all these txt files related to each other, looking at the dimensions of the data made it clear

## Variables
* For the purposes of this project only selected variables that measured the mean or std
* That came down to be 66 features out of 561
* All the variables follow this basic structure
  * [feature]-[stat]-[axial]
  * feature
    * t for time or f for frequency domain signal
    * Body for body motion component and Gravity for the gravitational motion component of the accelerometer signal
    * Acc for accelerometer and Gyro for gyroscope
  * stat
    * mean or std
  * axial
    * x,y, or z axis
    * Some features measured do not have this component to it
