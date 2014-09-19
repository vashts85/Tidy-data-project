##########################################################
#####   Clear the console and set working directory #####
##########################################################

rm(list=ls())

setwd("C:/Users/rcarvalho/Desktop/R-Project/")
getwd()

########################################################################
#####   Read in necessary data and merges it to create one dataset #####
########################################################################

#Read in necessary TEST files
xtest=read.table("./test/X_test.txt", header=FALSE)
subjecttest=read.table("./test/subject_test.txt", header=FALSE)
ytest=read.table("./test/y_test.txt", header=FALSE)

#Read in necessary TRAIN files
xtrain=read.table("./train/X_train.txt", header=FALSE)
subjecttrain=read.table("./train/subject_train.txt", header=FALSE)
ytrain=read.table("./train/y_train.txt", header=FALSE)

#Merge TEST and TRAIN files in appropriate order to create a dataframe
testdf=cbind(ytest,subjecttest,xtest)
traindf=cbind(ytrain,subjecttrain,xtrain)

#Merge TEST and TRAIN together
dfmerged=rbind(testdf,traindf)

##############################
#####   Features labels #####
##############################

#Read in the features for labeling
features=read.table("features.txt", header=FALSE)

#Finalize the features label by subsetting only the second column of features and adding the Activity and Subject labels
features=c("Activity","Subject",as.character(features[,2]))

#Assign features names to TEST and TRAIN data
colnames(dfmerged) <- features

##############################
#####   Activity labels #####
##############################

#Read in the activity labels
activitylabels=read.table("activity_labels.txt", header=FALSE)

#Subset only second column so a label vector exists and lower cases all of the text
activitylabels=tolower(sub("_"," ",activitylabels[,2])) ; 

#Converts the activity variable to a factor and assigns it activity labels; levels are already existent so no need to define them
dfmerged$Activity <- factor(dfmerged$Activity, labels = activitylabels); table(dfmerged$Activity)

#################################################################
#####   Creates a dataset that has only the means and stds  #####
#################################################################

dfmergedmeanstd=dfmerged[,grep("Activity|Subject|mean()|std()", names(dfmerged), value=TRUE)]

##########################################################################################
#####   Creates a tidy dataset with means and std aggregated by subject and activity #####
##########################################################################################

#Here we exclude the first two columns (those we aggregate by) so that R will not produce warning messages. The command would continue regardless, but this is to avoid warnings
tidymeanstd=aggregate(dfmergedmeanstd[,-1:-2], by=list(Activity=dfmergedmeanstd$Activity, Subject=dfmergedmeanstd$Subject), FUN=mean)

##Cleans up the labels for the features
names(tidymeanstd)=gsub("-"," ",names(tidymeanstd))
names(tidymeanstd)=gsub("\\()"," ",names(tidymeanstd))
names(tidymeanstd)=sub("mean","Mean",names(tidymeanstd))
names(tidymeanstd)=gsub("tG","Time Measurement G", gsub("tB", "Time Measurement B", gsub("fB", "Frequency Measurement B",names(tidymeanstd))))
names(tidymeanstd)=gsub("Body","Body ", names(tidymeanstd))
names(tidymeanstd)=gsub("Acc","Acceleration ", names(tidymeanstd))
names(tidymeanstd)=gsub("Jerk","Jerk ", names(tidymeanstd))
names(tidymeanstd)=gsub("Gyro","Gyroscope ", names(tidymeanstd))
names(tidymeanstd)=gsub("Gravity","Gravity ", names(tidymeanstd))
names(tidymeanstd)=gsub("  "," ", names(tidymeanstd))
names(tidymeanstd)=gsub("std","Standard Deviation", names(tidymeanstd))
names(tidymeanstd)=sub("Mag","Magnitude", names(tidymeanstd))
names(tidymeanstd)=sub("MeanFreq","Mean Frequency", names(tidymeanstd))
names(tidymeanstd)=sub("Body Body","Body", names(tidymeanstd)) #Explicitly replaced because looks like an error
names(tidymeanstd)[3:81]=paste("Mean of", names(tidymeanstd[3:81]))

##########################################################################################
#####   Saves tidy dataset to submission    #####
##########################################################################################

write.table(tidymeanstd, file="./tidymeanstd.txt", row.names=FALSE)

