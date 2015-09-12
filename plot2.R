
#### Read data from File #############################################
X <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

Y <- X
#### Convert Date field into appropriate format #########
Y$Date <- as.Date(X$Date, "%d/%m/%Y")

#### Define dates ###Time####################################
date_index <- Y$Date == as.Date("01/02/2007", "%d/%m/%Y") | Y$Date == as.Date("02/02/2007","%d/%m/%Y")
date_time <- as.POSIXct(paste(as.character(X$Date[date_index]), as.character(X$Time[date_index]), sep = " "), format="%d/%m/%Y %H:%M:%S")

#### Select the active power data of two days i.e. 01/02/2007 and 02/02/2007 #####
Z <- X$Global_active_power[date_index]

#### Open PNG file ####################################### 
png("plot2.png")

#### Plot histogram ######################################
plot(date_time,Z,type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()