library(dplyr)
library(lubridate)
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                   na.strings = "?")
data$DateTime <- dmy_hms(paste(data$Date, data$Time))
dataExtract <- data[(data$DateTime >= ymd_hms("2007-02-01 00:00:00") & 
                             data$DateTime < ymd_hms("2007-02-03 00:00:00")), ]

png("plot3.png")
plot(dataExtract$DateTime, dataExtract$Sub_metering_1, type = "l", 
     xlab = "", ylab = "")
lines(dataExtract$DateTime, dataExtract$Sub_metering_2, col = "red")
lines(dataExtract$DateTime, dataExtract$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1,1), pt.cex = 1, cex = 1.3)
dev.off()