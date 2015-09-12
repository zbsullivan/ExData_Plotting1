# Set working directory

setwd("~/School Related Documents/Coursera/datascience/Exploratory Data Analysis/Project 1")

# Read in, format, and subset data

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

data$Date <- as.Date(as.character(data$Date), format = "%d/%m/%Y")

data2 <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

png("plot1.png")

hist(data2$Global_active_power, col="red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()



