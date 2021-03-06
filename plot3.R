data <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
dateTime <- setNames(dateTime, "DateTime")
data <- cbind(dateTime, data)
data$dateTime <- as.POSIXct(dateTime)

png(filename='plot3.png',width=480,height=480,units='px')
plot(data$Sub_metering_1~data$dateTime, type = 'l', xlab = "", ylab = "Energy sub metering")
lines(data$Sub_metering_2~data$dateTime, col = 'red')
lines(data$Sub_metering_3~data$dateTime, col = 'blue')
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=c(1,1,1))
dev.off()
