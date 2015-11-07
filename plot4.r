# read in the original data and set up data frame:
power <- read.table('household_power_consumption.txt', sep=';', header=T, 
                    colClasses = c('character', 'character', 'numeric',
                                   'numeric', 'numeric', 'numeric',
                                   'numeric', 'numeric', 'numeric'),
                    na.strings='?')


## use strptime for date/time formatting
power$DateTime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

## strip out unnecessary dates from the data:
power <- subset(power, as.Date(DateTime) >= as.Date("2007-02-01") & 
                  as.Date(DateTime) <= as.Date("2007-02-02"))


#plot4

png("plot4.png", width = 480, height = 480, res = 72)

par(mfrow=c(2,2))


#1st: plot2, again
plot(power$DateTime, power$Global_active_power, pch = NA, xlab ="", ylab = "Global Active Power (kilowatts)")
lines(power$DateTime, power$Global_active_power)

#2nd: Voltage
plot(power$DateTime, power$Voltage, pch=NA, xlab="datetime", ylab="Voltage")
lines(power$DateTime, power$Voltage)

#3rd: plot 3, again
plot(power$DateTime, power$Sub_metering_1, pch = NA, xlab="", ylab = "Energy sub metering")
lines(power$DateTime, power$Sub_metering_1, col = "black")
lines(power$DateTime, power$Sub_metering_2, col = "red")
lines(power$DateTime, power$Sub_metering_3, col = "blue")
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))

# 4th: Global Reactive Power
plot(power$DateTime, power$Global_reactive_power, pch=NA, xlab='datetime', ylab ='Global_reactive_power')
lines(power$DateTime, power$Global_reactive_power)

dev.off()
