rm(list=ls(all=TRUE)) #Clear all the variables from previous runs
require(ggplot2)
require(plyr)
require(reshape2)

pathInData <- file.path(  "C:/Users/Serious/Documents/GitHub/NLSY-97_Religiosity/databank/NLSY97_Religion_10242012.csv")
dsWide <- read.csv(pathInData, stringsAsFactors=FALSE)


times <- 0:10
years <- 1980:1984 
sort(unique(dsWide$byear))

#Include only records with a valid birth year
dsWide <- dsWide[dsWide$byear %in% years, ]
dsWide$byear <- as.integer(dsWide$byear)

#Include only records with a valid ID
dsWide <- dsWide[dsWide$id != "V", ]
dsWide$id <- as.integer(dsWide$id)

##Ages in Months at the date of the interveiw##################################################################
pathOutData <- file.path(pathOut, "agemon.csv") # melted by AgeMon

#Keep the variables of interest
interest<- c("id","byear","agemon_1997","agemon_1998","agemon_1999","agemon_2000",
             "agemon_2001","agemon_2002","agemon_2003","agemon_2004","agemon_2005",
             "agemon_2006","agemon_2007","agemon_2008","agemon_2009","agemon_2010")
dsWide <- dsWide[interest]

#Inspect the resulting dataset
#summary(dsWide)
#str(dsWide)

#Transform the wide dataset into a long dataset
dsLong <- melt(dsWide, id.vars=c("id", "byear"))
dsLong <- dsLong[order(dsLong$id, dsLong$variable),] #Sort for the sake of visual inspection.

#Convert the year variable from a character to a number
dsLong$variable <- gsub(pattern="agemon_", replacement="", x=dsLong$variable) #Strip off the 'agemon' prefix
dsLong$variable <- as.integer(dsLong$variable) #Convert to a number.
dsLong$value <- as.integer(dsLong$value)     #Convert to a number.
dsLong$byear <- as.factor(dsLong$byear)     #Convert to a factor.

dsLong <- plyr::rename(dsLong, replace=c(variable="time", value="AgeMon"))
#summary(dsLong)
#str(dsLong)
#head(dsLong, 1)
#summary(dsLong)
#View(dsLong)

pathOutData <- file.path ("C:/Users/Serious/Documents/GitHub/NLSY-97_Religiosity/databank/temp_NLSY97_Religion_24102012/agemon.csv") # melted by AgeMon
write.csv (dsLong, pathOutData, row.names=FALSE)