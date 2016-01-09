## Read the data
data<-read.csv("household_power_consumption.txt", sep=';',colClasses = "character")


# Find the data corresponding to the first two days Feb 2007
x<-data$Date=="1/2/2007" | data$Date=="2/2/2007"

Useddata=data[x,]


# Convert to double
gap <- as.numeric(Useddata$Global_active_power)

# Create and save the plot
png("plot1.png")
hist(gap, col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()




