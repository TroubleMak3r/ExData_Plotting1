
#reading data, converting data$Date to Data type, subsetting etc.
data<-read.delim("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?")
data$Date<-strptime(data$Date, "%e/%m/%Y")
data2<-data[(data$Date>="2007-2-1" & data$Date<="2007-2-2"),]
data2$Date <- as.POSIXlt(paste(as.Date(data2$Date), data2$Time, sep=" "))

#main plotting function
par(mfrow=c(1,1), mar=c(4,4,2,1))
plot(data2$Date, data2$Sub_metering_1, type="n", lwd=1,xlab="", ylab="Energy sub metering")
lines(data2$Date, data2$Sub_metering_1, col="black")
lines(data2$Date, data2$Sub_metering_2, col="red")
lines(data2$Date, data2$Sub_metering_3, col="blue")
legend("topright",pch="-",col=c("black","red","blue"),y.intersp=0.5, cex=0.6,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#saving into png
dev.copy(png, file="plot3.png", width=480,height=480)
dev.off()  
