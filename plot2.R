##plot_2
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
#define plotting device as PNG
png("plot2.png", width=480, height=480)
# plot histogram and define its properties(argumans)#
### scatter Plot datetime Vs. globalActivePower###
plot(datetime, globalActivePower, type ="l",xlab = "", ylab="Global Active Power (kilowatts)")
#close png device
dev.off()
# open plot2.png from working directory
#END