##Read in the tables
X_test<-read.table("UCI HAR dataset/test/x_test.txt")
Y_test<-read.table("UCI HAR dataset/test/Y_test.txt")
Y_train<-read.table("UCI HAR dataset/train/Y_train.txt")
X_train<-read.table("UCI HAR dataset/train/X_train.txt")
subject_train<-read.table("UCI HAR dataset/train/subject_train.txt")
subject_test<-read.table("UCI HAR dataset/test/subject_test.txt")
activity_labels<-read.table("UCI HAR dataset/activity_labels.txt",stringsAsFactors=FALSE)
features<-read.table("UCI HAR dataset/features.txt",stringsAsFactors=FALSE)
##Merges the training and the test sets to create one data set
X<-rbind(X_test,X_train)
Y<-rbind(Y_test,Y_train)
subjects<-rbind(subject_test,subject_train)

##Extracts only the measurements on the mean and standard deviation for each measurement
library(stringr)
meanstd<-X[which(str_detect(features[,2],"std")|str_detect(features[,2],"mean"))]

##Uses descriptive activity names to name the activities in the data set
YLabels<-activity_labels[Y[,1],2]

##Appropriately labels the data set with descriptive variable names. 
colnames(meanstd)<-features[which(str_detect(features[,2],"std")|str_detect(features[,2],"mean")),2]

##Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
dataset<-cbind(subjects,YLabels,meanstd)
