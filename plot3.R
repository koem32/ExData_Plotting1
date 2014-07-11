library(sqldf)
myFile <- "./household_power_consumption.txt"
mySql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
dfData <- read.csv2.sql(myFile,mySql)
png(file="plot3.png",width = 480, height = 480)
x<-paste(dfData$Date,dfData$Time)
y<-strptime(x,format="%d/ %m/ %Y %H: %M: %S")
with (dfData, plot(y,Sub_metering_1,ylab= "Energy sub metering",xlab="", type= "l"))
with (dfData, lines(y,Sub_metering_2, col="red"))
with (dfData, lines(y,Sub_metering_3, col="blue"))
legend("topright", lty = "solid", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"))
dev.off()
