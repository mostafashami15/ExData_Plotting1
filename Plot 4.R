# plot4.R

# Load the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Convert Date and Time to DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Subset data for the dates 2007-02-01 and 2007-02-02
data_sub <- subset(data, as.Date(data$DateTime) >= as.Date("2007-02-01") & as.Date(data$DateTime) <= as.Date("2007-02-02"))

# Plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# Top-left plot
plot(data_sub$DateTime, data_sub$Global_active_power, type='l', xlab='', ylab='Global Active Power')

# Top-right plot
plot(data_sub$DateTime, data_sub$Voltage, type='l', xlab='datetime', ylab='Voltage')

# Bottom-left plot
plot(data_sub$DateTime, data_sub$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(data_sub$DateTime, data_sub$Sub_metering_2, col='red')
lines(data_sub$DateTime, data_sub$Sub_metering_3, col='blue')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

# Bottom-right plot
plot(data_sub$DateTime, data_sub$Global_reactive_power, type='l', xlab='datetime', ylab='Global Reactive Power')

dev.off()
