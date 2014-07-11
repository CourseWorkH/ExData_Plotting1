plot2 <- function() {

	plot.data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
	plot.data[,1]<-as.Date(plot.data[,1],format='%d/%m/%Y') 
	sub.data<-subset(plot.data,plot.data$Date=="2007-02-01"|plot.data$Date =="2007-02-02")
	datetime<-strptime(paste(sub.data[,1],sub.data[,2],sep=" "),format= '%Y-%m-%d %H:%M:%S')

	png(file="plot2.png")
	
	plot(datetime,sub.data[,3], type="l",ylab="Global Active Power (kilowatts)",xlab="")

	dev.off()

}
