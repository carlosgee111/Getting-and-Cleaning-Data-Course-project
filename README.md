# Getting-and-Cleaning-Data-Course-project
Code opens and reads files for test and train datasets.
Once all are opened they are combinded to a full data set and the imermediates are removed from the workspace.
Data is then extractedbased on mean if the variable was a mean or std.
Finally the data is tidied and the rest of the objects are deleted.

#Code book
All time variables were captured at a constant rate of 50 Hz and filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
The magnitude of the three-dimensional signals were calculated using the Euclidean norm.
The variables included are only the ones involving mean and standard deviation, which leaves out many of the other analyses done on the full data set.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
