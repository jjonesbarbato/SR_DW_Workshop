# How many people share your birthday? Do you know them?
# (Reserve time with them or save money to buy them a gift!)
#Since my birthday is July 6 I need to find those friends with the same month and day value
setwd("C:\\Users\\jeniferjones\\SkyDrive\\SlideRule_DS_Workship\\EDA")
filename<-"birthdaysExample.csv"
bday_file<-read.csv(filename, header=TRUE)
summary(bday_file)
nrow(bday_file)

#Finding the rows with the 7/6 birtdays
same_bday<-subset(bday_file, substr(bday_file$dates, 1,3)=="7/6")
nrow(same_bday)
#Results show 4 people with same birthday

# Which month contains the most number of birthdays?
#First need to revise the file so that the items are dates and not factors
library(lubridate)
bday_file$dates<-mdy(bday_file$dates)
# How many birthdays are in each month?
#Add a column to the dataset with the month extracted and simple histogram
bday_file$month<-month(bday_file$dates)
qplot(x=month, data = bday_file)+   scale_x_discrete(breaks=1:12)
ggsave("birthday_hist1.png")
#Can also create a summary table wihich shows the same results numerically
table(bday_file$month)

# Which day of the year has the most number of birthdays?
#Create a month/day only column
bday_file$md<-format(bday_file$dates, "%m-%d")
qplot(x=md, data = bday_file)+   scale_x_discrete(breaks=1:365)


# Do you have at least 365 friends that have birthdays on everyday
# of the year?