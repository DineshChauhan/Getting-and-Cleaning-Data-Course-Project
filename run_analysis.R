#check if directory "Data" exist , if not than create one
if(!file.exists("./data")){dir.create("./data")} 
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#Download Zip file
download.file(fileUrl,"./data/UCI_HAR_Dataset.zip")

#Unzip file 
unzip("./data/UCI_HAR_Dataset.zip",exdir="./data",junkpaths = TRUE,overwrite=TRUE)

#Read Training files
y_train<-read.table("./data/y_train.txt", sep="",stringsAsFactors=FALSE,col.names=c("Activity"))
subject_train<-read.table("./data/subject_train.txt", sep="",stringsAsFactors=FALSE,col.names=c("Subjects"))
X_train<-read.table("./data/X_train.txt", sep="",stringsAsFactors=FALSE)


#Read Test files
y_test<-read.table("./data/y_test.txt", sep="",stringsAsFactors=FALSE,col.names=c("Activity"))
subject_test<-read.table("./data/subject_test.txt", sep="",stringsAsFactors=FALSE,col.names=c("Subjects"))
X_test<-read.table("./data/X_test.txt", sep="",stringsAsFactors=FALSE)


#Create Data Frames for Training & Test data sets
train_df <-cbind(subject_train,y_train,X_train)
test_df <-cbind(subject_test,y_test,X_test)

head(train_df[1:8])
head(test_df[1:8])

#Merging the training and the test sets to create one data set.
main_df <-rbind(train_df ,test_df)
head(main_df[1:8])

#Read features file which has names of recorded measurement names. 
measurement_labels <- read.table("./data/features.txt", sep="",stringsAsFactors=FALSE)

# Finding out the indices from features where mean or std dev is calculated
MeanOrStd <- grep("std()|mean()", measurement_labels$V2)

#Extracting Data Set which has Subject, Activity and all mean and std values
tidy_df <- subset(main_df,select=c("Subjects","Activity",paste0("V",MeanOrStd)))

#Renaming columns to appropriate values
colnames(tidy_df) <- c("Subject","Activity",measurement_labels$V2[MeanOrStd])
head(tidy_df[1:5])

#Reading Activity labels. 
activity_labels<- read.table("./data/activity_labels.txt", sep="",stringsAsFactors=FALSE)


#Replacing Activity code with named values
tidy_df$Activity <- activity_labels$V2[tidy_df$Activity]

#Created new Data set out of existing one
tidy_df1 <-tidy_df

#Changing Subject and Activity into factor Variables
tidy_df1$Subject <- as.factor(tidy_df1$Subject)
tidy_df1$Activity <- as.factor(tidy_df1$Activity)

#Calculated Average of each measure variable for each activity and each subject.
tidy_df1<- aggregate(tidy_df1[measurement_labels$V2[MeanOrStd]],by=list(tidy_df1$Subject,tidy_df1$Activity),FUN=mean,na.rm=TRUE)

#Rename measure columns by appending - Average to each of them
colnames(tidy_df1) <- c("Subject","Activity",paste0(measurement_labels$V2[MeanOrStd],"-Average"))

#Writing tidy data set 1 & 2 into respective files
write.table(tidy_df,file="tidy_data.txt",quote = TRUE, sep = " ",eol = "\n", na = "NA", dec = ".", row.names = TRUE,col.names = TRUE)
write.table(tidy_df1,file="tidy_data1.txt",quote = TRUE, sep = " ",eol = "\n", na = "NA", dec = ".", row.names = TRUE,col.names = TRUE)