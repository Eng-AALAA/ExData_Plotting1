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
global_active_power <- as.numeric(subData$Global_active_power)

#Making Plots
png("plot2.png", width=480, height=480)
setwd("C:/Users/Ahmed Alaa/Desktop")
plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
