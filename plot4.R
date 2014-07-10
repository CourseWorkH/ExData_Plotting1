plot4 <- function() {

	plot.data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
	plot.data[,2]<-strptime(paste(plot.data[,1],plot.data[,2],sep=" "),format= '%d/%m/%Y %H:%M:%S')
	plot.data[,1]<-as.Date(plot.data[,1],format='%d/%m/%Y')

	sub.data<-subset(plot.data,plot.data$Date=="2007-02-01"|plot.data$Date =="2007-02-02")

	png(file="plot4.png")

	par(mfrow = c(2,2))

	with(sub.data, {

		plot.ts(sub.data[,3],ylab="Global Active Power",xlab="",xaxt="n")
		axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"))

		plot.ts(sub.data[,5],ylab="Voltage",xlab="datetime",xaxt="n")
		axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"))
	
		plot(sub.data[,7],type="l",ylab="Energy sub metering",xlab="",xaxt="n")	
		lines(sub.data[,8],type="l",ylab="",xlab="",xaxt="n",col="red")
		lines(sub.data[,9],type="l",ylab="",xlab="",xaxt="n",col="blue")

		axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"))
		legend("topright",lwd=1, col=c("black","red","blue"), bty = "n",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

		plot.ts(sub.data[,4],ylab="Global_reactive_power",xlab="datetime",xaxt="n")
		axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"))
	})
	
	dev.off()

}
