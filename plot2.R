hpc <- read.csv(file="household_power_consumption.txt", sep=";")
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time),
                           format="%d/%m/%Y %H:%M:%S")
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
})
dev.copy(png, file="plot2.png")
dev.off()
