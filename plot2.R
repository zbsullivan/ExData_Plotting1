# Set working directory

setwd("~/School Related Documents/Coursera/datascience/Exploratory Data Analysis/Project 1")

# Read in, format, and subset data

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

data$datetime <- paste(as.character(data$Date), as.character(data$Time))

data$datetime <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")


data2 <- data[as.character(data$Date) == "1/2/2007" | data$Date == "2/2/2007",]

data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

png("plot2.png")

plot(data2$datetime, data2$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

dev.off()

