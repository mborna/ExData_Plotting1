##plot_4
#setup working directory
# I save my working files in this path in my computer: "D:/coursera/exploratory_data_analysis"
setwd("D:/coursera/exploratory_data_analysis/project 1")
#Reads in data from local directory files
powerdata <- read.table("household_power_consumption.txt", header=TRUE,
                        sep=";", stringsAsFactors=FALSE,na.strings = "?")
#subsets data for specified dates

subsetData <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]
# cheking data stracture
str(subsetData)
# converting data format to appropriate format
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetData$Global_active_power)
globalReactivePower <- as.numeric(subsetData$Global_reactive_power)
voltage <- as.numeric(subsetData$Voltage)
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)

#define plotting device as PNG
png("plot4.png", width=480, height=480)
## define plot arrangement
par(mfrow = c(2, 2)) 
# plot four plots
#plot1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#plot2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
#plot3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#plot4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
# close PNG device
dev.off()
# open plot4.png from working directory
#END