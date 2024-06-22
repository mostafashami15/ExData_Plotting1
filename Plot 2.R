# plot2.R

# Load the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert Date and Time to DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Subset data for the dates 2007-02-01 and 2007-02-02
data_sub <- subset(data, as.Date(data$DateTime) >= as.Date("2007-02-01") & as.Date(data$DateTime) <= as.Date("2007-02-02"))

# Plot 2
png("plot2.png", width=480, height=480)
plot(data_sub$DateTime, data_sub$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
dev.off()

