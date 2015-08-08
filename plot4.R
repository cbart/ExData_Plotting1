hpc <- read.csv(file="household_power_consumption.txt", sep=";")
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time),
                           format="%d/%m/%Y %H:%M:%S")
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
hpc$Sub_metering_1 <- as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2 <- as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3 <- as.numeric(as.character(hpc$Sub_metering_3))
hpc$Voltage <- as.numeric(as.character(hpc$Voltage))

par(mfrow=c(2, 2))

with(subset(hpc, Date %in% c("1/2/2007", "2/2/2007")), {
  plot(DateTime, Global_active_power,
       ylab="Global active power (kilowatts)",
       xlab="",
       type="l",
       axes=FALSE)
  axis.POSIXct(side=1,
              at=seq(from=min(DateTime),
                     to=max(DateTime) + 60*60,
                     by="day"),
              format="%a")
  axis(side=2, at=c(0,2,4,6))

  plot(DateTime, Voltage, typ="l", xlab="datetime")

  plot(DateTime, Sub_metering_3,
       ylab="Energy sub metering",
       xlab="",
       ylim=c(0, 40),
       type="n",
       axes=FALSE)
  lines(DateTime, Sub_metering_1, col="black")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  axis.POSIXct(side=1,
               at=seq(from=min(DateTime),
                      to=max(DateTime) + 60*60,
                      by="day"),
               format="%a")
  axis(side=2, at=seq(0,30, by=10))
  legend("topright", pch="-", bty="n",
         col=c("black", "red", "blue"),
         legend=c("Sub_merging_1", "Sub_merging_2", "Sub_merging_3"))
  box()

  plot(DateTime, Global_reactive_power, typ="l", xlab="datetime")
})

dev.copy(png, file="plot4.png")
dev.off()

