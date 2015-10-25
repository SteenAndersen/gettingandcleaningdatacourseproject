
library(data.table)


# Read test data
testActivityLabels <- read.table("test/y_test.txt", col.names="label")
testSubjects <- read.table("test/subject_test.txt", col.names="subject")
testData_X <- read.table("test/X_test.txt")

# Read train data
trainActivityLabels <- read.table("train/y_train.txt", col.names="label")
trainSubjects <- read.table("train/subject_train.txt", col.names="subject")
trainData_X <- read.table("train/X_train.txt")


# Get labels
labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)


# Get feautures
feat <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)

# Select for mean and std values
meanStdFeatures <- feat[grep("mean\\(\\)|std\\(\\)", feat$V2), ]

# Combine the data sets from test and train
tableData <- rbind(cbind(testSubjects, testActivityLabels, testData_X),cbind(trainSubjects, trainActivityLabels, trainData_X))

# Clean for mean and std values
tableDataMeanStd <- tableData[, c(1, 2, meanStdFeatures$V1+2)]
tableDataMeanStd$label <- labels[tableDataMeanStd$label, 2]

# Make new column names
colNames <- c("subject", "label", meanStdFeatures$V2)

# Add new column names
colnames(tableDataMeanStd) <- colNames

# Get the main and std aggregated
aData <- aggregate(tableDataMeanStd[, 3:ncol(tableDataMeanStd)],by=list(subject = tableDataMeanStd$subject, 
              label = tableDataMeanStd$label), mean)
# Write to file 'tidy.txt' 
write.table(format(aData, scientific=T), "tidy.txt", row.names=F, col.names=T)