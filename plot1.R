plot1 <- function(){
    ## Reading data
    consumption = read.table("household_power_consumption.txt", header=TRUE, sep=";", na="?", dec=".")
    
    ## Selecting range between date
    range = consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]
    
    ## Numeric convertion
    range$Global_active_power = as.numeric(range$Global_active_power)
    
    #Plot
    hist(range$Global_active_power, main=paste("Global Active Power"), xlab="Global Active Power (kilowatts)", col="red")
    
    ##Save to png file 
    dev.copy(png, file = "plot1.png")
    dev.off() 
}
plot1()