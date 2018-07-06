
#Read Data in, change date format and subset
household_power_consumption <- read.csv("household_power_consumption.txt",sep = ";")
household_power_consumption$Date <- as.Date(household_power_consumption$Date,'%d/%m/%Y')
PlotData <- subset(household_power_consumption, household_power_consumption$Date == "2007-02-01"|household_power_consumption$Date == "2007-02-02")

# Create DateTime Variable
PlotData$DateTime = paste(PlotData$Date, PlotData$Time)
PlotData$DateTime = strptime(PlotData$DateTime,format='%Y-%m-%d %H:%M:%S')

#Create png file
png("plot2.png", 480, 480)

# Create Plot
plot(PlotData$DateTime,as.numeric(as.character(PlotData$Global_active_power)), type="l", ylab = "Global Active Power(Kilowats)", xlab="")

dev.off()