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

# Create and save the plot
png("plot2.png")
x=plot(time,gap, type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
