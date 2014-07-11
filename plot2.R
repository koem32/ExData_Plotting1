library(sqldf)
myFile <- "./household_power_consumption.txt"
mySql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
dfData <- read.csv2.sql(myFile,mySql)
png(file="plot2.png",width = 480, height = 480)
x<-paste(dfData$Date,dfData$Time)
y<-strptime(x,format="%d/ %m/ %Y %H: %M: %S")
with (dfData, plot(y,Global_active_power,ylab= "Global Active Power (kilowatts)",xlab="", type= "l"))
dev.off()
