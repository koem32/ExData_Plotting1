library(sqldf)
myFile <- "./household_power_consumption.txt"
mySql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
dfData <- read.csv2.sql(myFile,mySql)
png(file="plot1.png",width = 480, height = 480)
with (dfData, hist(Global_active_power,col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()