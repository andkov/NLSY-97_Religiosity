rm(list=ls(all=TRUE)) #Clear all the variables from previous runs
setwd("C:/Dropbox/LeaRn/Packages/ggplot2/data")

install.packages("ggplot2")
library(ggplot2)
attend<-dsWide


head(attend)
str(attend)
summary(attend)

qplot(values_,, data=attend,geom="histogram",binwidth=1)