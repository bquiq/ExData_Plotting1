#load, format and select the data for the assignment
Sys.setlocale("LC_TIME", "English")
md <- read.csv("exploratory/household_power_consumption.txt",sep=";",header=T,na.strings="?")
md<-md[md$Date=="1/2/2007" | md$Date=="2/2/2007", ]
md$DateTime <- strptime(paste(md$Date,md$Time), format="%e/%m/%Y %H:%M:%S")
md$WeekDay <- weekdays(md$DateTime,abbreviate = T)
head(md)

#Plot3
with(md, {
    plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
    lines(DateTime,Sub_metering_2,type="l",col="red")
    lines(DateTime,Sub_metering_3,type="l",col="blue")
})
legend("topright", lwd="2", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, width=480, height=480, file="exploratory/plot3.png", res=35)
dev.off()