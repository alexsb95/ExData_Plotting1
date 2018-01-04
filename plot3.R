readFile <- function(){
  ## Read the file

  housePower <- read.csv2("household_power_consumption.txt", dec=".", stringsAsFactors=FALSE)
  
  housePower$Date_Time <- strptime(paste(housePower$Date, housePower$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
  
  ## Extract the range in betweeen dates
  housePower$Date <- as.Date(housePower$Date,"%d/%m/%Y")
  housePower <- subset(housePower, housePower$Date >= as.Date("01/02/2007","%d/%m/%Y") & housePower$Date <= as.Date("02/02/2007","%d/%m/%Y"))
  
  housePower$Sub_metering_1 <- as.numeric(housePower$Sub_metering_1)
  housePower$Sub_metering_2 <- as.numeric(housePower$Sub_metering_2)
  housePower$Sub_metering_3 <- as.numeric(housePower$Sub_metering_3)
  
  return(housePower)
}

createPlot3 <- function(){
  housePower <- readFile()
  
  png(file = "plot3.png")
  
  plot(housePower$Date_Time,housePower$Sub_metering_1, type = "l", ylab = "Energy sub melting", xlab = "")
  points(housePower$Date_Time, housePower$Sub_metering_2, type = "l", col = "Red")
  points(housePower$Date_Time, housePower$Sub_metering_3, type = "l", col = "Blue")
  
  legend("topright",lty=1, lwd=1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
}