
#reading data, converting data$Date to Data type, subsetting etc.
data<-read.delim("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?")
data$Date<-strptime(data$Date, "%e/%m/%Y")
data2<-data[(data$Date>="2007-2-1" & data$Date<="2007-2-2"),]
data2$Date <- as.POSIXlt(paste(as.Date(data2$Date), data2$Time, sep=" "))
par(mfrow=c(1,1), mar=c(4,4,2,1))
#main plot function starts here
plot(data2$Date, data2$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
#saving into png
dev.copy(png, file="plot2.png", width=480,height=480)
dev.off()  
