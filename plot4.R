#load, format and select the data for the assignment
Sys.setlocale("LC_TIME", "English")
md <- read.csv("exploratory/household_power_consumption.txt",sep=";",header=T,na.strings="?")
md<-md[md$Date=="1/2/2007" | md$Date=="2/2/2007", ]
md$DateTime <- strptime(paste(md$Date,md$Time), format="%e/%m/%Y %H:%M:%S")
md$WeekDay <- weekdays(md$DateTime,abbreviate = T)
head(md)

#Plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(2,2,2,2))
with(md, {
    plot(md$DateTime,md$Global_active_power, type="l", ylab="Global Active Power", xlab="")
    plot(md$DateTime,md$Voltage, type="l", ylab="Voltage", xlab="")
    with(md, {
        plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
        lines(DateTime,Sub_metering_2,type="l",col="red")
        lines(DateTime,Sub_metering_3,type="l",col="blue")
    })
    legend("topright", bty="n", lwd="2", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(DateTime,Global_reactive_power, type="l", xlab="" )
})
dev.copy(png, width=480, height=480, file="exploratory/plot4.png", res=37)
dev.off()