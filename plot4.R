
#reading data, converting data$Date to Data type, subsetting etc.
data<-read.delim("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?")
data$Date<-strptime(data$Date, "%e/%m/%Y")
data2<-data[(data$Date>="2007-2-1" & data$Date<="2007-2-2"),]
data2$Date <- as.POSIXlt(paste(as.Date(data2$Date), data2$Time, sep=" "))

#main plotting function
par(mfrow=c(2,2), mar=c(5,5,2,2))
plot(data2$Date, data2$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
plot(data2$Date, data2$Voltage, type="l",
     xlab="datetime", ylab="Voltage")


plot(data2$Date, data2$Sub_metering_1, type="n",xlab="", ylab="Energy sub metering", ylim=c(0, max(c(data2$Sub_metering_1, data2$Sub_metering_2, data2$Sub_metering_3))),)
lines(data2$Date, data2$Sub_metering_1, col="black")
lines(data2$Date, data2$Sub_metering_2, col="red")
lines(data2$Date, data2$Sub_metering_3, col="blue")
legend("topright",pch="-",lwd=1,bty="n",cex=.6,pt.cex=0.6,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data2$Date, data2$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")
#saving into png
dev.copy(png, file="plot4.png", width=480,height=480)
dev.off()  
