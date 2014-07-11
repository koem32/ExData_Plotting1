library(sqldf)
myFile <- "./household_power_consumption.txt"
mySql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
dfData <- read.csv2.sql(myFile,mySql)
png(file="plot4.png",width = 480, height = 480)
x<-paste(dfData$Date,dfData$Time)
y<-strptime(x,format="%d/ %m/ %Y %H: %M: %S")

par(mfrow = c(2, 2))
#1st graph
with (dfData, plot(y,Global_active_power,ylab= "Global Active Power",xlab="", type= "l"))
#2nd graph
with (dfData, plot(y,Voltage,xlab="datetime", type= "l"))
#3rd graph
with (dfData, plot(y,Sub_metering_1,ylab= "Energy sub metering",xlab="", type= "l"))
with (dfData, lines(y,Sub_metering_2, col="red"))
with (dfData, lines(y,Sub_metering_3, col="blue"))
legend("topright", bty="n",lty = "solid", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"))
#4th graph
with (dfData, plot(y,Global_reactive_power,xlab="datetime", type= "l"))

dev.off()
