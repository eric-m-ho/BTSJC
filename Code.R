library(data.table)
library(dplyr)
library(ggplot2)
library(tidyr)

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

#stacked bar graph
p=ggplot(data = BTdata, aes(x = Student, y = Algebra)) + 
  geom_bar()

#correlation matrix
keeps <- c("Algebra", "Functions", "Geometry", "Numbers.Operations", "Statistics.Probability")
cordata <- subset(BTdata, select = keeps)
cor(cordata)

#subsection stacked bargraph
keeps2 <- c("Student", "Algebra", "Functions", "Geometry", "Numbers.Operations", "Statistics.Probability")
widedat <- subset(BTdata, select = keeps2)

#convert to long data form
longdat <- gather(widedat, Subsections, Score, Algebra:Statistics.Probability)
View(longdat)

cbPalette <- c('#ff6d6d','#8dff35','#ff9b35','#003fff',"#eee40d")
p=ggplot(data = longdat, aes(x = Student, y = Score, fill = Subsections)) + 
  geom_bar(stat="identity")+labs(x='Students', y = 'Scores', fill = 'Subsection') + ggtitle("Subsection Scores")+ scale_fill_manual(values=cbPalette)
p
