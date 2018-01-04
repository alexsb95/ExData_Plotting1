readFile <- function(){
  ## Read the file
  housePower <- read.csv2("household_power_consumption.txt", dec=".", stringsAsFactors=FALSE)
  ## Extract the range in betweeen dates
  housePower$Date <- as.Date(housePower$Date,"%d/%m/%Y")
  housePower <- subset(housePower, housePower$Date >= as.Date("01/02/2007","%d/%m/%Y") & housePower$Date <= as.Date("02/02/2007","%d/%m/%Y"))
  ## Make convertions
  housePower$Global_active_power <- as.numeric(housePower$Global_active_power)
  
  return(housePower)
}
createPlot1 <- function(){
  housePower <- readFile()
  
  png(file = "plot1.png")
  
  hist(housePower$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", col = "Red")
  
  dev.off()
}
