This 'codebook.md' file contains the description of variables produced by run_analysis.R

- 'train/X_train.txt': Training set.
- 'test/X_test.txt': Test set.
- 'train/subject_train.txt': Training subject, each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/subject_test.txt': Test subject, each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/y_train.txt': Training labels.
- 'test/y_test.txt': Test labels.
- 'train': Read all the files of training.
- 'test': Read all the files of test.
- 'X', 'Y', 'S': Results of the merging of the training and test sets to create one data set.
- 'features.txt': List of all features.
- 'ft': Read the files 'features.txt'.
- 'mean_std_ft': Returns values of extracting on the mean and standard deviation for each measurement.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'atvt': Read the files 'activity_labels.txt'.
- 'clean_data': Combine by columns 'S', 'Y', 'X'.
- 'new_data.txt': File result of the combining of 'S', 'Y', 'X'.
- 'unique_S': Returns values unique of 'S'.