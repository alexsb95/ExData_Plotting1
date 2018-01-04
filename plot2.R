readFile <- function(){
  ## Read the file
  housePower <- read.csv2("household_power_consumption.txt", dec=".", stringsAsFactors=FALSE)

  housePower$Date_Time = strptime(paste(housePower$Date, housePower$Time, sep =" "),"%d/%m/%Y %H:%M:%S")
  ## Extract the range in betweeen dates
  housePower$Date <- as.Date(housePower$Date,"%d/%m/%Y")
  housePower <- subset(housePower, housePower$Date >= as.Date("01/02/2007","%d/%m/%Y") & housePower$Date <= as.Date("02/02/2007","%d/%m/%Y"))

  
  return(housePower)
}

createPlot2 <- function(){
  housePower <- readFile()
  
  png(file = "plot2.png")
  
  plot(housePower$Date_Time, housePower$Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
  
  dev.off()
}