powerConsumptionData <- read.table("data/household_power_consumption.txt",sep=";",header=TRUE, na.strings=c("?"),
                                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
filteredData <- powerConsumptionData[powerConsumptionData$Date == "1/2/2007" | powerConsumptionData$Date == "2/2/2007",]

filteredData$Date <- strptime(paste(filteredData$Date,filteredData$Time), "%d/%m/%Y %H:%M:%S")

par(mfcol= c(2, 2), ps = 10, cex = 1, cex.main = 1)
plot(filteredData$Date, filteredData$Global_active_power, type = "l", col = "black", xlab="",ylab = "Global Active Power")
with(filteredData, plot(Date, Sub_metering_1,  xlab="", ylab = "Energy sub metering", type="n"))
with(filteredData, lines(Date, Sub_metering_1, col="black"))
with(filteredData, lines(Date, Sub_metering_2, col="red"))
with(filteredData, lines(Date, Sub_metering_3, col="blue"))
legend("topright", col = c("black","red","blue"), bty="n", text.width=100000, lty=1, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(filteredData$Date, filteredData$Voltage, type = "l", col = "black", xlab="datetime",ylab = "Voltage")
plot(filteredData$Date, filteredData$Global_reactive_power, type = "l", col = "black", xlab="datetime",ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px") 
dev.off()