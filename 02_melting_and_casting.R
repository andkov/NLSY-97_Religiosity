# rm(list=ls(all=TRUE)) #Disable when working in "NLSY-97_Religiosity.Rproj"
require(ggplot2)
require(plyr)
require(reshape2)
require(lme4) #Load the library necessary for multilevel models
require(colorspace) #Load the library necessary for creating tightly-controlled palettes.
require(car)

pathDir<-file.path(getwd())

# DATASET NAMES
#   dsSource      - the clean and processed NLSY file from the source(08032013)
#   dsWattendResp  - subset(dsSource) vars:  original responses to the question (1-8)
#   dsWattend      - subset(dsSource) vars:  Att(endance)Cat(egories) (G-I-A) and  Transitions (gg-gi-ga-ig-ii-ia-ag-ai-aa)
#   dsWcountsProps - summarized of both Counts and Proportions 
#   dsWcounts      - subset(dsWcountsProps) vars   of AttCat (G-I-A) and Transitions (gg-...-aa)
#   dsWprops       - subset(dsWcountsProps) vars  of AttCat (G-I-A) and Transitions (gg-...-aa)

#   dsWpropsObs     - observed proportions ready for modeling
#   dsWcountsObs    - observed counts in ready for modeling
#   dsL*****  - eLONGated datasets 

# # import the results of "data input and processing.R" 
# Source<-c("NLSY97_Religion_08032013")
# pathSource <- file.path(pathDir, Source,paste0(Source,"_clean.csv"))
# dsSource <- read.csv(pathSource, stringsAsFactors=FALSE)
dsSource <- rename(dsSource, c(byear="cohort"))

# Long of church Attendance (1-8) over years (2000-2010) 
#------------------------------------------------------------------------------------------------------------#
keepvar <- c("id", "cohort", "attend_2000", 
             "attend_2001","attend_2002","attend_2003","attend_2004","attend_2005",
             "attend_2006","attend_2007","attend_2008","attend_2009","attend_2010")
dsWattendResp <- dsSource[keepvar]

#Transform the wide dataset into a long dataset
dsLong <- reshape2::melt(dsWattendResp, id.vars=c("id", "cohort"))  ## id.vars declares MEASURED variables (as opposed to RESPONSE variable)
dsLong$variable <- gsub(pattern="attend_", replacement="", x=dsLong$variable) #Strip off the prefix
dsLong$variable <- as.integer(dsLong$variable) #Convert to a number.
dsLong <- plyr::rename(dsLong, replace=c(variable="time", value="attendence"))
dsLong<-mutate(dsLong,timec=time-2000) # creates centered variable
dsLong<-mutate(dsLong,age=time-cohort) # computes age in years at time of interview
dsLong<-dsLong[c("id", "cohort", "time", "timec", "age","attendence")]
#Sort for the sake of visual inspection.
dsLong<-dsLong[order(dsLong$id,dsLong$time),]
dsLattendResp<-dsLong
rm(dsLong)
head(dsLattendResp, 20)



# Long of      AttCat(G-I-A) and   Transitions (gg-...-aa) over years(2000-2010) 
# catatrans      cat(egories) [of] a(ttendance) [and] trans(itions) [between categories] 
#------------------------------------------------------------------------------------------------------------#
keepvar <- c("id", "cohort", "attcat_2000", 
             "attcat_2001","attcat_2002","attcat_2003","attcat_2004","attcat_2005",
             "attcat_2006","attcat_2007","attcat_2008","attcat_2009","attcat_2010",
             "transcat_2001","transcat_2002","transcat_2003","transcat_2004","transcat_2005",
             "transcat_2006","transcat_2007","transcat_2008","transcat_2009","transcat_2010")
dsWcatatrans <- dsSource[keepvar]

#Transform the wide dataset into a long dataset - Use generic dsLong name for this common transformation
dsLong <- reshape2::melt(dsWcatatrans, id.vars=c("id", "cohort"))  ## id.vars declares MEASURED variables (as opposed to RESPONSE variable)

dsLong$value =      ifelse((dsLong$value %in% c(1)),"A",
                    ifelse((dsLong$value %in% c(2)),"I",
                    ifelse((dsLong$value %in% c(3)),"G",
                    ifelse((dsLong$value %in% c(33)),"gg",
                    ifelse((dsLong$value %in% c(32)),"gi",
                    ifelse((dsLong$value %in% c(31)),"ga",                                  
                    ifelse((dsLong$value %in% c(23)),"ig",
                    ifelse((dsLong$value %in% c(22)),"ii",
                    ifelse((dsLong$value %in% c(21)),"ia",
                    ifelse((dsLong$value %in% c(13)),"ag",
                    ifelse((dsLong$value %in% c(12)),"ai",
                    ifelse((dsLong$value %in% c(11)),"aa",NA))))))))))))

table(dsLong$value)
# make $catatrans an ordered factor
dsLong$value<-factor(dsLong$value,levels=c("G","gg", "gi", "ga",
                                           "I", "ig", "ii", "ia",
                                          "A", "ag", "ai", "aa"))
table(dsLong$value)

# Process the newly created $variable containing the names of wide timeseries variables
dsLong$variable <- gsub(pattern="attcat_", replacement="", x=dsLong$variable) #Strip off the prefix
dsLong$variable <- gsub(pattern="transcat_", replacement="", x=dsLong$variable) #Strip off the prefix
dsLong$variable <- as.integer(dsLong$variable) #Convert to a number.
# catatrans = cat(egories of worship)a(ttendance and )trans(itions between them)
dsLong <- plyr::rename(dsLong, replace=c(variable="time", value="catatrans"))
dsLong<-mutate(dsLong,age=time-cohort) # computes age in years at time of interview
dsLong<-dsLong[c("id", "cohort", "time","age","catatrans")] # select and order variables
dsLcatatrans <- dsLong[order(dsLong$id, dsLong$time), ] # sort for visual inspection
rm(dsLong) # dsLong a generic name of datasets in these transformations 
head(dsLcatatrans, 20) 

# prefix notation in variable names:
# n** = number count of each unique $catatrans (total of 12)  for that year
# p** = proportion of $catatrans from the total number for that year

#Create a function to summarize each cohort*time cell
SummarizeCohortTime <- function( df ) {#df stands for 'data.frame'
  #Create a new data.frame with three columns
  dsResult <- data.frame(
    nG   = sum(df$catatrans %in% c("G")),    #Goers
    nI   = sum(df$catatrans %in% c("I")),    #Irregulars
    nA   = sum(df$catatrans %in% c("A")),    #Absentees
    ngg  = sum(df$catatrans %in% c("gg")),
    ngi  = sum(df$catatrans %in% c("gi")),
    nga  = sum(df$catatrans %in% c("ga")),
    nig  = sum(df$catatrans %in% c("ig")),
    nii  = sum(df$catatrans %in% c("ii")),
    nia  = sum(df$catatrans %in% c("ia")),
    nag  = sum(df$catatrans %in% c("ag")),
    nai  = sum(df$catatrans %in% c("ai")),
    naa  = sum(df$catatrans %in% c("aa"))
    
  )
  
  #Calculate the proportions
  cellCount <- dsResult$nG + dsResult$nI + dsResult$nA
  #   print(length(cellCount))
  #Equivalent way: cellCount <- apply(dsResult[, c('TotalGoers', 'TotalIrregulars', 'TotalAbsentees')], 1, sum)
  dsResult$pG <- dsResult$nG / cellCount
  dsResult$pI <- dsResult$nI / cellCount
  dsResult$pA <- dsResult$nA/ cellCount  
  dsResult$pgg <- ifelse(dsResult$ngg==0,NA, (dsResult$ngg/ cellCount))  
  dsResult$pgi <- ifelse(dsResult$ngi==0,NA, (dsResult$ngi/ cellCount))   
  dsResult$pga <- ifelse(dsResult$nga==0,NA, (dsResult$nga/ cellCount))    
  dsResult$pig <- ifelse(dsResult$nig==0,NA, (dsResult$nig/ cellCount))    
  dsResult$pii <- ifelse(dsResult$nii==0,NA, (dsResult$nii/ cellCount))    
  dsResult$pia <- ifelse(dsResult$nia==0,NA, (dsResult$nia/ cellCount))  
  dsResult$pag <- ifelse(dsResult$nag==0,NA, (dsResult$nag/ cellCount))   
  dsResult$pai <- ifelse(dsResult$nai==0,NA, (dsResult$nai/ cellCount))    
  dsResult$paa <- ifelse(dsResult$naa==0,NA, (dsResult$naa/ cellCount))  
  
  #Check that the totals sum to 1.0.  Throw an error if not.
  #dsResult$ProportionTotal <- dsResult$pG + dsResult$pI + dsResult$pG
  proportionTotal <- dsResult$pG + dsResult$pI + dsResult$pA
  if( abs(proportionTotal - 1) > 1e-7 ) stop("The proportions summing to 1 for each cohort*time cell.")

  #Return the new data.frame (presumably to the ddply call).
  return( dsResult)
}
# Create a data.frame that has a row for each unique summarize each cohort*time combination.
dsSWcatatrans <- plyr::ddply(dsLcatatrans, .variables=c("cohort", "time","age"), .fun=SummarizeCohortTime)

#############################################################################
# Create dataset with count NUMBERS of subjects in categories and transitions
dsSWcounts <- dsSWcatatrans[,c("cohort", "time", "age",
                              "nG","ngg", "ngi", "nga",
                              "nI", "nig", "nii", "nia",
                              "nA", "nag", "nai", "naa")]
# melt into LONG with count NUMBERS as the outcome
dsSLcounts <- reshape2::melt(dsSWcounts, id.vars=c("time", "cohort","age"))  ## id.vars declares MEASURED variables (as opposed to RESPONSE variable)
dsSLcounts<- plyr::rename(dsSLcounts, replace=c(variable="catatrans", value="count"))
dsSLcounts<-mutate(dsSLcounts,catatransT=paste0(catatrans,substr(time,3,4)))

# cast into the SUMMARY WIDE format for evaluating model solutions
dsSLcounts<-mutate(dsSLcounts,catatransT=paste0(catatrans,substr(time,3,4)))
# order $catatrans before casting
dsSLcounts$catatrans<-factor(dsSLcounts$catatrans,levels=c("cohort", "time", "age",
                                           "nG","ngg", "ngi", "nga",
                                           "nI" , "nig", "nii", "nia",
                                           "nA", "nag", "nai", "naa"))
dsOBScounts<-dcast(dsSLcounts,value.var="count", cohort ~ catatransT,mean)



#############################################################################
# Create dataset with PROPORTION  of NUMBERS from total 
dsSWprops <- dsSWcatatrans[,c("cohort", "time", "age",
                             "pG","pgg", "pgi", "pga",
                             "pI", "pig", "pii", "pia",
                             "pA", "pag", "pai", "paa")]
# melt into LONG with prevalance as the outcome
dsSLprops <- reshape2::melt(dsSWprops, id.vars=c("time", "cohort","age"))  ## id.vars declares MEASURED variables (as opposed to RESPONSE variable)
dsSLprops<- plyr::rename(dsSLprops, replace=c(variable="catatrans", value="obs_proportion"))
# Create toggle variables for faceting in the 3x3 parameter matrix
dsSLprops$mx =      ifelse((dsSLprops$catatrans %in% c("pA","pI","pG")),substr(dsSLprops$catatrans,2,2),
                                toupper(substr(dsSLprops$catatrans,2,2)))
dsSLprops$my =      ifelse((dsSLprops$catatrans %in% c("pA","pI","pG")),substr(dsSLprops$catatrans,2,2),
                                toupper(substr(dsSLprops$catatrans,3,3)))
dsSLprops$mx<-factor(dsSLprops$mx,levels=c("G","I","A"))
dsSLprops$my<-factor(dsSLprops$my,levels=c("G","I","A"))
str(dsSLprops)
# create an interaction variable catatran*time
dsSLprops<-mutate(dsSLprops,catatransT=paste0(catatrans,substr(time,3,4)))
# order $catatrans before casting
dsSLprops$catatrans<-factor(dsSLprops$catatrans,levels=c("cohort", "time", "age",
                                                         "pG","pgg", "pgi", "pga",
                                                         "pI", "pig", "pii", "pia",
                                                         "pA", "pag", "pai", "paa"))
# cast into the wide format for evaluating model solutions
dsOBSprops<-dcast(dsSLprops,value.var="obs_proportion", cohort ~ catatransT,mean)


# # remove all but one dataset
# rm(list=setdiff(ls(), "dsOBSprop"))



######################### Scramble code particles past this line ####################################################
#                        Use for convenient assembly of code only 

# pathDataOut<-file.path(pathDir,dataSource,paste0(dataSource,"_clean.csv"))
# write.csv(dsSource,file=pathDataOut)

# prepares the files for merging with the model resuls
# and for computing the model predictions

# now go to GGPLOT and start drawing







# 
# 
# 
# # Create a data.frame that has a row for each unique summarize each cohort*time combination.
# dsProps <- plyr::ddply(dsLong, .variables=c("cohort", "time"), .fun=SummarizeCohortTime)
# dsProps <- dsProps[,c("cohort", "time", "pG", "pI", "pA")]
# 
# # dsProps Into dsLongProps
# #Transform the wide dataset into a long dataset
# dsLongProps <- reshape2::melt(dsProps, id.vars=c("cohort","time"))  ## id.vars declares MEASURED variables (as opposed to RESPONSE variable)
# dsLongProps <- plyr::rename(dsLongProps, replace=c(variable="catatrans", value="prevalence"))
# dsLongProps <- dsLongProps[order(dsLongProps$catatrans, dsLongProps$cohort), ] #Sort for the sake of visual inspection.
# 
# # dsProps Into dsPropsTimed
# #Transform the wide dataset into a wide by time
# dsPropsTimed<-dcast(dsLongProps, time ~ catatrans, mean)
# ?dcast
# pathOutPrevs<-file.path(pathDir, dataSource,paste0(Source,"_Prevs.csv"))
# write.csv(dsProps,pathOutPrevs,  row.names=FALSE)
#------------------------------------------------------------------------------------------------------------#




