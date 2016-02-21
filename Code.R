library(data.table)
library(dplyr)
library(ggplot2)

setwd("C:/Users/Eric/Desktop/BTSJC")

BTdata<-fread("BTSJCData.csv")

View(BTdata)

#Time vs. MathChange
ggplot(data = BTdata, aes(x = Time, y = MathChange))+
  geom_point(shape=3) +
  geom_smooth(method=lm)+labs(x='Time (minutes)',y='Change in Math Scores') + 
  ggtitle("Time vs. Change in Math Scores")

#Time vs. Percentile
ggplot(data = BTdata, aes(x = Time, y = PercentileRank))+
  geom_point(shape=3) +
  geom_smooth(method=lm)+labs(x='Time (minutes)',y='PercentileRank') + 
  ggtitle("Time vs. PercentileRank")

#read in data with reading data
BTdata2<-fread("BTSJCDataRead.csv")

View(BTdata2)

ggplot(data = BTdata2, aes(x = MathChange, y = ReadingChange))+
  geom_point(shape=3) +
  geom_smooth(method=lm)+labs(x='Change in Math Scores',y='Change in Reading Scores') + 
  ggtitle("Change in Math Scores vs. Change in Reading Scores")
