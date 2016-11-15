# Read & prime data
raw_dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?,", stringsAsFactors = FALSE)

my_dat <- raw_dat[raw_dat$Date %in% c("1/2/2007","2/2/2007"), ]

my_dat$DT_Time <- paste(my_dat$Date, my_dat$Time)

my_dat$DT_Time <- strptime(my_dat$DT_Time, "%d/%m/%Y %H:%M:%S")



# Graph
png(file = "plot4.png")

# Setup latice 
par(mfcol = c(2,2))

# Top left
plot(my_dat$DT_Time, my_dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

# Bottom left
plot(my_dat$DT_Time, my_dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(my_dat$DT_Time, my_dat$Sub_metering_2, type = "l", col = "red")

lines(my_dat$DT_Time, my_dat$Sub_metering_3, type = "l", col = "blue")

#Top right
plot(my_dat$DT_Time, my_dat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Bottom right
plot(my_dat$DT_Time, my_dat$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()