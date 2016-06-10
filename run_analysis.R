##The submitted data set is tidy.
##The Github repo contains the required scripts.
##GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
##The README that explains the analysis files is clear and understandable.
##The work submitted for this project is the work of the student who submitted it.


##Read train and test data
train_csv = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
train_csv[,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
train_csv[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

test_csv = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
test_csv[,562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
test_csv[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

##Read labels and features and tidy
act_labels_csv= read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

features_csv = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features_csv[,2] = gsub('-mean', 'Mean', features_csv[,2])
features_csv[,2] = gsub('-std', 'Std', features_csv[,2])
features_csv[,2] = gsub('[-()]', '', features_csv[,2])

#Merge data and extract mean and std
target_cols<- grep(".*Mean.*|.*Std.*", features_csv[,2])
features_csv<-features_csv[target_cols,]

#Add col for subject and activity
target_cols<-c(target_cols, 562, 563)

#Bind train and test and tidy data

complete_data = rbind(train_csv, test_csv)
complete_data<- complete_data[,target_cols]
colnames(complete_data)<- c(features_csv$V2, "Activity", "Subject")
colnames(complete_data) <- tolower(colnames(complete_data))

counter = 1
for (label in act_labels_csv$V2) {
  complete_data$activity <- gsub(counter, label, complete_data$activity)
  counter <- counter + 1
}

complete_data$activity<- as.factor(complete_data$activity)
complete_data$subject<- as.factor(complete_data$subject)

tidy_data = aggregate(complete_data, by=list(activity = complete_data$activity, subject=complete_data$subject), mean)
tidy_data[,89] = NULL
tidy_data[,90] = NULL

write.table(tidy_data, "tidy_data_table.txt", sep="\t")

#All done 
