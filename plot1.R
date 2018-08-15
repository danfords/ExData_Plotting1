data <- read.table("data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$Date = lapply(data$Date, function(x) as.Date(as.character(x),"%d/%m/%Y"))

png(filename='plot1.png',width=480,height=480,units='px')
hist(data$Global_active_power, col = 'red', xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
