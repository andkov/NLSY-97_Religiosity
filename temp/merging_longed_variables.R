rm(list=ls(all=TRUE)) #Clear all the variables from previous runs
require(ggplot2)
require(plyr)
require(reshape2)
     
pathDirectory <- file.path("C:/Users/Serious/Documents/GitHub")
pathBank <- file.path(pathDirectory, "NLSY-97_Religiosity/databank")
pathIn <- file.path(pathBank, "temp_NLSY97_Religion_10242012")
pathOut <- file.path(pathBank, "temp_NLSY97_Religion_24102012")
pathInAgeMon<-file.path(pathIn,"agemon.csv")
pathInAttend<-file.path(pathIn,"attend.csv")
        
AgeMon<- read.csv("C:/Users/Serious/Documents/GitHub/NLSY-97_Religiosity/databank/temp_NLSY97_Religion_24102012/agemon.csv", stringsAsFactors=FALSE)
attend<- read.csv("C:/Users/Serious/Documents/GitHub/NLSY-97_Religiosity/databank/temp_NLSY97_Religion_24102012/attend.csv", stringsAsFactors=FALSE)

relatt <- merge(attend,AgeMon, by=c("id","byear","time"))
relatt <- relatt[order(relatt$id, relatt$byear),]
        
pathOutData <- file.path (pathOut,"relatt.csv") # combined dataframe
write.csv (relatt, pathOutData, row.names=FALSE)
