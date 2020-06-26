##plpt1
#downlod data manually and save it into working directory
#url sourse: "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# unzip file
#setworking directory
setwd("D:/coursera/exploratory_data_analysis/project 1")
#Reads in data from local directory files
powerdata <- read.table("household_power_consumption.txt", header=TRUE,
                        sep=";", stringsAsFactors=FALSE,na.strings = "?")
#subsets data for specified dates
subsetData <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]
# cheking data stracture
str(subsetData)
# converting data format to appropriate format
#Change Date Column to Date Type
globalActivePower <- as.numeric(subsetData$Global_active_power)
#define plotting device as PNG
png("plot1.png", width=480, height=480)
# plot histogram and define its properties(argumans)#
### Plot1###
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#close png device
dev.off()
# open plot1.png from working directory
#END