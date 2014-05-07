# Script reproduces Plot 4
# Data file should be in the same folder

# Read all data as characters
data <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character")
# Convert $Date column to Date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# Select only two days
data <- subset(data, Date %in% as.Date(c("2007-02-01", "2007-02-02")))
# Combine both Date and Time into one vector czas
czas <- as.POSIXlt(paste(data$Date, data$Time))
# Create new data.frame that consists of combined Data&Time together with GAP data
# Open png file
png("plot4.png", width=480, height=480, units="px")
# 4 plots on one canvas
par(mfrow = c(2, 2))
# 1st plot
plot(czas, data$Global_active_power, type = "l", 
    xlab ="", ylab = "Global Active Power (kilowatts)")
# 2nd plot
plot(czas, data$Voltage, type = "l", 
    xlab ="datetime", ylab = "Voltage")
# 3rd plot
plot(czas, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(czas, data$Sub_metering_2, col="red")
lines(czas, data$Sub_metering_3, col="blue")
legend(x = "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, bty="n")
# 4th plot
plot(czas, data$Global_reactive_power, type = "l", 
    xlab ="datetime", ylab = "Global_reactive_power")
# Close and save file
dev.off()