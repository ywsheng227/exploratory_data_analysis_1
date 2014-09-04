data <- read.table("./household_power_consumption.txt", sep = ";", dec = ".", header = TRUE, 
	col.names = c("Date","Time", "Global_active_power", "Global_reactive_power", 
	"Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
	"Sub_metering_3"), na.string = "?")

data_subset <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

hist(data_subset$Global_active_power, main = "Global Active Power", breaks = 12, col = "red", 
	ylim = c(0, 1200), xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
