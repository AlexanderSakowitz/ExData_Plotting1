data<-read.csv("household_power_consumption.txt", sep=';',colClasses = "character")

#data$Date<-as.Date(data$Date)



x<-data$Date=="1/2/2007" | data$Date=="2/2/2007"

Useddata=data[x,]

x <- paste(Useddata$Date, Useddata$Time)
time=strptime(x,format = "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(Useddata$Global_active_power)

SM1=as.numeric(Useddata$Sub_metering_1)
SM2=as.numeric(Useddata$Sub_metering_2)
SM3=as.numeric(Useddata$Sub_metering_3)



# get the range for the x and y axis 
xrange <- range(time) 
yrange <- range(SM1) 

png("plot3.png")

# set up the plot 
plot(xrange, yrange, type="n",xlab="",ylab="Energy sub metering" ) 
colors <- colors(3) 


# add lines 
  lines(time, SM1, type="l",col="1") 

  lines(time, SM2, type="l",col="2") 
  
  lines(time, SM3, type="l",col="12") 
  
  legend("topright", legend = paste("Sub metering", 1:3),col=c(1,2,12),lty=1)
  
dev.off()  

