# Script reproduces Plot 2
# Data file should be in the same folder

# Read all data as characters
data <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character")
# Remove unnecessary columns
data <- data[, c(1, 2, 3)]
# Convert $Date column to Date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# Select only two days
data <- subset(data, Date %in% as.Date(c("2007-02-01", "2007-02-02")))
# Combine both Date and Time into one vector czas
czas <- as.POSIXlt(paste(data$Date, data$Time))
# Create new data.frame that consists of combined Data&Time together with GAP data
# Open png file
png("plot2.png", width=480, height=480, units="px")
# Make a plot
plot(czas, data$Global_active_power, type = "l", 
    xlab ="", ylab = "Global Active Power (kilowatts)")
# Close and save file
dev.off()
