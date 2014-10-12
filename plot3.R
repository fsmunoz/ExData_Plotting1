## Coursera Exploratory Data Analysis - Course Project 1
## Author: Frederico Munoz <fsmunoz@gmail.com>
##
## Plot 1
##
## Instructions:
##
## * We will only be using data from the dates 2007-02-01 and
##   2007-02-02. One alternative is to read the data from just those
##   dates rather than reading in the entire dataset and subsetting to
##   those dates.
## * You may find it useful to convert the Date and Time variables to
##   Date/Time classes in R using the strptime?() and as.Date()
##   functions.
## * Note that in this dataset missing values are coded as ?.
##

## Read file, should be saved in the parente directory
epc <- read.csv("../household_power_consumption.txt", header = T, sep = ";")
## Date and time conversion
epc$Date <- as.Date(epc$Date, format="%d/%m/%Y")
epc$Time <- as.POSIXct(strptime(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S"))
## Subset data using the appropriate dates
epc2 <- subset(epc, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
## Convert from factor to numeric
epc2$Global_active_power <- as.numeric(as.character(epc2$Global_active_power))
epc2$Sub_metering_1 <- as.numeric(as.character(epc2$Sub_metering_1))
epc2$Sub_metering_2 <- as.numeric(as.character(epc2$Sub_metering_2))
epc2$Sub_metering_3 <- as.numeric(as.character(epc2$Sub_metering_3))

## Draw the plot to file
png(filename = "plot3.png")
plot(epc2$Sub_metering_1 ~ epc2$Time, type="l", xlab = "", ylab = "Energy sub metering")
lines(epc2$Sub_metering_2 ~ epc2$Time, col="red")
lines(epc2$Sub_metering_3 ~ epc2$Time, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = "solid")
dev.off()
