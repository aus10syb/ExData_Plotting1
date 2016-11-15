# Read & prime data
raw_dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?,", stringsAsFactors = FALSE)

my_dat <- raw_dat[raw_dat$Date %in% c("1/2/2007","2/2/2007"), ]

my_dat$DT_Time <- paste(my_dat$Date, my_dat$Time)

my_dat$DT_Time <- strptime(my_dat$DT_Time, "%d/%m/%Y %H:%M:%S")



# Graph
png(file = "plot2.png")

plot(my_dat$DT_Time, my_dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

dev.off()