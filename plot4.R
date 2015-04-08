## Read data
df <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE,
                 header = TRUE, sep = ";", na.strings = "?")

## Subset the data only to days 2007-02-01 and 2007-02-02. 1st and 2nd February
df2 <- subset(df, Date =="1/2/2007" | Date == "2/2/2007")

## read in date/time info in format 'd/m/Y h:m:s'
xx <- with(df2, paste(Date, Time))
datetime <- strptime(xx, "%d/%m/%Y %H:%M:%S")

## Put the POSIXlt date varaible as an extra dataframe column
df2$datetime <- datetime

## Launch graphic device 
png("plot4.png")

## Create Plot 04

par(mfrow = c(2, 2))
with(df2, {
        # Top-left plot
        plot(datetime, Global_active_power,
             type = "l",
             xlab = "",
             ylab = "Global Active Power (kilowatts)")
        
        # top-right
        plot(datetime, Voltage,
             type = "l",
             ylab = "Voltage")
        
        # bottom-left plot
        plot(datetime, Sub_metering_1,
             type = "l",
             xlab = "",
             ylab = "Energy sub metering")
        
        lines(datetime, Sub_metering_2,
              type = "l",
              col = "red")
        
        lines(datetime, Sub_metering_3,
              type = "l",
              col = "blue")
        
        legend("topright",
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty=c(1,1,1),
               bty = "n",
               col=c("black", "red", "blue")
               )
        
        # bottom-rigth plot
        plot(datetime, Global_reactive_power,
             type = "l")
        })


## Close graphic device
dev.off()