x <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
x <- subset(x,Date %in% c("1/2/2007","2/2/2007"))
x$DateTime <- strptime(paste(x$Date,x$Time),"%d/%m/%Y %T")


png(file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(x,plot(x$DateTime, x$Global_active_power, type = "l", ylab = "Global Acive Power", xlab=""))
with(x,plot(x$DateTime, x$Voltage, type = "l", ylab = "Voltage", xlab="datetime"))

with(x,plot(DateTime, Sub_metering_1, type = "n", xlab="", ylab="Energy Sub metering"))
with(x,lines(DateTime, Sub_metering_1, col="black", type="l"))
with(x,lines(DateTime, Sub_metering_2, col="red", type="l"))
with(x,lines(DateTime, Sub_metering_3, col="blue", type="l"))
legend("topright",col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, bty="n" )

with(x,plot(x$DateTime, x$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab="datetime"))
dev.off()