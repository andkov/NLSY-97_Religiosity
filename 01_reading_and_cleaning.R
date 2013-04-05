rm(list=ls(all=TRUE)) #Disable when working in "NLSY-97_Religiosity.Rproj"
require(ggplot2)
require(plyr)
require(reshape2)
require(lme4) #Load the library necessary for multilevel models
require(colorspace) #Load the library necessary for creating tightly-controlled palettes.
require(car)

years<-1980:1984

pathDir<-file.path(getwd())
pathGitHub <- file.path("C:/Users/kovalav/Documents/GitHub") # locate the "GitHub" folder on your computer
# Choose datasource if working with more than one
#       "Database_ResponseOfInterest_DateOfDownload"
dataSource<-c("NLSY97_Religion_08032013")  
pathDataSource<-file.path(pathDir,dataSource,paste0(dataSource,".dct"))
# pathVarNames<-file.path(pathDir,dataSource, paste0(dataSource,"-value-labels.do"))

# input the file with the question id and labels
varnames<-read.csv(pathDataSource,header=FALSE, skip=1,nrows=70,sep=" ")
dsSource<-read.csv(pathDataSource,header=FALSE, skip=73,sep=" ")

# select 4th and 5th collumns
varnames<-varnames[c("V3","V4")]
varnames<-rename(varnames, c("V3"="QID","V4"="Qname"))
varnames <- varnames[order(varnames$QID,varnames$Qname), ] 

names(dsSource)<-varnames$QID
dsSource<-rename(dsSource, c(
  "R0323900"="famrel_1997",
  "R2165200"="famrel_1998",
  "R3483100"="famrel_1999",
  "R4881300"="famrel_2000",
  "R1193900"="agemon_1997",
  "R2553400"="agemon_1998",
  "R3876200"="agemon_1999",
  "R5453600"="agemon_2000",
  "R7215900"="agemon_2001",
  "S1531300"="agemon_2002",
  "S2000900"="agemon_2003",
  "S3801000"="agemon_2004",
  "S5400900"="agemon_2005",
  "S7501100"="agemon_2006",
  "T0008400"="agemon_2007",
  "T2011000"="agemon_2008",
  "T3601400"="agemon_2009",
  "T5201300"="agemon_2010",
  "R1194100"="ageyear_1997",
  "R2553500"="ageyear_1998",
  "R3876300"="ageyear_1999",
  "R5453700"="ageyear_2000",
  "R7216000"="ageyear_2001",
  "S1531400"="ageyear_2002",
  "S2001000"="ageyear_2003",
  "S3801100"="ageyear_2004",
  "S5401000"="ageyear_2005",
  "S7501200"="ageyear_2006",
  "T0008500"="ageyear_2007",
  "T2011100"="ageyear_2008",
  "T3601500"="ageyear_2009",
  "T5201400"="ageyear_2010",
  "R1235800"="samplesype",
  "S0919700"="todo_2002",
  "S6317100"="todo_2005",
  "T2782200"="todo_2008",
  "R4893400"="attend_2000",
  "R6520100"="attend_2001",
  "S0919300"="attend_2002",
  "S2987800"="attend_2003",
  "S4681700"="attend_2004",
  "S6316700"="attend_2005",
  "S8331500"="attend_2006",
  "T0739400"="attend_2007",
  "T2781700"="attend_2008",
  "T4495000"="attend_2009",
  "T6143400"="attend_2010",
  "R0536401"="bmonth",
  "R0536402"="byear",
  "R1482600"="race",
  "R0536300"="sex",
  "R0555800"="psrelpref",
  "R0000100"="id",
  "S0919600"="decide_2002",
  "S6317000"="decide_2005",
  "T2782100"="decide_2008",
  "S0919500"="obey_2002",
  "S6316900"="obey_2005",
  "T2782000"="obey_2008",
  "S5532800"="relpref_2005",
  "T2111400"="relpref_2008",
  "S0919400"="values_2002",
  "S6316800"="values_2005",
  "T2781900"="values_2008",
  "S0919800"="pray_2002",
  "S6317200"="pray_2005",
  "T2782300"="pray_2008",
  "R0552300"="prelpref",
  "R0552200"="praised",
  "R0555700"="psraised" 
                             ))

# keeping only binary responses in attitudinal variables
dsSource$todo_2002=ifelse((dsSource$todo_2002 %in% c(0,1)),dsSource$todo_2002,NA)
dsSource$todo_2005=ifelse((dsSource$todo_2005 %in% c(0,1)),dsSource$todo_2005,NA)
dsSource$todo_2008=ifelse((dsSource$todo_2008 %in% c(0,1)) ,dsSource$todo_2008,NA)

dsSource$values_2002=ifelse((dsSource$values_2002 %in% c(0,1)),dsSource$values_2002,NA)
dsSource$values_2005=ifelse((dsSource$values_2005 %in% c(0,1)),dsSource$values_2005,NA)
dsSource$values_2008=ifelse((dsSource$values_2008 %in% c(0,1)) ,dsSource$values_2008,NA)

dsSource$obey_2002=ifelse((dsSource$obey_2002 %in% c(0,1)),dsSource$obey_2002,NA)
dsSource$obey_2005=ifelse((dsSource$obey_2005 %in% c(0,1)),dsSource$obey_2005,NA)
dsSource$obey_2008=ifelse((dsSource$obey_2008 %in% c(0,1)) ,dsSource$obey_2008,NA)

dsSource$pray_2002=ifelse((dsSource$pray_2002 %in% c(0,1)),dsSource$pray_2002,NA)
dsSource$pray_2005=ifelse((dsSource$pray_2005 %in% c(0,1)),dsSource$pray_2005,NA)
dsSource$pray_2008=ifelse((dsSource$pray_2008 %in% c(0,1)) ,dsSource$pray_2008,NA)

dsSource$decide_2002=ifelse((dsSource$decide_2002 %in% c(0,1)),dsSource$decide_2002,NA)
dsSource$decide_2005=ifelse((dsSource$decide_2005 %in% c(0,1)),dsSource$decide_2005,NA)
dsSource$decide_2008=ifelse((dsSource$decide_2008 %in% c(0,1)) ,dsSource$decide_2008,NA)


# recode negativale worded question:  1 - more religious
dsSource$todo_2002=ifelse((dsSource$todo_2002 %in% c(1)),0,ifelse((dsSource$todo_2002 %in% c(0)),1,NA))
dsSource$todo_2005=ifelse((dsSource$todo_2005 %in% c(1)),0,ifelse((dsSource$todo_2005 %in% c(0)),1,NA))
dsSource$todo_2008=ifelse((dsSource$todo_2008 %in% c(1)),0,ifelse((dsSource$todo_2008 %in% c(0)),1,NA))

dsSource$values_2002=ifelse((dsSource$values_2002 %in% c(1)),0,ifelse((dsSource$values_2002 %in% c(0)),1,NA))
dsSource$values_2005=ifelse((dsSource$values_2005 %in% c(1)),0,ifelse((dsSource$values_2005 %in% c(0)),1,NA))
dsSource$values_2008=ifelse((dsSource$values_2008 %in% c(1)),0,ifelse((dsSource$values_2008 %in% c(0)),1,NA))


# Recode ATTENDANCE into valid values
attendcategoreis<-c(1:8)
dsSource$attend_2000=ifelse((dsSource$attend_2000 %in% attendcategoreis),dsSource$attend_2000,NA)
dsSource$attend_2001=ifelse((dsSource$attend_2001 %in% attendcategoreis),dsSource$attend_2001,NA)
dsSource$attend_2002=ifelse((dsSource$attend_2002 %in% attendcategoreis),dsSource$attend_2002,NA)
dsSource$attend_2003=ifelse((dsSource$attend_2003 %in% attendcategoreis),dsSource$attend_2003,NA)
dsSource$attend_2004=ifelse((dsSource$attend_2004 %in% attendcategoreis),dsSource$attend_2004,NA)
dsSource$attend_2005=ifelse((dsSource$attend_2005 %in% attendcategoreis),dsSource$attend_2005,NA)
dsSource$attend_2006=ifelse((dsSource$attend_2006 %in% attendcategoreis),dsSource$attend_2006,NA)
dsSource$attend_2007=ifelse((dsSource$attend_2007 %in% attendcategoreis),dsSource$attend_2007,NA)
dsSource$attend_2008=ifelse((dsSource$attend_2008 %in% attendcategoreis),dsSource$attend_2008,NA)
dsSource$attend_2009=ifelse((dsSource$attend_2009 %in% attendcategoreis),dsSource$attend_2009,NA)
dsSource$attend_2010=ifelse((dsSource$attend_2010 %in% attendcategoreis),dsSource$attend_2010,NA)

# keep only observations that has non-interrupted attendance for all years
dsSource <- dsSource[dsSource$attend_2000 %in% attendcategoreis, ]
dsSource <- dsSource[dsSource$attend_2001 %in% attendcategoreis, ]
dsSource <- dsSource[dsSource$attend_2002 %in% attendcategoreis, ]
dsSource <- dsSource[dsSource$attend_2003 %in% attendcategoreis, ]
dsSource <- dsSource[dsSource$attend_2004 %in% attendcategoreis, ]
dsSource <- dsSource[dsSource$attend_2005 %in% attendcategoreis, ]
dsSource <- dsSource[dsSource$attend_2006 %in% attendcategoreis, ]
dsSource <- dsSource[dsSource$attend_2007 %in% attendcategoreis, ]
dsSource <- dsSource[dsSource$attend_2008 %in% attendcategoreis, ]
dsSource <- dsSource[dsSource$attend_2009 %in% attendcategoreis, ]
dsSource <- dsSource[dsSource$attend_2010 %in% attendcategoreis, ]

# create variable to record a summarized category of attendance
Absentees<-c(1,2)
Irregulars<-c(3,4,5)
Goers<-c(6,7,8)

dsSource$attcat_2000=ifelse((dsSource$attend_2000 %in% c(1,2)),1,
                            ifelse((dsSource$attend_2000 %in% c(3,4,5)),2,
                                   ifelse((dsSource$attend_2000 %in% c(6,7,8)),3,"ERROR")))
dsSource$attcat_2001=ifelse((dsSource$attend_2001 %in% c(1,2)),1,
                            ifelse((dsSource$attend_2001 %in% c(3,4,5)),2,
                                   ifelse((dsSource$attend_2001 %in% c(6,7,8)),3,"ERROR")))
dsSource$attcat_2002=ifelse((dsSource$attend_2002 %in% c(1,2)),1,
                            ifelse((dsSource$attend_2002 %in% c(3,4,5)),2,
                                   ifelse((dsSource$attend_2002 %in% c(6,7,8)),3,"ERROR")))
dsSource$attcat_2003=ifelse((dsSource$attend_2003 %in% c(1,2)),1,
                            ifelse((dsSource$attend_2003 %in% c(3,4,5)),2,
                                   ifelse((dsSource$attend_2003 %in% c(6,7,8)),3,"ERROR")))
dsSource$attcat_2004=ifelse((dsSource$attend_2004 %in% c(1,2)),1,
                            ifelse((dsSource$attend_2004 %in% c(3,4,5)),2,
                                   ifelse((dsSource$attend_2004 %in% c(6,7,8)),3,"ERROR")))
dsSource$attcat_2005=ifelse((dsSource$attend_2005 %in% c(1,2)),1,
                            ifelse((dsSource$attend_2005 %in% c(3,4,5)),2,
                                   ifelse((dsSource$attend_2005 %in% c(6,7,8)),3,"ERROR")))
dsSource$attcat_2006=ifelse((dsSource$attend_2006 %in% c(1,2)),1,
                            ifelse((dsSource$attend_2006 %in% c(3,4,5)),2,
                                   ifelse((dsSource$attend_2006 %in% c(6,7,8)),3,"ERROR")))
dsSource$attcat_2007=ifelse((dsSource$attend_2007 %in% c(1,2)),1,
                            ifelse((dsSource$attend_2007 %in% c(3,4,5)),2,
                                   ifelse((dsSource$attend_2007 %in% c(6,7,8)),3,"ERROR")))
dsSource$attcat_2008=ifelse((dsSource$attend_2008 %in% c(1,2)),1,
                            ifelse((dsSource$attend_2008 %in% c(3,4,5)),2,
                                   ifelse((dsSource$attend_2008 %in% c(6,7,8)),3,"ERROR")))
dsSource$attcat_2009=ifelse((dsSource$attend_2009 %in% c(1,2)),1,
                            ifelse((dsSource$attend_2009 %in% c(3,4,5)),2,
                                   ifelse((dsSource$attend_2009 %in% c(6,7,8)),3,"ERROR")))
dsSource$attcat_2010=ifelse((dsSource$attend_2010 %in% c(1,2)),1,
                            ifelse((dsSource$attend_2010 %in% c(3,4,5)),2,
                                   ifelse((dsSource$attend_2010 %in% c(6,7,8)),3,"ERROR")))

# create variables that trans the transition between categories
dsSource$transcat_2001<-paste0(dsSource$attcat_2000,dsSource$attcat_2001)
dsSource$transcat_2002<-paste0(dsSource$attcat_2001,dsSource$attcat_2002)
dsSource$transcat_2003<-paste0(dsSource$attcat_2002,dsSource$attcat_2003)
dsSource$transcat_2004<-paste0(dsSource$attcat_2003,dsSource$attcat_2004)
dsSource$transcat_2005<-paste0(dsSource$attcat_2004,dsSource$attcat_2005)
dsSource$transcat_2006<-paste0(dsSource$attcat_2005,dsSource$attcat_2006)
dsSource$transcat_2007<-paste0(dsSource$attcat_2006,dsSource$attcat_2007)
dsSource$transcat_2008<-paste0(dsSource$attcat_2007,dsSource$attcat_2008)
dsSource$transcat_2009<-paste0(dsSource$attcat_2008,dsSource$attcat_2009)
dsSource$transcat_2010<-paste0(dsSource$attcat_2009,dsSource$attcat_2010)

# Include only records with a valid birth year
dsSource <- dsSource[dsSource$byear %in% years, ]

#Include only records with a valid ID
dsSource <- dsSource[dsSource$id != "V", ]
dsSource$id <- as.integer(dsSource$id)
                      
# remove all but one dataset
# rm(list=setdiff(ls(), "dsSource"))

