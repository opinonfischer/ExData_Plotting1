setwd("C:\\Users\\Olivia\\OneDrive\\Documents\\Coursera_ExploratoryDataAnalysis\\Project1")

# Load data only for the dates we're interested in

myData <- read.table(pipe("findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt"), sep=";", 
                     na.string="?", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))                                                                                                                     

# Create plot 3

x <- paste(myData$Date, myData$Time, sep= "")
x_format <- strptime(x, "%d/%m/%Y %H:%M:%S")
plot3 <- plot(x_format, myData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(x_format,myData$Sub_metering_2,col="red")
lines(x_format,myData$Sub_metering_3,col="blue")
legend("topright",lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", height=480, width=480)
dev.off()