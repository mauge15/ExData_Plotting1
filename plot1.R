
setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
data <- read.csv("household_power_consumption.txt",sep = ";",dec = ".",stringsAsFactors=FALSE,
                 colClasses = c('myDate','character','character','character','character','character','character','character','character'))
library(tidyr)
library(dplyr)

newData <- filter(data, Date=="2007-02-01" | Date=="2007-02-02")
newData$Global_active_power <- gsub("\\?","NA",newData$Global_active_power)
newData$Global_active_power <- as.numeric(newData$Global_active_power)
png('plot1.png')
hist(newData$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col = "red")
dev.off()



