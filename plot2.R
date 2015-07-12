plot2 <- function(){
    ## Reading data
    consumption = read.table("household_power_consumption.txt", header=TRUE, sep=";", na="?", dec=".")
    
    ## Selecting range between date
    range = consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]  
    
    ## Numeric convertion
    range$Global_active_power = as.numeric(range$Global_active_power)
    
    ##Convert dates and times    
    range$DateTime = strptime(paste(range$Date, range$Time, sep=" "), "%d/%m/%Y %H:%M:%S")     
    
    ##Plot
    plot(range$DateTime, range$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    
    ##Save to png file
    dev.copy(png, file = "plot2.png",bg="grey")
    dev.off()    
}
plot2()