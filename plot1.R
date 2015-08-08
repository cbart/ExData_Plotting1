hpc <- read.csv(file="household_power_consumption.txt", sep=";")
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
with(subset(hpc, Date %in% c("1/2/2007", "2/2/2007")), {
  hist(Global_active_power,
       xlab="Global active power (kilowatts)",
       col="red",
       main="Global Active Power",
       axes=FALSE,
       breaks=seq(0, 7.5, 0.5))
  axis(side=1, at=c(0,2,4,6))
  axis(side=2, at=c(0,200,400,600,800,1000,1200))
})
dev.copy(png, file="plot1.png")
dev.off()
