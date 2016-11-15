# Read & prime data
raw_dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?,", stringsAsFactors = FALSE)

my_dat <- raw_dat[raw_dat$Date %in% c("1/2/2007","2/2/2007"), ]

my_dat <- as.numeric(as.character(my_dat$Global_active_power))



# Graph
png(file = "plot1.png")

hist(my_dat, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()