# Read & prime data
raw_dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?,", stringsAsFactors = FALSE)

my_dat <- raw_dat[raw_dat$Date %in% c("1/2/2007","2/2/2007"), ]

my_dat$DT_Time <- paste(my_dat$Date, my_dat$Time)

my_dat$DT_Time <- strptime(my_dat$DT_Time, "%d/%m/%Y %H:%M:%S")



# Graph
png(file = "plot3.png")

plot(my_dat$DT_Time, my_dat$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(my_dat$DT_Time, my_dat$Sub_metering_2, type = "l", col = "red")

lines(my_dat$DT_Time, my_dat$Sub_metering_3, type = "l", col = "blue")


# Legend
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()