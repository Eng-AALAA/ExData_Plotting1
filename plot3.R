#Loading the data
install.packages('pryr')
library(pryr)
data <- read.table(file.choose(), header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##how much memory the data-set will require
if (object_size(data) < memory.size()){
  mem_change(data)  
}

subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
date_time <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub_metering1 <- as.numeric(subData$Sub_metering_1)
sub_metering2 <- as.numeric(subData$Sub_metering_2)
sub_metering3 <- as.numeric(subData$Sub_metering_3)

#Making Plots
png("plot3.png", width=480, height=480)
setwd("C:/Users/Ahmed Alaa/Desktop")
plot(date_time, sub_metering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, sub_metering2, type="l", col="red")
lines(date_time, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
