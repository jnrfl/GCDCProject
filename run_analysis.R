    #Merges the training and the test sets to create one data set.
    #Extracts only the measurements on the mean and standard deviation for each measurement. 
    data.f <- read.table("features.txt", col.names=c("ID","Name"), header=FALSE)
    col.names <- grep(".*mean\\(\\)|.*std\\(\\)", data.f$Name)
    
    for (i in c("test", "train")){
        path.y <- file.path(i, paste0("y_", i, ".txt"))
        y <- paste0(i, "y")
        assign(y, read.table(path.y, header=FALSE, col.names=c("ID")))
        
        path.x <- file.path(i, paste0("X_", i, ".txt"))
        x <- paste0(i, "x")
        assign(x, read.table(path.x, header=FALSE, col.names=data.f$Name)[,col.names])
        
        subject <- paste0(i,"subject")
        assign(subject, read.table(file.path(i, paste0("subject_", i, ".txt")), header=FALSE, col.names=c("ID")))
    }
    
    testx$SubjectID <- testsubject$ID
    trainx$SubjectID <- trainsubject$ID
    
    testx$ActivityID <- testy$ID
    trainx$ActivityID <- trainy$ID
    
    data <- rbind(testx, trainx)
    
    #Uses descriptive activity names to name the activities in the data set
    activity <- read.table("activity_labels.txt", header=FALSE, col.names=c("ActivityID", "ActivityName"))
    data <- merge(data, activity)
    
    #Creates a second, independent tidy data set with the average of each variable for each activity and each subject
    library(reshape2)
    
    ids <- c("ActivityID", "ActivityName", "SubjectID")
    measures <- setdiff(colnames(data), ids)
    melted.data <- melt(data, id=ids, measure.vars=measures)
    tidy.data <- dcast(melted.data, ActivityName + SubjectID ~ variable, mean)
    
    write.table(tidy.data, "tidy data.txt")
    
    return(data)