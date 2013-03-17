
pathDir<-file.path(getwd())

pathInLong <- file.path (pathDir,"current/long/attend_long_nomiss.csv") # melted by AgeMon
# pathInWide<-file.path(pathDir,"current/wide/attend_wide_nomiss.csv")

dsattendwide<- read.csv(pathInWide, stringsAsFactors=FALSE)
dsattendlong<- read.csv(pathInLong, stringsAsFactors=FALSE)

str(dsattendlong)

dsattendlong$age2000c <- as.numeric(dsattendlong$age2000-16)       # Centered at 16
dsattendlong$age2000c2 <- dsattendlong$age2000c^2
dsattendlong$age2000c3 <- dsattendlong$age2000c^3

dsattendlong$timec <- as.numeric(dsattendlong$time-2000)       # Centered at 2000
dsattendlong$timec2 <- dsattendlong$timec^2
dsattendlong$timec3 <- dsattendlong$timec^3

dsattendlong$byearc <- as.factor(dsattendlong$byear-1980)     #Centered at 1980
dsattendlong$time <- as.factor(dsattendlong$time)

keepvar <- c("id", "attend","byear","byearc","age2000", "age2000c", "time","timec", "timec2", "timec3")
dsattendlong <- dsattendlong[keepvar]

str(dsattendlong) 
pathOutLong<-file.path(pathDir,"current/long/attend_long_nomiss_modeling.csv")
# pathOutWide<-file.path(pathDir,"current/wide/attend_wide_nomiss_modeling.csv")
write.csv (dsattendlong,pathOutLong, row.names=FALSE)

###
#Selecting few obs for easier modeling
### 

long_small<-subset(dsattendlong,id<=200)
pathOutLongsmall<-file.path(pathDir,"current/long/attend_long_nomiss_modeling_small.csv")
write.csv (long_small,pathOutLongsmall, row.names=FALSE)
