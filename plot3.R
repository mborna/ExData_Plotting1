##plot_3
#setup working directory
## NOTE! this Directory is diffrent for any users!
#  Working Directory depend on your file location on your computer
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
#Change Date Column to Date Type
globalActivePower <- as.numeric(subsetData$Global_active_power)
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)

#define plotting device as PNG
png("plot3.png", width=480, height=480)
## plot requested plot

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2, col=c("black", "red", "blue"))
#close png device
dev.off()
# open plot3.png from working directory
#END