# Set Working Directory
setwd("/Users/ChrisDurham/Dropbox/Coursera/4. Exploratory Data Analysis/Week 1/")

# Load Data Table
data<-read.table("household_power_consumption.txt", header= TRUE, sep=";")

# Subset to Rows Needed
usedata<-subset(data, Date == "1/2/2007" | Date =="2/2/2007")

# Combine Date and Time in new Variable
usedata["Datetime"]<-NA
x<-paste(usedata$Date,usedata$Time)
usedata$Datetime<-strptime(x, "%d/%m/%Y %H:%M:%S")
rm(x)


# Make 4th Plot
par(mfrow=c(2,2))

plot(usedata$Datetime,as.numeric(usedata$Global_active_power),
     type="l",xlab="",
     ylab="Global Active Power")


plot(usedata$Datetime,as.numeric(usedata$Voltage),
     type="l",xlab="datetime",
     ylab="Voltage")

plot(usedata$Datetime,as.numeric(usedata$Sub_metering_1),
     type="n",
     ylab = "Energy sub metering")

points(usedata$Datetime,as.numeric(usedata$Sub_metering_1),
       col="black", type ="l")
points(usedata$Datetime,as.numeric(usedata$Sub_metering_2),
       col="red", type ="l")
points(usedata$Datetime,as.numeric(usedata$Sub_metering_3),
       col="blue", type ="l")
legend("topright",
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


plot(usedata$Datetime,as.numeric(usedata$Global_reactive_power),
     type="l",ylab="Global_reativte_power",xlab="datetime")






# Make PNG
png(filename="plot4.PNG", width = 480, height = 480)

par(mfrow=c(2,2))

plot(usedata$Datetime,as.numeric(usedata$Global_active_power),
     type="l",xlab="",
     ylab="Global Active Power")


plot(usedata$Datetime,as.numeric(usedata$Voltage),
     type="l",xlab="datetime",
     ylab="Voltage")

plot(usedata$Datetime,as.numeric(usedata$Sub_metering_1),
     type="n",
     ylab = "Energy sub metering")

points(usedata$Datetime,as.numeric(usedata$Sub_metering_1),
       col="black", type ="l")
points(usedata$Datetime,as.numeric(usedata$Sub_metering_2),
       col="red", type ="l")
points(usedata$Datetime,as.numeric(usedata$Sub_metering_3),
       col="blue", type ="l")
legend("topright",
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


plot(usedata$Datetime,as.numeric(usedata$Global_reactive_power),
     type="l",ylab="Global_reativte_power",xlab="datetime")







dev.off()