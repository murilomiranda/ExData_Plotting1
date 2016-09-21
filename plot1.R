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

# Generating plot
hist(data_set$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
