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
                   "Everyday"
                   )
categories8<-    c("Never    ",
                   "1-2/year ",
                   "3-12/year",
                   "~1/month ",
                   "~2/month ",
                   "~1/week  ",
                   "2-3/week ",
                   "Everyday "
                   )
categories3<-c("Goers","Irregulars","Absentees")
categories38<-c("Absentees","Absentees","Irregulars","Irregulars","Irregulars","Goers","Goers","Goers")

# Graphs
pathImageOut<-file.path(getwd(),"03 writing and drawing",drawing)

#---platonic of the MovingWristBand drawing--------------------------------begin-----------#
drawing<-"MovingWristBand"  # name of drawing and folder in "03 writing and drawing" directory
cohortYear <- 1984
allCohorts<-c("1980","1981","1982","1983","1984" )
cohorts<-cohortYear # cohortYear or allCohorts - markes the drawing with cohort info
pathFileOut<-file.path(pathImageOut,paste0(slide,"_",cohortYear,".png"))
slide<-"slide00"
dsFORp <- subset(dsL_attend, cohort %in% allCohorts)
#------------------------------------------------------#

p<-ggplot(dsFORp, aes(x=factor(age), fill=factor(attendence)))+
  geom_bar(position="fill")+
  scale_fill_manual(values = attcol8,
                    labels=categories8long,
                    name="Category" )+
  scale_y_continuous("Prevalence: proportion of total",
                     limits=c(0, 1),
                     breaks=c(.1,.2,.3,.4,.5,.6,.7,.8,.9,1))+
  scale_x_discrete("Age in years",
                   limits=c("16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"))+
  labs(title=paste0("In the past year, how often have you attended a worship service?",
                    "   cohort:",cohorts))
p
#------------------------------------------------------#
png(filename = pathFileOut,
    width =800, height =450 , units = "px")
plot(p)
dev.off()
#---platonic of the MovingWristBand drawing---------------------------------end------------#













# 
# cattransPrev<-c("G","I","A")
# cattransTrans<-c("gg","gi","ga","ig","ii","ia","ag","ai","aa" )
# proportions<-c("cohort","cattrans","pt00","pt01","pt02","pt03","pt04","pt05","pt06","pt07","pt08")
# counts     <-c("cohort","cattrans","t00" , "t01", "t02", "t03", "t04", "t05", "t06", "t07", "t08")

 
# slide<-"01_"
# cohortYear <- 1984
# allCohorts<-c("1980","1981","1982","1983","1984" )
# cohorts<-cohortYear
# # cohorts<-c("all")
# #------------------------------------------------------#
# dsFORp <- subset(dsLong, cohort %in% cohortYear)
# p<-ggplot(dsFORp, aes(x=factor(age), fill=factor(attendence)))+
#   geom_bar(position="fill")+
#   scale_fill_manual(values = attcol8,
#                     labels=categories8long,
#                     name="Category" )+
#   scale_y_continuous("Prevalence: proportion of total",
#                      limits=c(0, 1),
#                      breaks=c(.1,.2,.3,.4,.5,.6,.7,.8,.9,1))+
#   scale_x_discrete("Age in years",
#                    limits=c("16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"))+
#   labs(title=paste0("In the past year, how often have you attended a worship service?","   cohort:",cohorts))
# p
# plast<-p
# pathImageOut<-file.path(getwd(),"EMOSA_ggplot/ggplot_graphs/prevalences")
# pathFileOut<-file.path(pathImageOut,paste0(slide,"_",cohortYear, ".png"))
# png(filename = pathFileOut,
#     width =800, height =450 , units = "px")
# plot(plast)
# dev.off()
# 
# slide<-"02"
# cohortYear <- 1984
# allCohorts<-c("1980","1981","1982","1983","1984" )
# cohorts<-cohortYear
# # cohorts<-c("all")
# #------------------------------------------------------#
# dsFORp <- subset(dsLong, cohort %in% cohortYear)
# p<-ggplot(dsFORp, aes(x=factor(age), fill=factor(attendence)))+
#   geom_bar(position="fill")+
#   scale_fill_manual(values = attcol8,
#                     labels=categories8,
#                     name="Category" )+
#   scale_y_continuous("Prevalence: proportion of total",
#                      limits=c(0, 1),
#                      breaks=c(.1,.2,.3,.4,.5,.6,.7,.8,.9,1))+
#   scale_x_discrete("Age in years",
#                    limits=c("16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"))+
#   labs(title=paste0("In the past year, how often have you attended a worship service?","   cohort:",cohorts))
# p
# plast<-p
# pathImageOut<-file.path(getwd(),"EMOSA_ggplot/ggplot_graphs/prevalences")
# pathFileOut<-file.path(pathImageOut,paste0(slide,"_",cohortYear, ".png"))
# png(filename = pathFileOut,
#     width =800, height =450 , units = "px")
# plot(plast)
# dev.off()
# #------------------------------------------------------#
# 
# slide<-"03"
# cohortYear <- 1984
# allCohorts<-c("1980","1981","1982","1983","1984" )
# cohorts<-cohortYear
# # cohorts<-c("all")
# #------------------------------------------------------#
# dsFORp <- subset(dsLong, cohort %in% cohortYear)
# p<-ggplot(dsFORp, aes(x=factor(age), fill=factor(attendence)))+
#   geom_bar(position="fill")+
#   scale_fill_manual(values = attcol8,
#                     labels=categories8,
#                     name="Category" )+
#   scale_y_continuous("Prevalence: proportion of total",
#                      limits=c(0, 1),
#                      breaks=c(.1,.2,.3,.4,.5,.6,.7,.8,.9,1))+
#   scale_x_discrete("Age in years",
#                    limits=c("16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"))+
#   labs(title=paste0("In the past year, how often have you attended a worship service?","   cohort:",cohorts))
# p
# plast<-p
# pathImageOut<-file.path(getwd(),"EMOSA_ggplot/ggplot_graphs/prevalences")
# pathFileOut<-file.path(pathImageOut,paste0(slide,"_",cohortYear, ".png"))
# png(filename = pathFileOut,
#     width =800, height =450 , units = "px")
# plot(plast)
# dev.off()
# #------------------------------------------------------#
# 
# slide<-"04"
# cohortYear <- 1983
# allCohorts<-c("1980","1981","1982","1983","1984" )
# cohorts<-cohortYear
# # cohorts<-c("all")
# #------------------------------------------------------#
# dsFORp <- subset(dsLong, cohort %in% cohortYear)
# p<-ggplot(dsFORp, aes(x=factor(age), fill=factor(attendence)))+
#   geom_bar(position="fill")+
#   scale_fill_manual(values = attcol8,
#                     labels=categories8,
#                     name="Category" )+
#   scale_y_continuous("Prevalence: proportion of total",
#                      limits=c(0, 1),
#                      breaks=c(.1,.2,.3,.4,.5,.6,.7,.8,.9,1))+
#   scale_x_discrete("Age in years",
#                    limits=c("16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"))+
#   labs(title=paste0("In the past year, how often have you attended a worship service?","   cohort:",cohorts))
# p
# plast<-p
# pathImageOut<-file.path(getwd(),"EMOSA_ggplot/ggplot_graphs/prevalences")
# pathFileOut<-file.path(pathImageOut,paste0(slide,"_",cohortYear, ".png"))
# png(filename = pathFileOut,
#     width =800, height =450 , units = "px")
# plot(plast)
# dev.off()
# #------------------------------------------------------#
# 
# slide<-"05"
# cohortYear <- 1982
# allCohorts<-c("1980","1981","1982","1983","1984" )
# cohorts<-cohortYear
# # cohorts<-c("all")
# #------------------------------------------------------#
# dsFORp <- subset(dsLong, cohort %in% cohortYear)
# p<-ggplot(dsFORp, aes(x=factor(age), fill=factor(attendence)))+
#   geom_bar(position="fill")+
#   scale_fill_manual(values = attcol8,
#                     labels=categories8,
#                     name="Category" )+
#   scale_y_continuous("Prevalence: proportion of total",
#                      limits=c(0, 1),
#                      breaks=c(.1,.2,.3,.4,.5,.6,.7,.8,.9,1))+
#   scale_x_discrete("Age in years",
#                    limits=c("16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"))+
#   labs(title=paste0("In the past year, how often have you attended a worship service?","   cohort:",cohorts))
# p
# plast<-p
# pathImageOut<-file.path(getwd(),"EMOSA_ggplot/ggplot_graphs/prevalences")
# pathFileOut<-file.path(pathImageOut,paste0(slide,"_",cohortYear, ".png"))
# png(filename = pathFileOut,
#     width =800, height =450 , units = "px")
# plot(plast)
# dev.off()
# #------------------------------------------------------#
# 
# slide<-"06"
# cohortYear <- 1981
# allCohorts<-c("1980","1981","1982","1983","1984" )
# cohorts<-cohortYear
# # cohorts<-c("all")
# #------------------------------------------------------#
# dsFORp <- subset(dsLong, cohort %in% cohortYear)
# p<-ggplot(dsFORp, aes(x=factor(age), fill=factor(attendence)))+
#   geom_bar(position="fill")+
#   scale_fill_manual(values = attcol8,
#                     labels=categories8,
#                     name="Category" )+
#   scale_y_continuous("Prevalence: proportion of total",
#                      limits=c(0, 1),
#                      breaks=c(.1,.2,.3,.4,.5,.6,.7,.8,.9,1))+
#   scale_x_discrete("Age in years",
#                    limits=c("16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"))+
#   labs(title=paste0("In the past year, how often have you attended a worship service?","   cohort:",cohorts))
# p
# plast<-p
# pathImageOut<-file.path(getwd(),"EMOSA_ggplot/ggplot_graphs/prevalences")
# pathFileOut<-file.path(pathImageOut,paste0(slide,"_",cohortYear, ".png"))
# png(filename = pathFileOut,
#     width =800, height =450 , units = "px")
# plot(plast)
# dev.off()
# #------------------------------------------------------#
# 
# slide<-"07"
# cohortYear <- 1980
# allCohorts<-c("1980","1981","1982","1983","1984" )
# cohorts<-cohortYear
# # cohorts<-c("all")
# #------------------------------------------------------#
# dsFORp <- subset(dsLong, cohort %in% cohortYear)
# p<-ggplot(dsFORp, aes(x=factor(age), fill=factor(attendence)))+
#   geom_bar(position="fill")+
#   scale_fill_manual(values = attcol8,
#                     labels=categories8,
#                     name="Category" )+
#   scale_y_continuous("Prevalence: proportion of total",
#                      limits=c(0, 1),
#                      breaks=c(.1,.2,.3,.4,.5,.6,.7,.8,.9,1))+
#   scale_x_discrete("Age in years",
#                    limits=c("16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"))+
#   labs(title=paste0("In the past year, how often have you attended a worship service?","   cohort:",cohorts))
# p
# plast<-p
# pathImageOut<-file.path(getwd(),"EMOSA_ggplot/ggplot_graphs/prevalences")
# pathFileOut<-file.path(pathImageOut,paste0(slide,"_",cohortYear, ".png"))
# png(filename = pathFileOut,
#     width =800, height =450 , units = "px")
# plot(plast)
# dev.off()
# #------------------------------------------------------#
# 
# slide<-"08"
# cohortYear <- 1980
# allCohorts<-c("1980","1981","1982","1983","1984" )
# cohorts<-cohortYear
# # cohorts<-c("all")
# #------------------------------------------------------#
# dsFORp <- subset(dsLong, cohort %in% cohortYear)
# p<-ggplot(dsFORp, aes(x=factor(age), fill=factor(attendence)))+
#   geom_bar(position="fill")+
#   scale_fill_manual(values = attcol3,
#                     labels=categories38,
#                     name="Category" )+
#   scale_y_continuous("Prevalence: proportion of total",
#                      limits=c(0, 1),
#                      breaks=c(.1,.2,.3,.4,.5,.6,.7,.8,.9,1))+
#   scale_x_discrete("Age in years",
#                    limits=c("16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"))+
#   labs(title=paste0("In the past year, how often have you attended a worship service?","   cohort:",cohorts))
# p
# plast<-p
# pathImageOut<-file.path(getwd(),"EMOSA_ggplot/ggplot_graphs/prevalences")
# pathFileOut<-file.path(pathImageOut,paste0(slide,"_",cohortYear, ".png"))
# png(filename = pathFileOut,
#     width =800, height =450 , units = "px")
# plot(plast)
# dev.off()
# #------------------------------------------------------#
# 
# 
# slide<-"09"
# cohortYear <- 1981
# allCohorts<-c("1980","1981","1982","1983","1984" )
# cohorts<-cohortYear
# # cohorts<-c("all")
# #------------------------------------------------------#
# dsFORp <- subset(dsLong, cohort %in% cohortYear)
# p<-ggplot(dsFORp, aes(x=factor(age), fill=factor(attendence)))+
#   geom_bar(position="fill")+
#   scale_fill_manual(values = attcol3,
#                     labels=categories38,
#                     name="Category" )+
#   scale_y_continuous("Prevalence: proportion of total",
#                      limits=c(0, 1),
#                      breaks=c(.1,.2,.3,.4,.5,.6,.7,.8,.9,1))+
#   scale_x_discrete("Age in years",
#                    limits=c("16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"))+
#   labs(title=paste0("In the past year, how often have you attended a worship service?","   cohort:",cohorts))
# p
# plast<-p
# pathImageOut<-file.path(getwd(),"EMOSA_ggplot/ggplot_graphs/prevalences")
# pathFileOut<-file.path(pathImageOut,paste0(slide,"_",cohortYear, ".png"))
# png(filename = pathFileOut,
#     width =800, height =450 , units = "px")
# plot(plast)
# dev.off()
# #------------------------------------------------------#
# 
# 
# slide<-"11"
# cohortYear <- 1983
# allCohorts<-c("1980","1981","1982","1983","1984" )
# cohorts<-cohortYear
# # cohorts<-c("all")
# #------------------------------------------------------#
# dsFORp <- subset(dsLong, cohort %in% cohortYear)
# p<-ggplot(dsFORp, aes(x=factor(age), fill=factor(attendence)))+
#   geom_bar(position="fill")+
#   scale_fill_manual(values = attcol3,
#                     labels=categories38,
#                     name="Category" )+
#   scale_y_continuous("Prevalence: proportion of total",
#                      limits=c(0, 1),
#                      breaks=c(.1,.2,.3,.4,.5,.6,.7,.8,.9,1))+
#   scale_x_discrete("Age in years",
#                    limits=c("16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"))+
#   labs(title=paste0("In the past year, how often have you attended a worship service?","   cohort:",cohorts))
# p
# plast<-p
# pathImageOut<-file.path(getwd(),"EMOSA_ggplot/ggplot_graphs/prevalences")
# pathFileOut<-file.path(pathImageOut,paste0(slide,"_",cohortYear, ".png"))
# png(filename = pathFileOut,
#     width =800, height =450 , units = "px")
# plot(plast)
# dev.off()
# #------------------------------------------------------#
# 
# 
# slide<-"12"
# cohortYear <- 1984
# allCohorts<-c("1980","1981","1982","1983","1984" )
# cohorts<-cohortYear
# # cohorts<-c("all")
# #------------------------------------------------------#
# dsFORp <- subset(dsLong, cohort %in% cohortYear)
# p<-ggplot(dsFORp, aes(x=factor(age), fill=factor(attendence)))+
#   geom_bar(position="fill")+
#   scale_fill_manual(values = attcol3,
#                     labels=categories38,
#                     name="Category" )+
#   scale_y_continuous("Prevalence: proportion of total",
#                      limits=c(0, 1),
#                      breaks=c(.1,.2,.3,.4,.5,.6,.7,.8,.9,1))+
#   scale_x_discrete("Age in years",
#                    limits=c("16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"))+
#   labs(title=paste0("In the past year, how often have you attended a worship service?","   cohort:",cohorts))
# p
# plast<-p
# pathImageOut<-file.path(getwd(),"EMOSA_ggplot/ggplot_graphs/prevalences")
# pathFileOut<-file.path(pathImageOut,paste0(slide,"_",cohortYear, ".png"))
# png(filename = pathFileOut,
#     width =800, height =450 , units = "px")
# plot(plast)
# dev.off()
# #------------------------------------------------------#
# 
# 
# slide<-"13"
# allCohorts<-c("1980","1981","1982","1983","1984" )
# cohorts<-c("all")
# #------------------------------------------------------#
# dsFORp <- subset(dsLong, cohort %in% allCohorts)
# p<-ggplot(dsFORp, aes(x=factor(age), fill=factor(attendence)))+
#   geom_bar(position="fill")+
#   scale_fill_manual(values = attcol3,
#                     labels=categories38,
#                     name="Category" )+
#   scale_y_continuous("Prevalence: proportion of total",
#                      limits=c(0, 1),
#                      breaks=c(.1,.2,.3,.4,.5,.6,.7,.8,.9,1))+
#   scale_x_discrete("Age in years",
#                    limits=c("16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"))+
#   labs(title=paste0("In the past year, how often have you attended a worship service?","   cohort:",cohorts))
# p
# plast<-p
# pathImageOut<-file.path(getwd(),"EMOSA_ggplot/ggplot_graphs/prevalences")
# pathFileOut<-file.path(pathImageOut,paste0(slide,"_",cohortYear, ".png"))
# png(filename = pathFileOut,
#     width =800, height =450 , units = "px")
# plot(plast)
# dev.off()
# #------------------------------------------------------#
# 
# 
# slide<-"14"
# allCohorts<-c("1980","1981","1982","1983","1984" )
# cohorts<-c("all")
# #------------------------------------------------------#
# dsFORp <- subset(dsLong, cohort %in% allCohorts)
# p<-ggplot(dsFORp, aes(x=factor(age), fill=factor(attendence)))+
#   geom_bar(position="fill")+
#   scale_fill_manual(values = attcol8,
#                     labels=categories38,
#                     name="Category" )+
#   scale_y_continuous("Prevalence: proportion of total",
#                      limits=c(0, 1),
#                      breaks=c(.1,.2,.3,.4,.5,.6,.7,.8,.9,1))+
#   scale_x_discrete("Age in years",
#                    limits=c("16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"))+
#   labs(title=paste0("In the past year, how often have you attended a worship service?","   cohort:",cohorts))
# p
# plast<-p
# pathImageOut<-file.path(getwd(),"EMOSA_ggplot/ggplot_graphs/prevalences")
# pathFileOut<-file.path(pathImageOut,paste0(slide,"_",cohortYear, ".png"))
# png(filename = pathFileOut,
#     width =800, height =450 , units = "px")
# plot(plast)
# dev.off()
# #------------------------------------------------------#
# 
# 
# slide<-"15"
# allCohorts<-c("1980","1981","1982","1983","1984" )
# cohorts<-c("all")
# #------------------------------------------------------#
# dsFORp <- subset(dsLong, cohort %in% allCohorts)
# p<-ggplot(dsFORp, aes(x=factor(age), fill=factor(attendence)))+
#   geom_bar(position="fill")+
#   scale_fill_manual(values = attcol8,
#                     labels=categories8,
#                     name="Category" )+
#   scale_y_continuous("Prevalence: proportion of total",
#                      limits=c(0, 1),
#                      breaks=c(.1,.2,.3,.4,.5,.6,.7,.8,.9,1))+
#   scale_x_discrete("Age in years",
#                    limits=c("16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"))+
#   labs(title=paste0("In the past year, how often have you attended a worship service?","   cohort:",cohorts))
# p
# plast<-p
# pathImageOut<-file.path(getwd(),"EMOSA_ggplot/ggplot_graphs/prevalences")
# pathFileOut<-file.path(pathImageOut,paste0(slide,"_",cohortYear, ".png"))
# png(filename = pathFileOut,
#     width =800, height =450 , units = "px")
# plot(plast)
# dev.off()
# #------------------------------------------------------#





