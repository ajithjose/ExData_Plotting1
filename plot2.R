powerConsumptionData <- read.table("data/household_power_consumption.txt",sep=";",header=TRUE, na.strings=c("?"),
                                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
filteredData <- powerConsumptionData[powerConsumptionData$Date == "1/2/2007" | powerConsumptionData$Date == "2/2/2007",]

filteredData$Date <- strptime(paste(filteredData$Date,filteredData$Time), "%d/%m/%Y %H:%M:%S")

par(mfcol= c(1, 1), ps = 12, cex = 1, cex.main = 1)
plot(filteredData$Date, filteredData$Global_active_power, type = "l", col = "black", xlab="",ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px") 
dev.off()