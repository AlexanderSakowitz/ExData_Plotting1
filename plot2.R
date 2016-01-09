data<-read.csv("household_power_consumption.txt", sep=';',colClasses = "character")

#data$Date<-as.Date(data$Date)



x<-data$Date=="1/2/2007" | data$Date=="2/2/2007"

Useddata=data[x,]

x <- paste(Useddata$Date, Useddata$Time)
time=strptime(x,format = "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(Useddata$Global_active_power)

png("plot2.png")
x=plot(time,gap, type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
