## Reading in the file subsetting for the needed dates
hpc<-read.csv(pipe('grep -E \"Date|^[12]/2/2007\" data/household_power_consumption.txt'), sep=";", na.strings = "?")

##Changing the date format
hpc$Date <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png", height = 480, width = 480, bg = "transparent")

##Creating the plot
with(hpc,plot(Date, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))

##Adding the additional lines
with(hpc,lines(Date,Sub_metering_2,type="l",col="red"))
with(hpc,lines(Date,Sub_metering_3,type="l",col="blue"))

##Craeting the legend
legend("topright",  lty = c("solid", "solid", "solid"), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off() 