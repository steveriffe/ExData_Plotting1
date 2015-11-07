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




png("plot3.png", width = 480, height = 480, res = 72)
plot(power$DateTime, power$Sub_metering_1, pch = NA, xlab="", ylab = "Energy sub metering")
lines(power$DateTime, power$Sub_metering_1, col = "black")
lines(power$DateTime, power$Sub_metering_2, col = "red")
lines(power$DateTime, power$Sub_metering_3, col = "blue")
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))
dev.off()
