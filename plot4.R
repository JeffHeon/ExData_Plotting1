# Course Project 1
# Plot 4

# install.packages("sqldf")
library(sqldf)

datafilename <- 'household_power_consumption.txt'

# Filter to fetch data between 2007-02-01 and 2007-02-02
dateFilter <- "SELECT * from file WHERE Date IN ('1/2/2007','2/2/2007')"

rawData <- read.csv.sql(datafilename, header=TRUE, sep=";", sql = dateFilter)
rawData$DateTime = strptime(paste(rawData$Date, rawData$Time), format="%d/%m/%Y %H:%M:%S")

# open png device
png(file = "plot4.png", width = 480, height = 480)

# Multiple plots
par(mfcol = c(2, 2))

## Plot A
ylab <- "Global Active Power"
plot(rawData$DateTime, rawData$Global_active_power, type="l", xlab=NA, ylab=ylab)

## Plot B

# Prepare, but do not add points yet
ylab <- "Energy sub metering"
plot(rawData$DateTime, rawData$Sub_metering_1, type="n", xlab=NA, ylab=ylab)

# Put different variable in different colors
with(rawData, points(DateTime, Sub_metering_1, col = "black", type="l"))
with(rawData, points(DateTime, Sub_metering_2, col = "red", type="l"))
with(rawData, points(DateTime, Sub_metering_3, col = "blue", type="l"))

# Finishing touch
legend("topright", bty="n", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Plot C
xlab <- "datetime"
ylab <- "Voltage"
plot(rawData$DateTime, rawData$Voltage, type="l", xlab=xlab, ylab=ylab)

## Plot D
xlab <- "datetime"
ylab <- "Global_reactive_power"
plot(rawData$DateTime, rawData$Global_reactive_power, type="l", xlab=xlab, ylab=ylab)

# Let's not forget to close
dev.off()
