download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="HARDataset.zip",method="curl")
unzip("HARDataset.zip")
train.X = read.table("UCI HAR Dataset\\train\\X_train.txt")
train.y = read.table("UCI HAR Dataset\\train\\y_train.txt")
train.subject = read.table("UCI HAR Dataset\\train\\subject_train.txt")
test.subject = read.table("UCI HAR Dataset\\test\\subject_test.txt")
test.X = read.table("UCI HAR Dataset\\test\\X_test.txt")
test.y = read.table("UCI HAR Dataset\\test\\y_test.txt")
features = read.table("UCI HAR Dataset\\features.txt")
train = cbind(train.X,train.y,train.subject)
test = cbind(test.X,test.y,test.subject)
all = rbind(train,test)
mean_std_cols_idx = c(1:6, 41:46, 81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)
mean_std_cols = all[,c(mean_std_cols_idx,562:563)]
colnames(mean_std_cols) = c(as.vector(features[mean_std_cols_idx,2]),c("activity","subject"))
library(dplyr)
mean_std_cols %>% group_by(subject,activity) %>% summarise_each(funs(mean))


