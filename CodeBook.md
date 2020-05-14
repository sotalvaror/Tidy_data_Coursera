Variables
========
From the authors of the original experiment we can found the description for each variable in our final dataset:

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)". 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

the original data estimated diferent varaibles from each signal above, but the data was filteres to only preserve:

mean(): Mean value
std(): Standard deviation

Each XYZ represent 3 diferents variables, so the total numbers of variables retrieved from the original data variables is 66

The original data was merged whit 2 additional variables: Subject and Activity

Subject: contains the identifier for each subject/volunteer of the experiment.
A total of 30 subjects/volunteers participated in the experiment, so the subject variable goes from 1 to 30

Activity: In the experiment, 6 diferents activities was measured for each subject. Each activity have a number id form 1 to 6, where each number represents one activity:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

Transformations
========

First, the data, in .txt extension, were read into R. The total data becomes in 2 diferent archives: train and test. When test and train were merged, total dataset is completed for the 66 variables, for the Activity column and Subject Column.

The variable names, came in separate files, so the file containing the variable names were read and merged whit the full data set

Then, whit the data merged and its variable name defined, data whit means()'s and std()'s in its name where extradted. From a total of 561 variables, only 66 stand for the analysis.

Then, the subject and activity identifier merged to the data (column 1 and column 2 respectively). After that, the activity identifier were replace by a descriptive variable.

Finnally, the mean for each variable were calculated group by Subject and Activity.

License:
========

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


