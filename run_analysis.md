Getting and Cleaning Data Course Project /Peer Assessments 
========================================================

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. I have submited following 1) a tidy data set as described in Readme.txt file, 2) a link to a Github repository which has script which is performing the analysis, and 3) a code book(CodeBook.md) that describes the variables, the data, and transformations that I have performed to clean up the data . I have also included a README.md in the repo with the scripts. 

One of the most exciting areas in all of data science right now is wearable computing . Companies like Fitbit, Nike, and Jawbone are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at following site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Merging the training and test data sets to create one data set.
### Download zip file from internet into data directory


```r
#check if directory "Data" exist , if not than create one
if(!file.exists("./data")){dir.create("./data")} 
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#Download Zip file
#download.file(fileUrl,"./data/UCI_HAR_Dataset.zip")

#Unzip file into one(Data) directory
#unzip("./data/UCI_HAR_Dataset.zip",exdir="./data",junkpaths = TRUE,overwrite=TRUE)
```

### Reading Training and Test Data sets files

```r
#Read Training files
y_train<-read.table("./data/y_train.txt", sep="",stringsAsFactors=FALSE,col.names=c("Activity"))
subject_train<-read.table("./data/subject_train.txt", sep="",stringsAsFactors=FALSE,col.names=c("Subjects"))
X_train<-read.table("./data/X_train.txt", sep="",stringsAsFactors=FALSE)


#Read Test files
y_test<-read.table("./data/y_test.txt", sep="",stringsAsFactors=FALSE,col.names=c("Activity"))
subject_test<-read.table("./data/subject_test.txt", sep="",stringsAsFactors=FALSE,col.names=c("Subjects"))
X_test<-read.table("./data/X_test.txt", sep="",stringsAsFactors=FALSE)
```

### Merging Training and Test Data sets to create main data set

```r
#Create Data Frames for Training & Test data sets
train_df <-cbind(subject_train,y_train,X_train)
test_df <-cbind(subject_test,y_test,X_test)

head(train_df[1:8])
```

```
##   Subjects Activity     V1       V2      V3      V4      V5      V6
## 1        1        5 0.2886 -0.02029 -0.1329 -0.9953 -0.9831 -0.9135
## 2        1        5 0.2784 -0.01641 -0.1235 -0.9982 -0.9753 -0.9603
## 3        1        5 0.2797 -0.01947 -0.1135 -0.9954 -0.9672 -0.9789
## 4        1        5 0.2792 -0.02620 -0.1233 -0.9961 -0.9834 -0.9907
## 5        1        5 0.2766 -0.01657 -0.1154 -0.9981 -0.9808 -0.9905
## 6        1        5 0.2772 -0.01010 -0.1051 -0.9973 -0.9905 -0.9954
```

```r
head(test_df[1:8])
```

```
##   Subjects Activity     V1       V2       V3      V4      V5      V6
## 1        2        5 0.2572 -0.02329 -0.01465 -0.9384 -0.9201 -0.6677
## 2        2        5 0.2860 -0.01316 -0.11908 -0.9754 -0.9675 -0.9450
## 3        2        5 0.2755 -0.02605 -0.11815 -0.9938 -0.9699 -0.9627
## 4        2        5 0.2703 -0.03261 -0.11752 -0.9947 -0.9733 -0.9671
## 5        2        5 0.2748 -0.02785 -0.12953 -0.9939 -0.9674 -0.9783
## 6        2        5 0.2792 -0.01862 -0.11390 -0.9945 -0.9704 -0.9653
```

```r
#Merging the training and the test sets to create one data set.
main_df <-rbind(train_df,test_df)
head(main_df[1:8])
```

```
##   Subjects Activity     V1       V2      V3      V4      V5      V6
## 1        1        5 0.2886 -0.02029 -0.1329 -0.9953 -0.9831 -0.9135
## 2        1        5 0.2784 -0.01641 -0.1235 -0.9982 -0.9753 -0.9603
## 3        1        5 0.2797 -0.01947 -0.1135 -0.9954 -0.9672 -0.9789
## 4        1        5 0.2792 -0.02620 -0.1233 -0.9961 -0.9834 -0.9907
## 5        1        5 0.2766 -0.01657 -0.1154 -0.9981 -0.9808 -0.9905
## 6        1        5 0.2772 -0.01010 -0.1051 -0.9973 -0.9905 -0.9954
```

## Extracting only the measurements on the mean and standard deviation for each measurement. 


```r
#Read features file which has names of recorded measurement names. 
measurement_labels <- read.table("./data/features.txt", sep="",stringsAsFactors=FALSE)

# Finding out the indices from features where mean or std dev is calculated
MeanOrStd <- grep("std()|mean()", measurement_labels$V2)

#Extracting Data Set which has Subject, Activity and all mean and std values
tidy_df <- subset(main_df,select=c("Subjects","Activity",paste0("V",MeanOrStd)))
head(tidy_df[1:8])
```

```
##   Subjects Activity     V1       V2      V3      V4      V5      V6
## 1        1        5 0.2886 -0.02029 -0.1329 -0.9953 -0.9831 -0.9135
## 2        1        5 0.2784 -0.01641 -0.1235 -0.9982 -0.9753 -0.9603
## 3        1        5 0.2797 -0.01947 -0.1135 -0.9954 -0.9672 -0.9789
## 4        1        5 0.2792 -0.02620 -0.1233 -0.9961 -0.9834 -0.9907
## 5        1        5 0.2766 -0.01657 -0.1154 -0.9981 -0.9808 -0.9905
## 6        1        5 0.2772 -0.01010 -0.1051 -0.9973 -0.9905 -0.9954
```

## Resolving descriptive activity names to name the activities in the data set 


```r
#Reading Activity labels. 
activity_labels<- read.table("./data/activity_labels.txt", sep="",stringsAsFactors=FALSE)


#Replacing Activity code with named values
tidy_df$Activity <- activity_labels$V2[tidy_df$Activity]
head(tidy_df[1:8])
```

```
##   Subjects Activity     V1       V2      V3      V4      V5      V6
## 1        1 STANDING 0.2886 -0.02029 -0.1329 -0.9953 -0.9831 -0.9135
## 2        1 STANDING 0.2784 -0.01641 -0.1235 -0.9982 -0.9753 -0.9603
## 3        1 STANDING 0.2797 -0.01947 -0.1135 -0.9954 -0.9672 -0.9789
## 4        1 STANDING 0.2792 -0.02620 -0.1233 -0.9961 -0.9834 -0.9907
## 5        1 STANDING 0.2766 -0.01657 -0.1154 -0.9981 -0.9808 -0.9905
## 6        1 STANDING 0.2772 -0.01010 -0.1051 -0.9973 -0.9905 -0.9954
```

## Appropriately labeling the data set columns with descriptive variable names.


```r
#Renaming columns to appropriate values
colnames(tidy_df) <- c("Subject","Activity",measurement_labels$V2[MeanOrStd])
head(tidy_df[1:5])
```

```
##   Subject Activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
## 1       1 STANDING            0.2886          -0.02029           -0.1329
## 2       1 STANDING            0.2784          -0.01641           -0.1235
## 3       1 STANDING            0.2797          -0.01947           -0.1135
## 4       1 STANDING            0.2792          -0.02620           -0.1233
## 5       1 STANDING            0.2766          -0.01657           -0.1154
## 6       1 STANDING            0.2772          -0.01010           -0.1051
```

## Creating a second, independent tidy data set with the average of each variable for each activity and each subject. 


```r
#Created new Data set out of existing one
tidy_df1 <-tidy_df

#Changing Subject and Activity into factor Variables
tidy_df1$Subject <- as.factor(tidy_df1$Subject)
tidy_df1$Activity <- as.factor(tidy_df1$Activity)

#Calculated Average of each measure variable for each activity and each subject.
tidy_df1<- aggregate(tidy_df1[measurement_labels$V2[MeanOrStd]],by=list(tidy_df1$Subject,tidy_df1$Activity),FUN=mean,na.rm=TRUE)

#Rename measure columns by appending - Average to each of them
colnames(tidy_df1) <- c("Subject","Activity",paste0(measurement_labels$V2[MeanOrStd],"-Average"))
```

## Creating tidy data set files

```r
#Writing tidy data set 1 & 2 into respective files
write.table(tidy_df,file="tidy_data.txt",quote = TRUE, sep = " ",eol = "\n", na = "NA", dec = ".", row.names = TRUE,col.names = TRUE)
write.table(tidy_df1,file="tidy_data1.txt",quote = TRUE, sep = " ",eol = "\n", na = "NA", dec = ".", row.names = TRUE,col.names = TRUE)
```
