## Read the data
data<-read.csv("household_power_consumption.txt", sep=';',colClasses = "character")

# Find the data corresponding to the first two days in Feb 2007
x<-data$Date=="1/2/2007" | data$Date=="2/2/2007"
Useddata=data[x,]

# Convert date/time to date/time class
x <- paste(Useddata$Date, Useddata$Time)
time=strptime(x,format = "%d/%m/%Y %H:%M:%S")

# Convert to double
gap <- as.numeric(Useddata$Global_active_power)
volt <- as.numeric(Useddata$Voltage)
grp <- as.numeric(Useddata$Global_reactive_power)
SM1=as.numeric(Useddata$Sub_metering_1)
SM2=as.numeric(Useddata$Sub_metering_2)
SM3=as.numeric(Useddata$Sub_metering_3)

# Create and save the plot
png("plot4.png")

# Set up the 2x2 frame
par(mfrow = c(2, 2),mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# First plot
plot(time,gap, type="l",ylab="Global Active Power", xlab="")

# Second plot
plot(time,volt, type="l",ylab="Voltage", xlab="")

## Third plot

# get the range for the x and y axis 
xrange <- range(time) 
yrange <- range(SM1) 

# set up the plot 
plot(xrange, yrange, type="n",xlab="",ylab="Energy sub metering" ) 
colors <- colors(3) 


# add lines 
lines(time, SM1, type="l",
      col="1") 

lines(time, SM2, type="l",
      col="2") 

lines(time, SM3, type="l",col="12") 

legend("topright", legend = paste("Sub metering", 1:3),col=c(1,2,12),lty=1)

# Fourth plot
plot(time,grp,type='l',ylab="Global Reactive Power", xlab="")

dev.off()

