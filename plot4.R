## Reading in the file subsetting for the needed dates
hpc<-read.csv(pipe('grep -E \"Date|^[12]/2/2007\" data/household_power_consumption.txt'), sep=";", na.strings = "?")

##Changing the date format
hpc$Date <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png", height = 480, width = 480, bg = "transparent")

##Creating the plot
par(mfrow = c(2, 2))
with(hpc,{plot(Date, Global_active_power, type="l", xlab="", ylab="Global Active Power")
          plot(Date, Voltage, type="l", xlab="datetime")
        plot(Date, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(Date,Sub_metering_2,type="l",col="red")
        lines(Date,Sub_metering_3,type="l",col="blue")
        legend("topright",  bty="n",lty = c("solid", "solid", "solid"), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        plot(Date, Global_reactive_power, type="l", xlab="datetime")
        
})


dev.off() 