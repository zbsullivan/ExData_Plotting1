# Read in, format, and subset data

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

data$datetime <- paste(as.character(data$Date), as.character(data$Time))

data$datetime <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")


data2 <- data[as.character(data$Date) == "1/2/2007" | data$Date == "2/2/2007",]


data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

data2$Voltage <- as.numeric(as.character(data2$Voltage))

data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))

data2$Global_reactive_power <- as.numeric(as.character(data2$Global_reactive_power))

attach(data2)

png("plot4.png")

# Set Grid

par(mfrow = c(2,2))

# Plot a

plot(data2$datetime, data2$Global_active_power, type = "l", 
     ylab = "Global Active Power",
     xlab = "")

# Plot b

plot(datetime, Voltage, type="l")

# Plot c

plot(datetime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
points(datetime, Sub_metering_2, type = "l", col="red")
points(datetime, Sub_metering_3, type = "l", col="blue")
legend("topright", 
       legend =c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty=1,
       bty = "n")

# Plot d

plot(datetime, Global_reactive_power, type="l")

dev.off()

detach(data2)
