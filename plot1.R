
## Reading in the file subsetting for the needed dates
hpc<-read.csv(pipe('grep -E \"Date|^[12]/2/2007\" data/household_power_consumption.txt'), sep=";", na.strings = "?")

png("plot1.png", height = 480, width = 480, bg = "transparent")

## Creating the histogram
with(hpc,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))

dev.off() 

