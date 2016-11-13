# Set Working Directory
setwd("/Users/ChrisDurham/Dropbox/Coursera/4. Exploratory Data Analysis/Week 1/")

# Load Data Table
data<-read.table("household_power_consumption.txt",
                 header= TRUE,
                 sep=";",
                 na.strings = "?",
                  stringsAsFactors = FALSE)

# Subset to Rows Needed
usedata<-subset(data, Date == "1/2/2007" | Date =="2/2/2007")

# Combine Date and Time in new Variable
usedata["Datetime"]<-NA
x<-paste(usedata$Date,usedata$Time)
usedata$Datetime<-strptime(x, "%d/%m/%Y %H:%M:%S")
rm(x)


# Make 1st Plot
hist(as.numeric(usedata$Global_active_power), 
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowats)")



# Make PNG
png(filename="plot1.PNG", width = 480, height = 480)

hist(as.numeric(usedata$Global_active_power), 
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowats)")

dev.off()
