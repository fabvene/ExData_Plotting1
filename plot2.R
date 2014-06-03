#Read raw data
HPC <- read.csv("household_power_consumption.txt", sep=";",stringsAsFactors = FALSE, na.strings= "?")

#Subset data
HPC2<-subset(HPC, (Date =="1/2/2007" | Date=="2/2/2007"))

#Merges and transforms Date & Time
HPC2$Date<-as.Date(HPC2$Date, "%d/%m/%Y")
HPC2$DateAndTime<-paste(HPC2$Date, HPC2$Time)
HPC2$DateAndTime<-strptime(HPC2$DateAndTime, format="%Y-%m-%d %H:%M:%S")

#create plot2
png("plot2.png", width = 480, height = 480)

plot(HPC2$DateAndTime, HPC2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")


dev.off()
