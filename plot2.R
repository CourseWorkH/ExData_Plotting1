plot2 <- function() {

	plot.data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
	plot.data[,2]<-strptime(paste(plot.data[,1],plot.data[,2],sep=" "),format= '%d/%m/%Y %H:%M:%S')
	plot.data[,1]<-as.Date(plot.data[,1],format='%d/%m/%Y')

	sub.data<-subset(plot.data,plot.data$Date=="2007-02-01"|plot.data$Date =="2007-02-02")
	
	png(file="plot2.png")

	plot.ts(sub.data[,3],ylab="Global Active Power (kilowatts)",xlab="",xaxt="n")
	axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"))

	dev.off()

}
