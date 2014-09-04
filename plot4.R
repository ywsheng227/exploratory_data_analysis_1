data <- read.table("./household_power_consumption.txt", sep = ";", dec = ".", header = TRUE, 
	col.names = c("Date","Time", "Global_active_power", "Global_reactive_power", 
	"Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
	"Sub_metering_3"), na.string = "?")

data_subset <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

data_subset$Date_Time <- as.POSIXct(strptime(paste(data_subset$Date, data_subset$Time, sep = " "), 
				"%d/%m/%Y %H:%M:%S"))

par(mfcol = c(2, 2), mar = c(4, 4, 4, 2))
plot(data_subset$Date_Time, data_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(data_subset$Date_Time, data_subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data_subset$Date_Time, data_subset$Sub_metering_2, type = "l", col = "red")
lines(data_subset$Date_Time, data_subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), cex = 0.7, legend = c("Sub_metering_1", 
	"Sub_metering_2", "Sub_metering_3"), bty = "n")
plot(data_subset$Date_Time, data_subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data_subset$Date_Time, data_subset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
