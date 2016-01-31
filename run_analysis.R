library(dplyr)

X_test_table<-read.table("UCI HAR Dataset/test/X_test.txt",sep="")
y_test_table<-read.table("UCI HAR Dataset/test/Y_test.txt",sep="")
colnames(y_test_table)<-c("Activity ID")
subject_test_table<-read.table("UCI HAR Dataset/test/subject_test.txt",sep="")
colnames(subject_test_table)<-c("Subject ID")
Test_table<-cbind(X_test_table,cbind(y_test_table,subject_test_table))
rm(X_test_table,y_test_table, subject_test_table)

X_train_table<-read.table("UCI HAR Dataset/train/X_train.txt",sep="")
y_train_table<-read.table("UCI HAR Dataset/train/Y_train.txt",sep="")
colnames(y_train_table)<-c("Activity ID")
subject_train_table<-read.table("UCI HAR Dataset/train/subject_train.txt",sep="")
colnames(subject_train_table)<-c("Subject ID")
Train_table<-cbind(X_train_table,cbind(y_train_table,subject_train_table))
rm(X_train_table, y_train_table, subject_train_table)

full_data<- rbind(Test_table, Train_table)

features<-read.table("UCI HAR Dataset/features.txt", sep="")
mean_id<-grep("mean()", features$V2)
std_id<-grep("std()", features$V2)
extract_cols<- sort(as.numeric(c(mean_id, std_id)))
extracted_data<-full_data[,c(563,562, extract_cols)]
rm(Test_table, Train_table, full_data, mean_id, std_id)

activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
extracted_data[,2]<-activity_labels[extracted_data[,2],2]
cnames<-c("Activity","Subject.ID", as.character(features[extract_cols,2]))
cnames<-gsub("-", ".", cnames)
cnames<-gsub("^t", "Time.",cnames)
cnames<-gsub("Acc", ".Acceleration", cnames)
colnames(extracted_data)<-cnames

tidy_data<-extracted_data %>%group_by(Subject.ID,Activity)%>%summarise_each(funs(mean))
rm(activity_labels, extracted_data, features, extract_cols, cnames)

write.table(tidy_data, "tidy data.txt", row.names = FALSE)
##output written to tidy data.txt in working directory

tidy_data
##print out table
##not sure what they really want to the output

