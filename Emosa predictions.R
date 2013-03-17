# rm(list=ls(all=TRUE)) #Clear out variables from previous runs.
require(ggplot2)
require(plyr)
library(reshape)
require(reshape2)
require(lme4) #Load the library necessary for multilevel models
require(colorspace) #Load the library necessary for creating tightly-controlled palettes.

pathDirectory <- file.path(getwd())
pathEmosa<-file.path("C:/Users/inspirion/Documents/GitHub/EMOSA")

#Select the specification of EMOSA and implied distribution
specification<-c("original") 
distribution<-c("Gauss")

pars12<- c("Tgi","Tga","Tig","Tag","Tia","Tai",
           "Cgi","Cga","Cig","Cag","Cia","Cai")  

modelC<-paste0(specification,"Contagion",distribution)
modelD<-paste0(specification,"Diffusion",distribution)

# input the model soution
# reads in the result of a model run: Hybrid, Contagion, or Diffusion for 5 cohorts

dsModelC<-read.csv(file.path(pathEmosa,modelC,paste0(modelC,"_resultsIn",".csv")),stringsAsFactors=FALSE)
dsModelD<-read.csv(file.path(pathEmosa,modelD,paste0(modelD,"_resultsIn",".csv")),stringsAsFactors=FALSE)

# select only the parameter values
dsModelCPars<-dsModelC[,c("model","cohort",pars12)]
dsModelDPars<-dsModelD[,c("model","cohort",pars12)]

# attaches observed prevalences to the model solution
dsModelCPars<-join(dsModelCPars,dsWpropsObs, by="cohort")


dsModels<-rbind(dsModelCPars,dsModelDPars) # stacked ds with models solutions (H,C,D)



#Create a traditional Contagion prediction
originalContagion<- function( df ) {#df stands for 'data.frame'
  #Create a new data.frame with three columns
  dsResult <- data.frame(
    cohort= df$cohort,
    mG00 =df$pG00, 
    mI00 =df$pI00, 
    mA00 =df$pA00,
    
    mgi01 =df$Tgi*df$pG00*df$pI00,
    mga01 =df$Tga*df$pG00*df$pA00,
    mia01 =df$Tia*df$pI00*df$pA00,
    mai01 =df$Tai*df$pA00*df$pI00,
    mag01 =df$Tag*df$pA00*df$pA00,
    mig01 =df$Tig*df$pI00*df$pG00,
    mgg01 =1-df$Tgi*df$pG00*df$pI00-df$Tga*df$pG00*df$pA00,
    mii01 =1-df$Tig*df$pI00*df$pG00-df$Tia*df$pI00*df$pA00,
    maa01 =1-df$Tag*df$pA00*df$pA00-df$Tai*df$pA00*df$pI00,
    mG01   = df$pG00 - df$Tgi*df$pG00*df$pI00 -  df$Tga*df$pG00*df$pA00 
                     + df$Tig*df$pI00*df$pG00 +  df$Tag*df$pA00*df$pA00,    #Goers
    mI01   = df$pI00 - df$Tgi*df$pG00*df$pI00 -  df$Tia*df$pI00*df$pA00 
                     + df$Tgi*df$pG00*df$pI00 +  df$Tai*df$pA00*df$pI00,   #Irregulars
    mA01  =  df$pA00 - df$Tgi*df$pG00*df$pI00 -  df$Tga*df$pG00*df$pA00 
                     + df$Tig*df$pI00*df$pG00 +  df$Tag*df$pA00*df$pA00,   #Absentees

    mgi02 =df$Tgi*df$pG01*df$pI01,
    mga02 =df$Tga*df$pG01*df$pA01,
    mia02 =df$Tia*df$pI01*df$pA01,
    mai02 =df$Tai*df$pA01*df$pI01,
    mag02 =df$Tag*df$pA01*df$pA01,
    mig02 =df$Tig*df$pI01*df$pG01,
    mgg02 =1-df$Tgi*df$pG01*df$pI01-df$Tga*df$pG01*df$pA01,
    mii02 =1-df$Tig*df$pI01*df$pG01-df$Tia*df$pI01*df$pA01,
    maa02 =1-df$Tag*df$pA01*df$pA01-df$Tai*df$pA01*df$pI01,
    mG02   = df$pG01 - df$Tgi*df$pG01*df$pI01 -  df$Tga*df$pG01*df$pA01 
    + df$Tig*df$pI01*df$pG01 +  df$Tag*df$pA01*df$pA01,    
    mI02   = df$pI01 - df$Tgi*df$pG01*df$pI01 -  df$Tia*df$pI01*df$pA01 
    + df$Tgi*df$pG01*df$pI01 +  df$Tai*df$pA01*df$pI01,   
    mA02  =  df$pA01 - df$Tgi*df$pG01*df$pI01 -  df$Tga*df$pG01*df$pA01 
    + df$Tig*df$pI01*df$pG01 +  df$Tag*df$pA01*df$pA01,
    
    mgi03 =df$Tgi*df$pG02*df$pI02,
    mga03 =df$Tga*df$pG02*df$pA02,
    mia03 =df$Tia*df$pI02*df$pA02,
    mai03 =df$Tai*df$pA02*df$pI02,
    mag03 =df$Tag*df$pA02*df$pA02,
    mig03 =df$Tig*df$pI02*df$pG02,
    mgg03 =1-df$Tgi*df$pG02*df$pI02-df$Tga*df$pG02*df$pA02,
    mii03 =1-df$Tig*df$pI02*df$pG02-df$Tia*df$pI02*df$pA02,
    maa03 =1-df$Tag*df$pA02*df$pA02-df$Tai*df$pA02*df$pI02,
    mG03   = df$pG02 - df$Tgi*df$pG02*df$pI02 -  df$Tga*df$pG02*df$pA02 
    + df$Tig*df$pI02*df$pG02 +  df$Tag*df$pA02*df$pA02,    
    mI03   = df$pI02 - df$Tgi*df$pG02*df$pI02 -  df$Tia*df$pI02*df$pA02 
    + df$Tgi*df$pG02*df$pI02 +  df$Tai*df$pA02*df$pI02,   
    mA03  =  df$pA02 - df$Tgi*df$pG02*df$pI02 -  df$Tga*df$pG02*df$pA02 
    + df$Tig*df$pI02*df$pG02 +  df$Tag*df$pA02*df$pA02, 
    
    mgi04 =df$Tgi*df$pG03*df$pI03,
    mga04 =df$Tga*df$pG03*df$pA03,
    mia04 =df$Tia*df$pI03*df$pA03,
    mai04 =df$Tai*df$pA03*df$pI03,
    mag04 =df$Tag*df$pA03*df$pA03,
    mig04 =df$Tig*df$pI03*df$pG03,
    mgg04 =1-df$Tgi*df$pG03*df$pI03-df$Tga*df$pG03*df$pA03,
    mii04 =1-df$Tig*df$pI03*df$pG03-df$Tia*df$pI03*df$pA03,
    maa04 =1-df$Tag*df$pA03*df$pA03-df$Tai*df$pA03*df$pI03,
    mG04   = df$pG03 - df$Tgi*df$pG03*df$pI03 -  df$Tga*df$pG03*df$pA03 
    + df$Tig*df$pI03*df$pG03 +  df$Tag*df$pA03*df$pA03,    
    mI04   = df$pI03 - df$Tgi*df$pG03*df$pI03 -  df$Tia*df$pI03*df$pA03 
    + df$Tgi*df$pG03*df$pI03 +  df$Tai*df$pA03*df$pI03,   
    mA04  =  df$pA03 - df$Tgi*df$pG03*df$pI03 -  df$Tga*df$pG03*df$pA03 
    + df$Tig*df$pI03*df$pG03 +  df$Tag*df$pA03*df$pA03, 
    
    mgi05 =df$Tgi*df$pG04*df$pI04,
    mga05 =df$Tga*df$pG04*df$pA04,
    mia05 =df$Tia*df$pI04*df$pA04,
    mai05 =df$Tai*df$pA04*df$pI04,
    mag05 =df$Tag*df$pA04*df$pA04,
    mig05 =df$Tig*df$pI04*df$pG04,
    mgg05 =1-df$Tgi*df$pG04*df$pI04-df$Tga*df$pG04*df$pA04,
    mii05 =1-df$Tig*df$pI04*df$pG04-df$Tia*df$pI04*df$pA04,
    maa05 =1-df$Tag*df$pA04*df$pA04-df$Tai*df$pA04*df$pI04,
    mG05   = df$pG04 - df$Tgi*df$pG04*df$pI04 -  df$Tga*df$pG04*df$pA04 
    + df$Tig*df$pI04*df$pG04 +  df$Tag*df$pA04*df$pA04,    
    mI05   = df$pI04 - df$Tgi*df$pG04*df$pI04 -  df$Tia*df$pI04*df$pA04 
    + df$Tgi*df$pG04*df$pI04 +  df$Tai*df$pA04*df$pI04,   
    mA05  =  df$pA04 - df$Tgi*df$pG04*df$pI04 -  df$Tga*df$pG04*df$pA04 
    + df$Tig*df$pI04*df$pG04 +  df$Tag*df$pA04*df$pA04 ,
    
    mgi06 =df$Tgi*df$pG05*df$pI05,
    mga06 =df$Tga*df$pG05*df$pA05,
    mia06 =df$Tia*df$pI05*df$pA05,
    mai06 =df$Tai*df$pA05*df$pI05,
    mag06 =df$Tag*df$pA05*df$pA05,
    mig06 =df$Tig*df$pI05*df$pG05,
    mgg06 =1-df$Tgi*df$pG05*df$pI05-df$Tga*df$pG05*df$pA05,
    mii06 =1-df$Tig*df$pI05*df$pG05-df$Tia*df$pI05*df$pA05,
    maa06 =1-df$Tag*df$pA05*df$pA05-df$Tai*df$pA05*df$pI05,
    mG06   = df$pG05 - df$Tgi*df$pG05*df$pI05 -  df$Tga*df$pG05*df$pA05 
    + df$Tig*df$pI05*df$pG05 +  df$Tag*df$pA05*df$pA05,    
    mI06   = df$pI05 - df$Tgi*df$pG05*df$pI05 -  df$Tia*df$pI05*df$pA05 
    + df$Tgi*df$pG05*df$pI05 +  df$Tai*df$pA05*df$pI05,   
    mA06  =  df$pA05 - df$Tgi*df$pG05*df$pI05 -  df$Tga*df$pG05*df$pA05 
    + df$Tig*df$pI05*df$pG05 +  df$Tag*df$pA05*df$pA05,
    
    mgi07 =df$Tgi*df$pG06*df$pI06,
    mga07 =df$Tga*df$pG06*df$pA06,
    mia07 =df$Tia*df$pI06*df$pA06,
    mai07 =df$Tai*df$pA06*df$pI06,
    mag07 =df$Tag*df$pA06*df$pA06,
    mig07 =df$Tig*df$pI06*df$pG06,
    mgg07 =1-df$Tgi*df$pG06*df$pI06-df$Tga*df$pG06*df$pA06,
    mii07 =1-df$Tig*df$pI06*df$pG06-df$Tia*df$pI06*df$pA06,
    maa07 =1-df$Tag*df$pA06*df$pA06-df$Tai*df$pA06*df$pI06,
    mG07   = df$pG06 - df$Tgi*df$pG06*df$pI06 -  df$Tga*df$pG06*df$pA06 
    + df$Tig*df$pI06*df$pG06 +  df$Tag*df$pA06*df$pA06,    
    mI07   = df$pI06 - df$Tgi*df$pG06*df$pI06 -  df$Tia*df$pI06*df$pA06 
    + df$Tgi*df$pG06*df$pI06 +  df$Tai*df$pA06*df$pI06,   
    mA07  =  df$pA06 - df$Tgi*df$pG06*df$pI06 -  df$Tga*df$pG06*df$pA06 
    + df$Tig*df$pI06*df$pG06 +  df$Tag*df$pA06*df$pA06, 
    
    mgi08 =df$Tgi*df$pG07*df$pI07,
    mga08 =df$Tga*df$pG07*df$pA07,
    mia08 =df$Tia*df$pI07*df$pA07,
    mai08 =df$Tai*df$pA07*df$pI07,
    mag08 =df$Tag*df$pA07*df$pA07,
    mig08 =df$Tig*df$pI07*df$pG07,
    mgg08 =1-df$Tgi*df$pG07*df$pI07-df$Tga*df$pG07*df$pA07,
    mii08 =1-df$Tig*df$pI07*df$pG07-df$Tia*df$pI07*df$pA07,
    maa08 =1-df$Tag*df$pA07*df$pA07-df$Tai*df$pA07*df$pI07,
    mG08   = df$pG07 - df$Tgi*df$pG07*df$pI07 -  df$Tga*df$pG07*df$pA07 
    + df$Tig*df$pI07*df$pG07 +  df$Tag*df$pA07*df$pA07,    
    mI08   = df$pI07 - df$Tgi*df$pG07*df$pI07 -  df$Tia*df$pI07*df$pA07 
    + df$Tgi*df$pG07*df$pI07 +  df$Tai*df$pA07*df$pI07,   
    mA08  =  df$pA07 - df$Tgi*df$pG07*df$pI07 -  df$Tga*df$pG07*df$pA07 
    + df$Tig*df$pI07*df$pG07 +  df$Tag*df$pA07*df$pA07, 
    
    mgi09 =df$Tgi*df$pG08*df$pI08,
    mga09 =df$Tga*df$pG08*df$pA08,
    mia09 =df$Tia*df$pI08*df$pA08,
    mai09 =df$Tai*df$pA08*df$pI08,
    mag09 =df$Tag*df$pA08*df$pA08,
    mig09 =df$Tig*df$pI08*df$pG08,
    mgg09 =1-df$Tgi*df$pG08*df$pI08-df$Tga*df$pG08*df$pA08,
    mii09 =1-df$Tig*df$pI08*df$pG08-df$Tia*df$pI08*df$pA08,
    maa09 =1-df$Tag*df$pA08*df$pA08-df$Tai*df$pA08*df$pI08,
    mG09   = df$pG08 - df$Tgi*df$pG08*df$pI08 -  df$Tga*df$pG08*df$pA08 
    + df$Tig*df$pI08*df$pG08 +  df$Tag*df$pA08*df$pA08,    
    mI09   = df$pI08 - df$Tgi*df$pG08*df$pI08 -  df$Tia*df$pI08*df$pA08 
    + df$Tgi*df$pG08*df$pI08 +  df$Tai*df$pA08*df$pI08,   
    mA09  =  df$pA08 - df$Tgi*df$pG08*df$pI08 -  df$Tga*df$pG08*df$pA08 
    + df$Tig*df$pI08*df$pG08 +  df$Tag*df$pA08*df$pA08,
    
    mgi10 =df$Tgi*df$pG09*df$pI09,
    mga10 =df$Tga*df$pG09*df$pA09,
    mia10 =df$Tia*df$pI09*df$pA09,
    mai10 =df$Tai*df$pA09*df$pI09,
    mag10 =df$Tag*df$pA09*df$pA09,
    mig10 =df$Tig*df$pI09*df$pG09,
    mgg10 =1-df$Tgi*df$pG09*df$pI09-df$Tga*df$pG09*df$pA09,
    mii10 =1-df$Tig*df$pI09*df$pG09-df$Tia*df$pI09*df$pA09,
    maa10 =1-df$Tag*df$pA09*df$pA09-df$Tai*df$pA09*df$pI09,
    mG10   = df$pG09 - df$Tgi*df$pG09*df$pI09 -  df$Tga*df$pG09*df$pA09 
    + df$Tig*df$pI09*df$pG09 +  df$Tag*df$pA09*df$pA09,    
    mI10   = df$pI09 - df$Tgi*df$pG09*df$pI09 -  df$Tia*df$pI09*df$pA09 
    + df$Tgi*df$pG09*df$pI09 +  df$Tai*df$pA09*df$pI09,   
    mA10  =  df$pA09 - df$Tgi*df$pG09*df$pI09 -  df$Tga*df$pG09*df$pA09 
    + df$Tig*df$pI09*df$pG09 +  df$Tag*df$pA09*df$pA09   
    
  )
  dsResult<- merge(df,dsResult,by="cohort")
  return( dsResult)
}
dsContagion<-originalContagion(dsModelCPars)

# remove all but one dataset
rm(list=setdiff(ls(), "dsContagion"))

?substr
