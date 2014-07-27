##Getting and cleaning data - course project repository
This repository contains the R script and final data set for the course project for getting and cleaning data course on coursera
The following files can be found in this directory
run_analysis.R - the script used for creating the final tidy data set.
codebook.txt - the code book that explains the variables in the tidy data set
##Script details
The script reads the datasets from files. 
It then merges the corresponding test and training data sets into one data frame.
The script creates a subset of the readings using the string pattern matching to look for variables with "mean" and "std" in their names. The which function is used to find the column indices where these variables are present.

The script creates a data frame which uses the activity labels instead of the activity code, by looking up the label in the activity label data frame for each activity code.

The script finally merges the two data frames above with the subject data to create the final set
