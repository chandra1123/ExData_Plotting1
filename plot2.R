x <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
x <- subset(x,Date %in% c("1/2/2007","2/2/2007"))
x$DateTime <- strptime(paste(x$Date,x$Time),"%d/%m/%Y %T")

png(file = "plot2.png", width = 480, height = 480)
with(x,plot(x$DateTime, x$Global_active_power, type = "l", ylab = "Global Acive Power (kilowatts)", xlab=""))
dev.off()
