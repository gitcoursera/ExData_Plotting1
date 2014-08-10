# download and unzip it https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

library(data.table)
DT = fread("../household_power_consumption.txt")

library(sqldf)
res <- sqldf("select * from DT where Date='1/2/2007' or Date='2/2/2007'")
res$Date <- strptime(paste(res$Date,res$Time), "%d/%m/%Y %H:%M:%S")

par(mfcol=c(2,2))
par(mar=c(4.1,4.1,4.1,1.1))
plot(res$Date, res$Global_active_power, type="l", xlab="", ylab="Global Active Power")

ylim_value <- mean(as.numeric(res2$Sub_metering_1)) * 100

with(res, plot(Date, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", ylim=c(0,ylim_value)))
par(new=TRUE)
with(res, plot(Date, Sub_metering_2, type="l", xlab="", ylab="", col="red", axes=F, ylim=c(0,ylim_value)))
par(new=TRUE)
with(res, plot(Date, Sub_metering_3, type="l", xlab="", ylab="", col="blue", axes=F, ylim=c(0,ylim_value)))
par(new=TRUE)
# Add legend at the top right corner
legend("topright", bty="n", lty=1, text.font=7, cex=0.8,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"))

with(res, plot(Date, Voltage, type="l", xlab="datetime"))

plot(res$Date, res$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "../figure/plot4.png")
dev.off()