#Read raw data
HPC <- read.csv("household_power_consumption.txt", sep=";",stringsAsFactors = FALSE, na.strings= "?")

#Subset data
HPC2<-subset(HPC, (Date =="1/2/2007" | Date=="2/2/2007"))

#Merges and transforms Date & Time
HPC2$Date<-as.Date(HPC2$Date, "%d/%m/%Y")
HPC2$DateAndTime<-paste(HPC2$Date, HPC2$Time)
HPC2$DateAndTime<-strptime(HPC2$DateAndTime, format="%Y-%m-%d %H:%M:%S")

#create plot4
png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

#Top-left (plot2)
plot(HPC2$DateAndTime, HPC2$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#Top-right
plot(HPC2$DateAndTime, HPC2$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Bottom-left (plot3)
plot(HPC2$DateAndTime, HPC2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(HPC2$DateAndTime, HPC2$Sub_metering_2, type="l", xlab="", col="red")
lines(HPC2$DateAndTime, HPC2$Sub_metering_3, type="l", xlab="", col="blue")

legend("topright",lwd="2", col=c("black", "red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_2"))

#Bottom-right
plot(HPC2$DateAndTime, HPC2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_Reactive_Power")





dev.off()
