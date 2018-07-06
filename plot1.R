
#Read Data in, change date format and subset
household_power_consumption <- read.csv("household_power_consumption.txt",sep = ";")
household_power_consumption$Date <- as.Date(household_power_consumption$Date,'%d/%m/%Y')

#Create Plot Data
PlotData <- subset(household_power_consumption, household_power_consumption$Date == "2007-02-01"|household_power_consumption$Date == "2007-02-02")

#Create png file
png("plot1.png", 480, 480)

#Create Plot
hist(as.numeric(as.character(PlotData$Global_active_power)), col = "Red", main = "Global Active Power", xlab = "Global Active Power(Kilowats)")

dev.off()