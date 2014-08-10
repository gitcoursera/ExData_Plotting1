# download and unzip it https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

library(data.table)
DT = fread("../household_power_consumption.txt")

library(sqldf)
res <- sqldf("select * from DT where Date='1/2/2007' or Date='2/2/2007'")

res$Date <- strptime(paste(res$Date,res$Time), "%d/%m/%Y %H:%M:%S")
plot(res$Date, res$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "../figure/plot2.png")
dev.off()