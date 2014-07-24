#Getting and Cleaning Data Project



##Project Objective
You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set. 
4. Appropriately labels the data set with descriptive variable names.  
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##Executing the Script
1. Clone the repository.
2. Place the `UCI HAR Dataset` in the said repository.
3. Set the repository as your working directory using `setwd()` function and check if `reshape2` is installed in the library.
4. Run `source("run_analysis.R")`, then it will generate a new file `tiny data.txt` in your working directory.