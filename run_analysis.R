# Before run this script, please download and unzip the source into a folder on your local drive: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# This R script does the following:

# 1. Merges the training and the test sets to create one data set.

train <- read.table("train/X_train.txt")
test <- read.table("test/X_test.txt")
X <- rbind(train, test)

train <- read.table("train/subject_train.txt")
test <- read.table("test/subject_test.txt")
S <- rbind(train, test)

train <- read.table("train/y_train.txt")
test <- read.table("test/y_test.txt")
Y <- rbind(train, test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

ft <- read.table("features.txt")
mean_std_ft <- grep("-mean\\(\\)|-std\\(\\)", ft[, 2])
X <- X[, mean_std_ft]
names(X) <- ft[mean_std_ft, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

# 3. Uses descriptive activity names to name the activities in the data set.

atvt <- read.table("activity_labels.txt")
atvt[, 2] = gsub("_", "", tolower(as.character(atvt[, 2])))
Y[,1] = atvt[Y[,1], 2]
names(Y) <- "activity"


# 4. Appropriately labels the data set with descriptive activity names.

names(S) <- "subject"
clean_data <- cbind(S, Y, X)
write.table(clean_data, "new_data.txt")

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

unique_S = unique(S)[,1]
num_S = length(unique(S)[,1])
num_Y = length(atvt[,1])
num_Cols = dim(clean_data)[2]
result = clean_data[1:(num_S*num_Y), ]

row = 1
for (s in 1:num_S) {
  for (y in 1:num_Y) {
    result[row, 1] = unique_S[s]
    result[row, 2] = atvt[y, 2]
    ndt <- clean_data[clean_data$subject==s & clean_data$activity==atvt[y, 2], ]
    result[row, 3:num_Cols] <- colMeans(ndt[, 3:num_Cols])
    row = row+1
  }
}
write.table(result, "2nd_tidy_data_set.txt")

