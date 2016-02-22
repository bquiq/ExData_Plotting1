#load, format and select the data for the assignment
Sys.setlocale("LC_TIME", "English")
md <- read.csv("exploratory/household_power_consumption.txt",sep=";",header=T,na.strings="?")
md<-md[md$Date=="1/2/2007" | md$Date=="2/2/2007", ]
md$DateTime <- strptime(paste(md$Date,md$Time), format="%e/%m/%Y %H:%M:%S")
md$WeekDay <- weekdays(md$DateTime,abbreviate = T)
head(md)

#Plot1
hist(md$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, width=480, height=480, file="exploratory/plot1.png", res=45)
dev.off()