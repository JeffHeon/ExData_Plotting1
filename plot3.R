# Course Project 1
# Plot 3

# install.packages("sqldf")
library(sqldf)

datafilename <- 'household_power_consumption.txt'

# Filter to fetch data between 2007-02-01 and 2007-02-02
dateFilter <- "SELECT * from file WHERE Date IN ('1/2/2007','2/2/2007')"

rawData <- read.csv.sql(datafilename, header=TRUE, sep=";", sql = dateFilter)
rawData$DateTime = strptime(paste(rawData$Date, rawData$Time), format="%d/%m/%Y %H:%M:%S")

# open png device
png(file = "plot3.png", width = 480, height = 480)

# Prepare, but do not add points yet
ylab <- "Energy sub metering"
plot(rawData$DateTime, rawData$Sub_metering_1, type="n", xlab=NA, ylab=ylab)

# Put different variable in different colors
with(rawData, points(DateTime, Sub_metering_1, col = "black", type="l"))
with(rawData, points(DateTime, Sub_metering_2, col = "red", type="l"))
with(rawData, points(DateTime, Sub_metering_3, col = "blue", type="l"))

# Finishing touch
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Let's not forget to close
dev.off()
