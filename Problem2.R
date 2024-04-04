path<-"/Users/harrytjaden/Desktop/" # path allows the space where the file of interest is to be pulled up
db<-readRDS(file.path(path,'bloodPressure.RDS'))

library(dplyr)
library(tidyr)
library(lubridate)
names(db)
X<-db %>%
  pivot_longer(cols= -person, names_to = "dateMeasurement", values_to = 'value' )%>%
  separate(dateMeasurement,c('measurement','date'),sep = " ", remove = FALSE)%>%
  select(person,date,measurement,value)
#reshaped data frame

X$date<-as.Date(X$date,format = '%Y-%b-%d')
#changing dates to right format

Y<-aggregate(value~measurement+weekdays(X$date),data = X, FUN = mean)
#mean values for each day fo week for each measuremment

