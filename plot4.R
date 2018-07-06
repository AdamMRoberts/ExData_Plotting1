#Read Data in, change date format and subset
household_power_consumption <- read.csv("household_power_consumption.txt",sep = ";")
household_power_consumption$Date <- as.Date(household_power_consumption$Date,'%d/%m/%Y')
PlotData <- subset(household_power_consumption, household_power_consumption$Date == "2007-02-01"|household_power_consumption$Date == "2007-02-02")

# Create DateTime Variable
PlotData$DateTime = paste(PlotData$Date, PlotData$Time)
PlotData$DateTime = strptime(PlotData$DateTime,format='%Y-%m-%d %H:%M:%S')

#Create png file
png("plot4.png", 480, 480)

#Set Par Mfrow
par(mfrow = c(2,2), cex = 0.5)

# Create Plot #1``
plot(PlotData$DateTime,as.numeric(as.character(PlotData$Global_active_power)), type="l", ylab = "Global Active Power(Kilowats)", xlab="")
# Create Plot #2
plot(PlotData$DateTime,as.numeric(as.character(PlotData$Voltage)), type="l", ylab = "Voltage", xlab="datetime")

# Create Plot #3
plot(PlotData$DateTime,as.numeric(as.character(PlotData$Sub_metering_1)), type="l", ylab = "Energy Sub Metering", xlab="", ylim=c(0, 40))
lines(PlotData$DateTime,as.numeric(as.character(PlotData$Sub_metering_2)), type ="l", col = "red")
lines(PlotData$DateTime,as.numeric(as.character(PlotData$Sub_metering_3)), type ="l", col = "blue")
legend("topright", lty = 1, bty = "n", col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# Create Plot #4
plot(PlotData$DateTime,as.numeric(as.character(PlotData$Global_reactive_power)), type="l", ylab = "Voltage", xlab="datetime")

dev.off()