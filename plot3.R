# Set working directory

setwd("~/School Related Documents/Coursera/datascience/Exploratory Data Analysis/Project 1")

# Read in, format, and subset data

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

data$datetime <- paste(as.character(data$Date), as.character(data$Time))

data$datetime <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")


data2 <- data[as.character(data$Date) == "1/2/2007" | data$Date == "2/2/2007",]

data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))

attach(data2)

png("plot3.png")

plot(datetime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
points(datetime, Sub_metering_2, type = "l", col="red")
points(datetime, Sub_metering_3, type = "l", col="blue")
legend("topright", 
       legend =c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty=1)

dev.off()

detach(data2)
