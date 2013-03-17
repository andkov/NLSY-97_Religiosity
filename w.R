rm(list=ls(all=TRUE)) #Clear out variables from previous runs.
require(ggplot2)
require(plyr)
require(reshape2)
require(lme4) #Load the library necessary for multilevel models
require(colorspace) #Load the library necessary for creating tightly-controlled palettes.
require(car)

# create a data frame from scratch 
cohort <- c(1980,1981,1982)
G00 <- c(.15, .2,.4)
I00 <- c(.25, .3, .4) 
A00 <-c(.6, .5,.2)
Tgi<-c(.6,.5,.4)
Tga<-c(.2,.25,.35)
ds <- data.frame(cohort,G00,I00,A00,Tgi,Tga)
print (ds)

#Create a function to cast prediction using statistical model
forecast<- function( df ) {#df stands for 'data.frame'
  #Create a new data.frame with three columns
  dsResult <- data.frame(
    cohort= df$cohort,
    G01   = df$G00 -df$Tgi +df$Tga ,    #Goers
    I01   = df$I00 -df$Tgi +df$Tga,    #Irregulars
    A01  =  df$A00 -df$Tgi +df$Tga    #Absentees
  
  )
  dsResult<- merge(df,dsResult,by="cohort")
  return( dsResult)
}
new<-forecast(ds)

# Create a data.frame that has a row for each unique summarize each cohort*time combination.
new <- plyr::ddply(mydata, .variables=c("cohort","G00", "G01"), .fun=forecast)

 cohort <- c(1980,1981,1982)
 A00 <- c(.15, .2,.4)
 B00 <- c(.25, .3, .4) 
 C00 <-c(.6, .5,.2)
 Tab<-c(.6,.5,.4)
 Tac<-c(.2,.25,.35)
 ds <- data.frame(cohort,A00,B00,C00,Tab,Tac)
 print (ds)

forecast<- function( df ) {
  dsResult <- data.frame(
    cohort= df$cohort,
    A01   = df$A00 -df$Tab +df$Tac ,    
    B01   = df$B00 -df$Tab +df$Tac,    
    C01  =  df$C00 -df$Tab +df$Tac    
    
  )
  dsResult<- merge(df,dsResult,by="cohort")
  return( dsResult)
}
new<-forecast(ds)
print(new)