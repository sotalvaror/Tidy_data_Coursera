##Reading data
##Put into your working directory the unziped files (directory) from the next link: 
##https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##Set your working directory as the same where you unzipped the files
## You should have instaled the 'dplyr' in R to run this script


##Reading data


test<-read.table("./UCI HAR Dataset/test/X_test.txt")                  ##data set: part1        
train<-read.table("./UCI HAR Dataset/train/X_train.txt")               ##data set: part2      
features<-read.table("./UCI HAR Dataset/features.txt")                 ##variables names
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")                ##activity measured column:part1
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")             ##activity measured column:part2
act.labels<-read.table("./UCI HAR Dataset/activity_labels.txt")        ##activity labels
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")    ##subject column:part1
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt") ##subject column:part2

##Retrieve variable names from features data

var.names<-features[,2]        


##merge both parts in one dataset

full.data<-rbind(train,test)               ##data
subject<-rbind(subject_train,subject_test) ##Subjects column
activity<-rbind(y_train,y_test)            ##activity column

##Give the columns names to the dataset
colnames(full.data)<-var.names

##Extract only the data for means() and std() from the full dataset
true.var<-grep("mean\\()|std\\()", colnames(full.data))
full.data<-full.data[,true.var]

##Binding all data: subjects+activities+dataset
full.data<-cbind(Subject,Activity,full.data)

##Give descriptive names to the values in activity column
for (i in 1:nrow(act.labels)){
        true.vector<-full.data[2]==act.labels[i,1]
        full.data[true.vector,2]<-act.labels[i,2]
    }
    
names(full.data)[1]<-"Subject"
names(full.data)[2]<-"Activity"
##Calculate means for all variables by activity and subject
library(dplyr)
mean.summarised<-full.data%>%group_by(Subject,Activity)%>%summarise_all(funs(mean))

write.table(mean.summarised,file="./summarized_means.txt", row.names = FALSE)
