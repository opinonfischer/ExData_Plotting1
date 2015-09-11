setwd("C:\\Users\\Olivia\\OneDrive\\Documents\\Coursera_ExploratoryDataAnalysis\\Project1")

# Load data only for the dates we're interested in

myData <- read.table(pipe("findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt"), sep=";", 
                     na.string="?", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))                                                                                                                     

# Create plot 4

x <- paste(myData$Date, myData$Time, sep= "")
x_format <- strptime(x, "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2, 2))
with(myData, {
    plot(x_format, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
    plot(x_format, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
    plot(x_format, myData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
    lines(x_format,myData$Sub_metering_2,col="red")
    lines(x_format,myData$Sub_metering_3,col="blue")
    legend("topright",lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(x_format, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
})
dev.copy(png, file = "plot4.png", height=480, width=480)
dev.off()
