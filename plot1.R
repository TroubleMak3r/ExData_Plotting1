#reading data, converting data$Date to Data type, subsetting etc.
data<-read.delim("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?")
data$Date<-strptime(data$Date, "%e/%m/%Y")
data2<-data[(data$Date>="2007-2-1" & data$Date<="2007-2-2"),]
# main histogram part (function starts here)
par(mfrow=c(1,1), mar=c(4,4,2,1))
hist(data2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480,height=480)
dev.off()  
