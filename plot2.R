# Course Project 1
# Plot 2

# install.packages("sqldf")
library(sqldf)

datafilename <- 'household_power_consumption.txt'

# Filter to fetch data between 2007-02-01 and 2007-02-02
dateFilter <- "SELECT * from file WHERE Date IN ('1/2/2007','2/2/2007')"

# Does not accept as.is=TRUE, na.strings="?"
rawData <- read.csv.sql(datafilename, header=TRUE, sep=";", sql = dateFilter)
rawData$DateTime = strptime(paste(rawData$Date, rawData$Time), format="%d/%m/%Y %H:%M:%S")

ylab <- "Global Active Power (Kilowatts)"
plot(rawData$DateTime, rawData$Global_active_power, type="l", xlab=NA, ylab=ylab)

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()


