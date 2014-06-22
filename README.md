==================================================================
Getting and Cleaning Data Course Project /Peer Assessments

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. I have submited following 1) a tidy data set as described in Readme.txt file, 2) a link to a Github repository which has script which is performing the analysis, and 3) a code book(CodeBook.md) that describes the variables, the data, and transformations that I have performed to clean up the data . I have also included a README.md in the repo with the scripts.

One of the most exciting areas in all of data science right now is wearable computing . Companies like Fitbit, Nike, and Jawbone are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at following site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Human Activity Recognition Using Smartphones Dataset

Version 1.0
==================================================================
Dinesh Chauhan - Getting and Cleaning Data Student
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.  

Two Tidy data sets tidy_data.txt & tidy_data1.txt have been provided.

Each record in tidy_data.txt has following:
======================================

- An identifier of the subject who carried out the experiment.
- Its activity. 
- A 79 measures which represent mean & standard deviation of following
	- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
	- Triaxial Angular velocity from the gyroscope. 


Each record in tidy_data1.txt has following:
======================================

- An identifier of the subject who carried out the experiment.
- Its activity. 
- A 79 measures which represent Average of following

	- Mean Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
	- Mean Triaxial Angular velocity from the gyroscope. 
	- Standard Deviation Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
	- Standard Deviation Triaxial Angular velocity from the gyroscope.

Following files have been included:
=========================================

- 'README.md'

- 'codeBook.md': Shows Describes the variables, data and transformations done on data.

-  tidy_data.txt : Records showing mean & std deviation of 79 measures 

-  tidy_data1.txt : Records showing Average of mean & std deviation of 79 measures 

- 'run_analysis.R': R code which read,transform and create tidy data.

- 'run_analysis.md': Markdown file which code and data.

- 'run_analysis.Rmd': R markdown file which can be run in kniter to create html output.

- 'run_analysis.html: Output from run_analysis.Rmd.


