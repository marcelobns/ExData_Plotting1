plot1 <- function(){
    ## Reading data
    consumptionData = read.table("household_power_consumption.txt", header=TRUE, sep=";")
    
    ## Selecting range by index
    range = consumptionData[66637:69516, ]
    
    ## Numeric convertion
    range$Global_active_power = as.numeric(as.character(range$Global_active_power))
    
    #Range to dataframe
    df = data.frame(range)
    
    #Plot
    hist(df$Global_active_power, main=paste("Global Active Power"), xlab="Global Active Power (kilowatts)", col="red")
    
    ##Save to png file 
    dev.copy(png, file = "plot1.png")
    dev.off()
}
plot1()