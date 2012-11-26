rm(list=ls(all=TRUE)) #Clear all the variables from previous runs
require(ggplot2)
require(plyr)
require(reshape2)

pathDir<-file.path(getwd())
pathInData <- file.path(pathDir,"NLSY97_Religion_10242012.csv")
dsWide <- read.csv(pathInData, stringsAsFactors=FALSE)

times <- 0:10
years <- 1980:1984 
months <- 1:12

sort(unique(dsWide$byear))
#Include only records with a valid birth year
dsWide <- dsWide[dsWide$byear %in% years, ]
dsWide$byear <- as.integer(dsWide$byear)


sort(unique(dsWide$bmonth))
#Include only records with a valid birth month 
dsWide <- dsWide[dsWide$bmonth %in% months, ]
dsWide$bmonth <- as.integer(dsWide$bmonth)

#Include only records with a valid ID
dsWide <- dsWide[dsWide$id != "V", ]
dsWide$id <- as.integer(dsWide$id)

##Attendence of worship services ##################################################################

#Keep the variables of interest
interest<- c("id","byear","attend_2000", "attend_2001","attend_2002","attend_2003",
             "attend_2004","attend_2005", "attend_2006","attend_2007",
             "attend_2008","attend_2009","attend_2010")
dsWide <- dsWide[interest]
View(dsWide)

#Inspect the resulting dataset
summary(dsWide)
str(dsWide)

#Transform the wide dataset into a long dataset
dsLong <- melt(dsWide, id.vars=c("id", "byear"))
dsLong <- dsLong[order(dsLong$id, dsLong$variable),] #Sort for the sake of visual inspection.

#Convert the year variable from a character to a number
dsLong$variable <- gsub(pattern="attend_", replacement="", x=dsLong$variable) #Strip off the 'attend' prefix
dsLong$variable <- as.integer(dsLong$variable) #Convert to a number.
dsLong$value <- as.integer(dsLong$value)     #Convert to a number.
dsLong$byear <- as.factor(dsLong$byear)     #Convert to a factor.

dsLong <- plyr::rename(dsLong, replace=c(variable="time", value="attend"))

#summary(dsLong)
#str(dsLong)
#head(dsLong, 1)
#summary(dsLong)
#View(dsLong)

pathOutData <- file.path(pathDir, "dataprep/temp/attend_wide_to_long.csv") # melted by AgeMon
write.csv (dsLong, pathOutData, row.names=FALSE)