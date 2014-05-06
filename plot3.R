# Script reproduces Plot 3
# Data file should be in the same folder

# Get data for histogram

# Read all data as characters
data <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character")
# Remove unnecessary columns
data <- data[, c(1, 2, 7, 8, 9)]
# Convert $Date column to Date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# Select only two days
data <- subset(data, Date %in% as.Date(c("2007-02-01", "2007-02-02")))
# Combine both Date and Time into one vector czas
czas <- as.POSIXlt(paste(data$Date, data$Time))
# Open png file
png("plot3.png", width=480, height=480, units="px")
# Make a plot with legend
plot(czas, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(czas, data$Sub_metering_2, col="red")
lines(czas, data$Sub_metering_3, col="blue")
legend(x = "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
# Close and save file
dev.off()