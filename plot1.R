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
## Draw the plot to file
png(filename = "plot1.png")
hist(epc2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (killowats)")
dev.off()

## Save the subsetted data to a file, useful to reduce successive subsetting operations during debugging
## write.table(epc2, file = "epc2.txt", sep = ",")
