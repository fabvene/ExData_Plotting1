#Read raw data
HPC <- read.csv("C:/Users/FV/Desktop/MOOC/EDA/household_power_consumption.txt", sep=";",stringsAsFactors = FALSE, na.strings= "?")

#Subset data
HPC2<-subset(HPC, (Date =="1/2/2007" | Date=="2/2/2007"))

HPC2$Date<-as.Date(HPC2$Date, "%d/%m/%Y")

#create plot1
png("plot1.png", width = 480, height = 480)
hist(HPC2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
