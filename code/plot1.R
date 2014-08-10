# download and unzip it https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

library(data.table)
DT = fread("../household_power_consumption.txt")

library(sqldf)
res <- sqldf("select * from DT where Date='1/2/2007' or Date='2/2/2007'")

hist(as.numeric(res$Global_active_power), col="red", 
     main=paste("Global Active Power"),
     ylim=range(0:1200),
     xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "../figure/plot1.png")
dev.off()