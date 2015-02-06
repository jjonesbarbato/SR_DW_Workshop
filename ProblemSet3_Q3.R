
#Using the female self employment data set from gapminder
filename<-"f_self_employed.csv"
self_emp<-read.csv(filename, header=TRUE)
self_emp

library(dplyr)
library(tidyr)

#Transpose the data into columns for country, year and percent self-employed
transposed<-gather(self_emp, "year", "Pct_Self_Emp",2:29)
#Rename first column to be more in line with data set 
names(transposed)<-c("Country", "year", "Pct_Self_Emp")

#Run simple summary statistics 
nrow(transposed)
summary(transposed)
#Find the percent of the total number of records where the percent self employed is NA 
#and then subset out of the data set 
#First count the number of rows that have an NA values for the percent self employed
count_NA<-sum(is.na(transposed$Pct_Self_Emp))
#Divide this by the total number of rows to get the % of the dataset without values
pct_NA<-count_NA/nrow(transposed) 
pct_NA
#Create a subset of the data removing the NA values
transp_subset<-subset(transposed, !is.na(Pct_Self_Emp))
#Now review the summary statistics to get a better sense of the data 
summary(transp_subset)
nrow(transp_subset)
library(ggplot2)
#Create a plot  with histograms for each country
qplot(x = Country, y = Pct_Self_Emp, data=subset(transp_subset), geom='boxplot') + coord_cartesian(ylim=c(0,100))
#The output is overwhelming 
ggsave('AllCountries.png')

#Focus the discovery on Ethiopia, France, COlombia, United States
qplot(x = Country, y = Pct_Self_Emp, data=filter(transp_subset, Country%in%c("Ethiopia", "United States", "France", "Colombia"))
      , geom='boxplot') + coord_cartesian(ylim=c(0,50))
ggsave('CountrySet.png')
