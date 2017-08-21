data <- read.csv("household_power_consumption.txt",sep = ";",dec = ".")
data$Date <- as.Date(data$Date,"%d/%m/%Y")

library(tidyr)
library(dplyr)

newData <- filter(data, Date=="2007-02-01" | Date=="2007-02-02")
