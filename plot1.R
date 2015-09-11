setwd("C:\\Users\\Olivia\\OneDrive\\Documents\\Coursera_ExploratoryDataAnalysis\\Project1")

# Load data only for the dates we're interested in

myData <- read.table(pipe("findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt"), sep=";", 
                     na.string="?", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))                                                                                                                     

# Create plot 1

plot1 <- hist(myData$Global_active_power, col="red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)") 
dev.copy(png, file = "plot1.png", height=480, width=480)
dev.off()