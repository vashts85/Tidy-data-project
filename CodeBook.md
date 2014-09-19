Codebook
==================================================================

Human Activity Recognition Using Smartphones Dataset
==================================================================
Version 1.0

Adjustments performed
========================
**Activity** was transformed into a factor variable (levels walking, walking upstairs, walking downstair, sitting, standing, and laying).Some of the levels included a "_" and this was removed via substitution.

The **Features** text file provided labels for the columns, but these were altered as follows to provide descriptive labels:

1. Only alpha numeric characters were retained.
2. Capitalization and spacing was properly applied
3. The "f" and "t" prefixes were replaced with Frequency and Time, respectively
4. Abbreviated definiations were expanded
5. One feature was labeled "BodyBody", but this was edited to "Body" as it appeared to be an error within the **Features** text file.

The variable indicating whether the subject was doing the training or test data was dropped. 

Each row is an entry for the means of each of the features for each subject's activity. 

Features (i.e., variables or columns)
=================

To facilitate comprehension, key variables are bolded.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote **time**) were captured at a constant rate of 50 Hz. 

Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into **body** and **gravity** **acceleration** signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain **Jerk** signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the **magnitude** of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate **frequency** domain signals). 

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

For the purposes of this dataset, only the set of variables estimating the mean value and standard deviation were kept. However, the mean frequency (weighted average of the frequency components to obtain a mean frequency) was also kept.