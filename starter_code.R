rm(list=ls(all=TRUE)) #Clear all the variables from previous runs
require(plyr)
require(reshape2)

pathDirectory <- "C:/Users/Serious/Documents/GitHub"
pathBank <- file.path(pathDirectory, "NLSY-97_Religiosity/NLSY-97_Religion_24102012")
pathData <- file.path(pathBank, "NLSY-97_Religion_24102012.dat")

ds <- read.csv(pathData, stringsAsFactors=FALSE)

