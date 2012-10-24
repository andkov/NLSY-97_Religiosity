rm(list=ls(all=TRUE)) #Clear all the variables from previous runs
require(plyr)
require(reshape2)

if( Sys.info()["nodename"] == "MICKEY" ) 
  pathDirectory <- "F:/Users/wibeasley/Documents/Consulting/EmosaMcmc/Dev/EMOSA/Data"
  #pathDirectory <- "F:/Users/wibeasley/Documents/Consulting/EmosaMcmc/Dev/EmosaFork/EMOSA/Data"
if( Sys.info()["nodename"] == "MERKANEZ-PC" ) 
  pathDirectory <- "F:/Users/wibeasley/Documents/SSuccess/InterimStudy" #Change this directory location

pathInData <- file.path(pathDirectory, "subject_data_emosa_nonmiss.csv") #The name of the file to read in.
pathOutData <- file.path(pathDirectory, "SummaryBirthYearByTime.csv") #The name of the file to write to.

dsWide <- read.csv(pathInData, stringsAsFactors=FALSE)

times <- 0:8
years <- 1980:1984 #sort(unique(dsWide$byear))

#Include only records with a valid birth year
dsWide <- dsWide[dsWide$byear %in% years, ]
dsWide$byear <- as.integer(dsWide$byear)

#Include only records with a valid ID
dsWide <- dsWide[dsWide$id != "V", ]
dsWide$id <- as.integer(dsWide$id)

#Drop the birth month variable
dsWide <- dsWide[, colnames(dsWide) != "bmonth"]

#Inspect the resulting dataset
summary(dsWide)

#Transform the wide dataset into a long dataset
dsLong <- melt(dsWide, id.vars=c("id", "byear"))
dsLong <- dsLong[order(dsLong$id, dsLong$variable), ] #Sort for the sake of visual inspection.

#Convert the year variable from a character to a number
dsLong$variable <- gsub(pattern="att", replacement="", x=dsLong$variable) #Strip off the 'att' prefix
dsLong$variable <- as.integer(dsLong$variable) #Convert to a number.
dsLong <- plyr::rename(dsLong, replace=c(variable="time", value="attendence"))
summary(dsLong)
head(dsLong, 20)

#Create a function to summarize each byear*time cell
SummarizeBYearTime <- function( df ) {#df stands for 'data.frame'
  #Create a new data.frame with three columns
  dsResult <- data.frame(
    TotalGoers=sum(df$attendence %in% c(6,7,8)),
    TotalIrregulars= sum(df$attendence %in% c(3,4,5)),
    TotalAbsentees=sum(df$attendence %in% c(1,2))
  )
  
  #Calculate the proportions
  cellCount <- dsResult$TotalGoers + dsResult$TotalIrregulars + dsResult$TotalAbsentees
  #Equivalent way: cellCount <- apply(dsResult[, c('TotalGoers', 'TotalIrregulars', 'TotalAbsentees')], 1, sum)
  dsResult$ProportionGoers <- dsResult$TotalGoers / cellCount
  dsResult$ProportionIrregulars <- dsResult$TotalIrregulars / cellCount
  dsResult$ProportionAbsentees <- dsResult$TotalAbsentees / cellCount  
  
  #Check that the totals sum to 1.0.  Throw an error if not.
  #dsResult$ProportionTotal <- dsResult$ProportionGoers + dsResult$ProportionIrregulars + dsResult$ProportionAbsentees
  proportionTotal <- dsResult$ProportionGoers + dsResult$ProportionIrregulars + dsResult$ProportionAbsentees
  if( abs(proportionTotal - 1) > 1e-7 ) stop("The proportions summing to 1 for each byear*time cell.")
  
  #Return the new data.frame (presumably to the ddply call).
  return( dsResult)
}

# Create a data.frame that has a row for each unique summarize each byear*time combination.
dsSummarized <- plyr::ddply(dsLong, .variables=c("byear", "time"), .fun=SummarizeBYearTime)

#Inspect the variables & top part of the results.
summary(dsSummarized)
head(dsSummarized, 10)

write.csv(dsSummarized, pathOutData, row.names=FALSE)