README
===============================


###Human Activity Recognition Using Smartphones Dataset

Version 1.0


###Experimental Design and Background


The dataset contains data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The specific data used for this dataset can be obtained here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The final dataset ("tidymeanstd") contains the average of the mean and standard deviation of various variables measuring 3-axial linear acceleration and angular velocity for a total 30 volunteers grouped by six different activities:
1.    Walking
2.	Walking upstairs
3.	Walking downstairs
4.	Sitting
5.	Standing
6.	Laying

In this tidymeanstd dataset, each row corresponds to the mean of these movement variables for a volunteer performing one of the given activities while wearing the smartphone on the waist. Hence, there are six rows per subject, for a total of 180 rows (6 activities x 30 subjects).

###Raw data

Using its embedded accelerometer and gyroscope, the phone captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

###Construction of tidymeanstd

The tidy dataset was constructed by downloading the data in the link above and unzipping them to a working directory. The files were then merged with the below referenced text files and in a structure matching the diagram below (original source: David Hood, https://class.coursera.org/getdata-007/forum/thread?thread_id=49).

<img src="https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png" />

All text files were read in using the read.table command.

The X_Train and X_test datasets contain the actual accelerometer data.

Y_Train and Y_test datasets indicate activity performed. These were used to construct the Activity variable, which was labeled with the Activity_Labels TXT file and converted into a factor variable to facilitate data aggregation.

Subject numbers were identified with the Subject_test and Subject_train files. 

The columns, which indicate the specific accelerometer measure, were labeled with information from the Features TXT file, which is a vector of features obtained by calculating variables from the time and frequency domain. These labels were edited for clarity and tidy data purposes by: 

1.	Removing the () and - symbols
2.	Expanding all of the abbreviations
3.	Replacing the t and f with Time and Frequency, respectively

Once a fully merged dataset (as shown above) was created, the dataset was restricted to only those variables containing mean and standard deviation information (the weighted average of the frequency components variable was kept). A total of 79 variables were kept in this restricted dataset. This was completed using the grep command.

This restricted dataset was then collapsed by subject and activity so that each row represented the means of a subject's given activity. This was completed via the aggregate command while omitting the columns to use for collapsing (Subject and Activity). Hence, there are six rows per subject, for a total of 180 rows (6 activities x 30 subjects) in the final dataset. This final dataset was written out to the working directory using the write.table command.

###Using the provided script: 

To use the provided script, please download the data available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Then, unzip it to a given working directory. In the script file, please edit line 7 (which sets the working directory for the script) to match the folder location for the unzipped data. Ultimately, this should be edited to be:

setwd("C:/Users/[your username]/[location of unzipped folder]/")

The final tidy dataset will also be saved to this same directory.

###Notes: 

- Features are normalized and bounded within [-1,1].
- For the purposes of this dataset, the variable indicating a training or test data was excluded.
