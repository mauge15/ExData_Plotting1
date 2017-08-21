setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
data <- read.csv("household_power_consumption.txt",sep = ";",dec = ".",stringsAsFactors=FALSE,
                 colClasses = c('myDate','character','character','character','character','character','character','character','character'))
library(tidyr)
library(dplyr)

newData <- filter(data, Date=="2007-02-01" | Date=="2007-02-02")
newData$Global_active_power <- gsub("\\?","NA",newData$Global_active_power)
newData$Global_active_power <- as.numeric(newData$Global_active_power)

temp <- mutate(newData,datetime=paste(Date,Time))
temp$datetime <- as.POSIXct(strptime(temp$datetime,"%Y-%m-%d %H:%M:%S"))

png('plot4.png')
par(mfrow=c(2,2))
plot(temp$datetime,temp$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(temp$datetime,temp$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(temp$datetime,temp$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(temp$datetime,temp$Sub_metering_2,type="l",col="red")
lines(temp$datetime,temp$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"),cex=0.8)


plot(temp$datetime,temp$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")

dev.off()




