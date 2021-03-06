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


png("plot2.png", width = 480, height = 480, res = 72)
plot(power$DateTime, power$Global_active_power, pch = NA, xlab ="", ylab = "Global Active Power (kilowatts)")
lines(power$DateTime, power$Global_active_power)
dev.off()
