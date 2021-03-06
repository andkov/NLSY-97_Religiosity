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
print(new)

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

As <- c(0.401088929, 0.340290381,  0.249546279, 0.218693285,    0.180580762,     0.167876588,    0.157894737,    0.158802178,  0.161524501)
Bs <- c(0.233212341, 0.256805808,  0.288566243, 0.305807623,    0.27676951,       0.270417423,    0.229582577,    0.250453721,  0.237749546)
Cs  <-c(0.36569873,  0.402903811,  0.461887477, 0.475499093,    0.542649728,     0.561705989,    0.612522686,    0.590744102,  0.600725953)
years <- seq_along(As)
Tab <- c(.6)
Tac <- c(.2)
Tbc <- c(.5)
Tca <-c(1)
Tcb <-c(1)
Tbc <-c(1)
#....more Ts....
dsO <- data.frame(Year=years, A=As, B=Bs, C=Cs) #Stands for observed
dsP <- data.frame(Year=years, A=NA_real_, B=NA_real_, C=NA_real_) #Stands for predicted

#Make sure the 'years' array is sorted in ascending order.
for( i in years[-1] ) {
  dsP[dsP$Year == i, "A"] <- dsO[dsO$Year == i-1, "A"] + dsO[dsO$Year == i-1, "B"]*Tbc + dsO[dsO$Year == i-1, "C"]*Tca
  dsP[dsP$Year == i, "B"] <- dsO[dsO$Year == i-1, "B"] + dsO[dsO$Year == i-1, "A"]*Tab + dsO[dsO$Year == i-1, "C"]*Tcb
  dsP[dsP$Year == i, "C"] <- dsO[dsO$Year == i-1, "C"] + dsO[dsO$Year == i-1, "A"]*Tac + dsO[dsO$Year == i-1, "B"]*Tbc
  
}