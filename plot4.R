plot4 <- function(){
    ## Reading data
    consumption = read.table("household_power_consumption.txt", header=TRUE, sep=";", na="?", dec=".")
    
    ## Selecting range between date
    range = consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]  
    
    ## Numeric convertion
    range$Global_active_power = as.numeric(range$Global_active_power)
    range$Global_reactive_power = as.numeric(range$Global_reactive_power)
    range$Sub_metering_1 = as.numeric(range$Sub_metering_1)
    range$Sub_metering_2 = as.numeric(range$Sub_metering_2)
    range$Sub_metering_3 = as.numeric(range$Sub_metering_3)
    range$Voltage = as.numeric(range$Voltage)
    
    ##Convert dates and times    
    range$DateTime = strptime(paste(range$Date, range$Time, sep=" "), "%d/%m/%Y %H:%M:%S")     
        
    #Plot layout
    par(mfrow = c(2, 2)) 
    
    #Plots
    plot(range$DateTime, range$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
    
    plot(range$DateTime, range$Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    plot(range$DateTime, range$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
    lines(range$DateTime, range$Sub_metering_2, type="l", col="red")
    lines(range$DateTime, range$Sub_metering_3, type="l", col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=1, col=c("black", "red", "blue"), bty="o")
    
    plot(range$DateTime, range$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")
    
    dev.copy(png, file = "plot4.png",bg="grey")
    dev.off()
}
plot4()