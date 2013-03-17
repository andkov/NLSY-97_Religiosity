#---1---1-------------------------------------------------------------------------------------------#
# Options Links and Datasets
require(ggplot2)
require(plyr)
require(reshape2)
require(colorspace) #Load the library necessary for creating tightly-controlled palettes.


# Values and palettes

attcol8<-c("blue3","blue","lightblue", "snow", "lightpink", "red" ,"red3", "red4")
attcol3<-c("blue2","blue2","snow", "snow", "snow", "red2" ,"red2", "red2")
prevcol3<-c("blue2","snow","red2")

categories8long<-c("Never",
                   "Once or twice","Less than once a month/ 3-12 times",
                   "About once a month/ 12 times",
                   "About tiwce a month/ 24 times",
                   "About once a week",
                   "Several times a week",
                   "Everyday")
categories8<-    c("Never    ",
                   "1-2/year ",
                   "3-12/year",
                   "~1/month ",
                   "~2/month ",
                   "~1/week  ",
                   "2-3/week ",
                   "Everyday ")
categories3<-c("Goers","Irregulars","Absentees")
categories38<-c("Absentees","Absentees","Irregulars","Irregulars","Irregulars","Goers","Goers","Goers")
catatrans<-factor(c("G","gg", "gi", "ga",
                    "I", "ig", "ii", "ia",
                    "A", "ag", "ai", "aa"),order=TRUE)
# Graphs
cohortYear <- 1984
allCohorts<-c("1980","1981","1982","1983","1984" )

# 1 
#------------------------------------------------graph 1------#
# str(dsSLprops)
# dsFORp <- subset(dsSLprops, cohort %in% cohortYear)
# p<-ggplot(dsFORp, aes(x=time-2000))
# p<-p+
#   geom_point(aes(y=proportion,colour=catatrans))+
#   geom_smooth(aes(y=proportion,colour=catatrans))+
#   scale_y_continuous("Prevalence: proportion of total",
#                      limits=c(0, 1),
#                      breaks=c(.1,.2,.3,.4,.5,.6,.7,.8,.9,1))+
# #   scale_color_manual(values = c("pG"="green2","pI"="goldenrod2","pA"="red3"),
# #                      name= " ")+
#   scale_x_discrete("years since 2000")+
#   labs(title=paste0("In the past year, how often have you attended a worship service?",
#                     "  for cohort(s)",cohortYear))
# p
#------------------------------------------------graph 1------#
?subset



# Prevalence for all 5 cohorts - Ready for interaction
#------------------------------------------------graph 2------#
str(dsSLprops)
dsFORp <- dsSLprops[(dsSLprops$cohort %in% allCohorts),]
# select prevalences ("pA","pI","pG") or transitions ("pgg","pgi","pga","pig","pii","pia","pag","pai","paa")
dsFORp <- dsFORp[(dsSLprops$catatrans %in% c("pA","pI","pG")),] 
dsFORp$cohort<-factor(dsFORp$cohort, levels=c(1984:1980))
p<-ggplot(dsFORp, aes(x=age,y=proportion,group=catatrans,fill=factor(catatrans)))+
  scale_color_manual(values = c("pG"="green2","pI"="goldenrod2","pA"="red3"))+
  geom_line(aes(colour = catatrans))+
  facet_grid(. ~ cohort)+
  geom_point(aes(colour=catatrans),show_guide = FALSE)+
  scale_y_continuous("Prevalence: proportion of total",
                       limits=c(0, .7),
                       breaks=c(0,.1,.2,.3,.4,.5,.6,.7))+
#   scale_x_continuous("years after 2000",              # for aes(x=time-2000)
#                      limits=c(0, 10),
#                      breaks=c(0:10))+
  scale_x_continuous("age in years at interview",     # for aes(x=age)
                     limits=c(16,30),
                     breaks=c(16:30))+
  labs(title=paste0("Observed by predicted for each cohort"))
p
# plast<-p
#------------------------------------------------graph 2------#












# proportion by 5 cohorts
dsFORp <- subset(dsPrevsLong, cohort %in% allCohorts)
p<-ggplot(dsFORp, aes(x=time,y=proportion,group=catatrans,fill=factor(catatrans)))+
  scale_color_manual(values = c("pG"="green2","pI"="goldenrod2","pA"="red3"))+
  geom_line(aes(colour = catatrans))+ facet_grid(. ~ cohort)+
  geom_point(aes(colour=catatrans),show_guide = FALSE)+
  labs(title=paste0("Observed by predicted for each cohort"))
p
plast<-p

pathImageOut<-file.path(getwd(),"EMOSA_ggplot/ggplot_graphs/proportions from long by cohort")
pathFileOut<-file.path(pathImageOut,paste0("Observed proportions",".png"))
png(filename = pathFileOut,
    width =1600, height =300 , units = "px")
plot(plast)
dev.off()




# dsObs4model <- reshape2::melt(dsObs, id.vars=c("catatrans","cohort"))  ## id.vars declares MEASURED variables (as opposed to RESPONSE variable)
# dsObs4model$prevs<-paste0(dsObs4model$catatrans,dsObs4model$variable)
# 
# ?reshape
# 
# dsLongM$variable <- gsub(pattern="pt", replacement="", x=dsLongM$variable) #Strip off the 'att' prefix
# dsLongM$variable <- as.integer(dsLongM$variable) #Convert to a number.
# dsLongM <- plyr::rename(dsLongM, replace=c(variable="time", value="proportion"))
# dsLongM <- dsLong[order(dsLongM$catatrans, dsLongM$cohort), ] #Sort for the sake of visual inspection.

  