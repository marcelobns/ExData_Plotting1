plot3 <- function(){
    ## Reading data
    consumption = read.table("household_power_consumption.txt", header=TRUE, sep=";", na="?", dec=".")
    
    ## Selecting range between date
    range = consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]  
    
    ## Numeric convertion
    range$Global_active_power = as.numeric(range$Global_active_power)
    range$Sub_metering_1 = as.numeric(range$Sub_metering_1)
    range$Sub_metering_2 = as.numeric(range$Sub_metering_2)
    range$Sub_metering_3 = as.numeric(range$Sub_metering_3)

    ##Convert dates and times    
    range$DateTime = strptime(paste(range$Date, range$Time, sep=" "), "%d/%m/%Y %H:%M:%S")     
    
    #Plot
    plot(range$DateTime, range$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
    lines(range$DateTime, range$Sub_metering_2, type="l", col="red")
    lines(range$DateTime, range$Sub_metering_3, type="l", col="blue")
    
    #Annotations
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

    dev.copy(png, file = "plot3.png",bg="grey")
    dev.off()    
}
plot3()