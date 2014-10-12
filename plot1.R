# Course Project 1
# Plot 1

# install.packages("sqldf")
library(sqldf)

datafilename <- 'household_power_consumption.txt'

# Filter to fetch data between 2007-02-01 and 2007-02-02
dateFilter <- "SELECT * from file WHERE Date IN ('1/2/2007','2/2/2007')"

rawData <- read.csv.sql(datafilename, header=TRUE, sep=";", sql = dateFilter)

hist(rawData$Global_active_power, xlab="Global Active Power (Kilowatts)", col="Red",
     main="Global Active Power")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
