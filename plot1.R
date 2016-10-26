library(dplyr)
library(lubridate)
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                   na.strings = "?")
data$DateTime <- dmy_hms(paste(data$Date, data$Time))
dataExtract <- data[(data$DateTime >= ymd_hms("2007-02-01 00:00:00") & 
                             data$DateTime < ymd_hms("2007-02-03 00:00:00")), ]
png("plot1.png")
hist(as.numeric(dataExtract$Global_active_power), col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()