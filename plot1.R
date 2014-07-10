plot1 <- function() {

	plot.data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
	plot.data[,1]<-as.Date(plot.data[,1],format='%d/%m/%Y')

	sub.data<-subset(plot.data,plot.data$Date=="2007-02-01"|plot.data$Date =="2007-02-02")

	png(file="plot1.png")

	hist(sub.data[,3],main = "Global Active Power",col="red",xlab="Global Active Power (kilowatts)")

	dev.off()

}
