## Reading in the file subsetting for the needed dates
hpc<-read.csv(pipe('grep -E \"Date|^[12]/2/2007\" data/household_power_consumption.txt'), sep=";", na.strings = "?")

##Changing the date format
hpc$Date <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")

png("plot2.png", height = 480, width = 480, bg = "transparent")

##Creating the plot
with(hpc,plot(Date, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off() 
