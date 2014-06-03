#Read raw data
HPC <- read.csv("household_power_consumption.txt", sep=";",stringsAsFactors = FALSE, na.strings= "?")

#Subset data
HPC2<-subset(HPC, (Date =="1/2/2007" | Date=="2/2/2007"))

#Merges and transforms Date & Time
HPC2$Date<-as.Date(HPC2$Date, "%d/%m/%Y")
HPC2$DateAndTime<-paste(HPC2$Date, HPC2$Time)
HPC2$DateAndTime<-strptime(HPC2$DateAndTime, format="%Y-%m-%d %H:%M:%S")

#create plot3
png("plot3.png", width = 480, height = 480)

plot(HPC2$DateAndTime, HPC2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(HPC2$DateAndTime, HPC2$Sub_metering_2, type="l", xlab="", col="red")
lines(HPC2$DateAndTime, HPC2$Sub_metering_3, type="l", xlab="", col="blue")

legend("topright",lwd="2", col=c("black", "red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_2"))



dev.off()
