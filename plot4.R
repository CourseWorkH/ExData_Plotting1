plot4 <- function() {

	plot.data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
	plot.data[,1]<-as.Date(plot.data[,1],format='%d/%m/%Y') 
	sub.data<-subset(plot.data,plot.data$Date=="2007-02-01"|plot.data$Date =="2007-02-02")
	datetime<-strptime(paste(sub.data[,1],sub.data[,2],sep=" "),format= '%Y-%m-%d %H:%M:%S')	

	png(file="plot4.png")

	par(mfrow = c(2,2))

	with(sub.data, {

		plot(datetime,sub.data[,3], type="l",ylab="Global Active Power",xlab="")

		plot(datetime,sub.data[,5], type="l",ylab="Voltage")
	
		plot(datetime,sub.data[,7],type="l",ylab="Energy sub metering",xlab="")	
		lines(datetime,sub.data[,8],type="l",ylab="",xlab="",col="red")
		lines(datetime,sub.data[,9],type="l",ylab="",xlab="",col="blue")
		legend("topright",lwd=1, col=c("black","red","blue"), bty = "n",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

		plot(datetime,sub.data[,4],type="l",ylab="Global_reactive_power")
	})
	
	dev.off()

}

