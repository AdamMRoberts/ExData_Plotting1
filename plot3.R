
#Read Data in, change date format and subset
household_power_consumption <- read.csv("household_power_consumption.txt",sep = ";")
household_power_consumption$Date <- as.Date(household_power_consumption$Date,'%d/%m/%Y')
PlotData <- subset(household_power_consumption, household_power_consumption$Date == "2007-02-01"|household_power_consumption$Date == "2007-02-02")

# Create DateTime Variable
PlotData$DateTime = paste(PlotData$Date, PlotData$Time)
PlotData$DateTime = strptime(PlotData$DateTime,format='%Y-%m-%d %H:%M:%S')

#Create png file
png("plot3.png", 480, 480)

#Change overall font
par(cex.lab = 1,  cex=0.75)
# Create Plot
plot(PlotData$DateTime,as.numeric(as.character(PlotData$Sub_metering_1)), type="l", ylab = "Energy Sub Metering", xlab="", ylim=c(0, 40))
lines(PlotData$DateTime,as.numeric(as.character(PlotData$Sub_metering_2)), type ="l", col = "red")
lines(PlotData$DateTime,as.numeric(as.character(PlotData$Sub_metering_3)), type ="l", col = "blue")

#Legend with colour
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.off()