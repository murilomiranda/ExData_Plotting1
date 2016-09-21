# Read dataset
file_name <- "household_power_consumption.txt"
data <- read.csv(file_name, header = T, sep = ';', na.strings = "?", nrows = 2075259, 
                 check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')

# Converting the dates
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subsetting the data
data_set <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data_set$Datetime <- as.POSIXct(paste(as.Date(data_set$Date), data_set$Time))
rm(data)

## Generating plot
with(data_set, {
  plot(Sub_metering_1 ~ Datetime, type = "l", 
       ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, lwd = 2)
