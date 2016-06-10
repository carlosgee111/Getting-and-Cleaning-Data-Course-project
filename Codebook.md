#Codebook

This codebook describes the process of cleaning the data including- the variables, data, transformations and work done cleaning.

##Data source

The original description of data from UCI can be found at:
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  
The data can be downloaded at: 
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Download includes these files:
* README.txt
* features_info.txt: Information about the variables in the feature vector.
* features.txt: List of all features.
* activity_labels.txt: Links the class labels with their activity name.
* X_train.txt: Train set.
* Y_train.txt: Train labels.
* X_test.txt: Test set.
* Y_test.txt: Test labels.
* subject_train.txt: Identifies which of the 30 subjects preformed the activity.
* subject_test.txt: Identifies which of the 30 subjects preformed the activity.

##Data information

  The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

  The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##Transformtion process

The code transforms the data by:
* Taking the data in
* Mearging the sets
* Extracting the mean and standard deviation measurements
* Labeling the data set with descriptive labels
