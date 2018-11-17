#MAB2111 Computing for Analytics 1 
#Assignment No. 1
#Submitted by Michelle A. Farcon
#Date Submitted - November 7, 2018

#SETTING THE WORKING DIRECTORY.

# Method Used
# (Make sure the csv file and the .R file are in the same folder)
# Go to Session -> Set Working Directory -> To Source File Location.
# This changes the working directory to the one in which you open this file.

#1. WHO dataset
# Read WHO dataset 

WHO = read.csv("WHO.csv")

#d. country with the lowest literacy

LowestLiteracyMinID <- which.min(WHO$`LiteracyRate`)
WHO$Country[LowestLiteracyMinID]

#e. Richest country in Europe based on GNI

HighestGNIMaxID <- which.max(WHO$`GNI`)
WHO$Country[HighestGNIMaxID]

#f. Mean Life expectancy of countries in Africa
WHO.Africa <- subset(WHO, Region == "Africa")
mean(WHO.Africa$LifeExpectancy)

#g. Number of countries with population greater than 10,000
WHO.Population <- subset(WHO, Population > 10000)
nrow(WHO.Population)

#h. Top 5 countries in the Americas with the highest child mortality
WHO.Americas <- subset(WHO, Region == "Americas")
WHO.AmericasDF <- data.frame(WHO.Americas)
Desc <- WHO.AmericasDF[order(-ChildMortality), ]
Top5 <- data.frame(head(Desc$Country, n=5))
print(Top5)

#2. NBA dataset (Historical NBA Performance.xlsx)

library(readxl)
NBA <- read_excel("Historical NBA Performance.xlsx")
View(NBA)

#a. The year Bulls has the highest winning percentage 

NBA_Bulls <- subset(NBA, Team == "Bulls")
WinningPercentageMaxID <- which.max(NBA_Bulls$`Winning Percentage`)
NBA_Bulls$Year[WinningPercentageMaxID]

#b. Teams with an even win-loss record in a year

Even <- subset(NBA, `Winning Percentage` == 0.500)
WinLoss <- data.frame(Even$Team)

#3. Seasons_Stats.csv

SEASONS = read.csv("Seasons_Stats.csv")

#a. Player with the highest 3-pt attempt rate in a season. [Bonus]

#b. Player with the highest free throw rate in a season. [Bonus]

#c. What year/season does Lebron James scored the highest? 

LeBronJames <- subset(SEASONS, Player == "LeBron James")
LebronMaxID <- which.max(LeBronJames$`PTS`)
LeBronJames$Year[LebronMaxID]

#  d. What year/season does Michael Jordan scored the highest? 
MichaelJordan <- subset(SEASONS, Player == "Michael Jordan*")
JordanMaxID <- which.max(MichaelJordan$`PTS`)
MichaelJordan$Year[JordanMaxID]

#  e. Player efficiency rating of Kobe Bryant in the year where his MP is the lowest?

Kobe <- subset(SEASONS, Player == "Kobe Bryant")
KobeMinID <- which.min(Kobe$`MP`)
Kobe$PER[KobeMinID]  
  

#4. National Universities Rankings.csv

NUR = read.csv("National Universities Rankings.csv")  

#a. University with the most number of undergrads 
UNIMaxID <- which.max(NUR$`Undergrad.Enrollment`)
NUR$Name[UNIMaxID]

#  b. Average Tuition in the Top 10 University
  
TOP10 <- head(NUR, n=10)
mean(TOP10, Tuition.and.fees)

 
 
 