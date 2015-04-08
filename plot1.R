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
png("plot1.png")

## Create Plot 01
with(df2, hist(Global_active_power, 
               col='red',
               main = "Global Active Power",
               xlab = "Global Active Power (kilowatts)"
               )
     )

## Close graphic device
dev.off() 