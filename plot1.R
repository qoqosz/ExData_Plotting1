# Script reproduces Plot 1
# Data file should be in the same folder

# Get data for histogram

# Read all data as characters
data <- read.csv("household_power_consumption.txt", sep=";", colClasses = "character")
# Remove unnecessary columns
data <- data[, c(1, 3)]
# Convert columns to proper types
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# Remove '?' by NA
data <- within(data, Global_active_power <- ifelse(Global_active_power == '?', NA, Global_active_power))
data$Global_active_power <- as.numeric(data$Global_active_power)
# Select only two days
data <- subset(data, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

# Open png file
png("plot1.png", width=480, height=480, units="px")
# Plot histogram
hist(data$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
# Close and save file
dev.off()