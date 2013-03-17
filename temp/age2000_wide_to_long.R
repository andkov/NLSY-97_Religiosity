rm(list=ls(all=TRUE)) #Clear all the variables from previous runs
require(ggplot2)
require(plyr)
require(reshape2)

pathLocal<-file.path("C:/Users/kovalav")
pathDir<-file.path(pathLocal,"Dropbox/data/NLSY97_Religion_24102012")
# pathDir<-file.path(getwd())
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

##Ages in Months at the date of the interveiw##################################################################
dsWide$age2000<-( 24000 - (dsWide$byear*12) + (dsWide$bmonth) )/12

keepvar <- c("id", "age2000", "attend_2000", 
             "attend_2001","attend_2002","attend_2003","attend_2004","attend_2005",
             "attend_2006","attend_2007","attend_2008","attend_2009","attend_2010")
dsWide <- dsWide[keepvar]
#rename  the variables inthe subseted dataset
names(dsWide)<- c("id", "age2000", "att2000",
                  "att2001","att2002","att2003","att2004","att2005",
                  "att2006","att2007","att2008","att2009","att2010")



#Inspect the resulting dataset
summary(dsWide)
str(dsWide)

#Transform the wide dataset into a long dataset
dsLong <- melt(dsWide, id.vars=c("id", "age2000"))
dsLong <- dsLong[order(dsLong$id, dsLong$variable),] #Sort for the sake of visual inspection.

#Convert the year variable from a character to a number
dsLong$variable <- gsub(pattern="att", replacement="", x=dsLong$variable) #Strip off the 'attend' prefix
dsLong$variable <- as.integer(dsLong$variable) #Convert to a number.
dsLong$value <- as.integer(dsLong$value)     #Convert to a number.

dsLong <- plyr::rename(dsLong, replace=c(variable="time", value="attend"))

#summary(dsLong)
#str(dsLong)
#head(dsLong, 1)
#summary(dsLong)
#View(dsLong)

pathOutData <- file.path(pathDir, "dataprep/temp/age2000_wide_to_long.csv") # melted by AgeMon
write.csv (dsLong, pathOutData, row.names=FALSE)

