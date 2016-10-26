library(dplyr)
library(lubridate)
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                   na.strings = "?")
data$DateTime <- dmy_hms(paste(data$Date, data$Time))
dataExtract <- data[(data$DateTime >= ymd_hms("2007-02-01 00:00:00") & 
                             data$DateTime < ymd_hms("2007-02-03 00:00:00")), ]

#plot 4 = plot 2 + voltage plot + plot 3 + Global reactive power plot
png("plot4.png")
par(mfrow = c(2,2))
#plot 2
plot(dataExtract$DateTime, dataExtract$Global_active_power, type = "l", 
     xlab = "", ylab = "Global_active_power")
#voltage plot
plot(dataExtract$DateTime, dataExtract$Voltage,
     type = "l", xlab = "datetime", ylab = "Voltage")
#plot 3
plot(dataExtract$DateTime, dataExtract$Sub_metering_1, type = "l", 
     xlab = "", ylab = "")
lines(dataExtract$DateTime, dataExtract$Sub_metering_2, col = "red")
lines(dataExtract$DateTime, dataExtract$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1,1), cex = 0.7,
       bty = "n")
#Global reactive power plot
plot(dataExtract$DateTime,dataExtract$Global_reactive_power, 
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
