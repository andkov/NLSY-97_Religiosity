rm(list=ls(all=TRUE)) #Clear all the variables from previous runs
require(ggplot2)
require(plyr)
require(reshape2)
     
pathDir<-file.path(getwd())
pathInage2000<-file.path(pathDir,"dataprep/temp/attend_wide_to_long.csv")
pathInattend<-file.path(pathDir,"dataprep/temp/age2000_wide_to_long.csv")
        
age2000<- read.csv(pathInage2000, stringsAsFactors=FALSE)
attend<- read.csv(pathInattend, stringsAsFactors=FALSE)

attend_long_nomiss <- merge(attend,age2000)
attend_long_nomiss <- attend_long_nomiss[order(attend_long_nomiss$id, attend_long_nomiss$byear),]
        
pathOutData <- file.path (pathDir,"/current/long/attend_long_nomiss.csv") # combined dataframe
write.csv (attend_long_nomiss, pathOutData, row.names=FALSE)
