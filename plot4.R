
#### Read data from File #############################################
X <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

Y <- X
#### Convert Date field into appropriate format #########
Y$Date <- as.Date(X$Date, "%d/%m/%Y")

#### Define dates ###Time####################################
date_index <- Y$Date == as.Date("01/02/2007", "%d/%m/%Y") | Y$Date == as.Date("02/02/2007","%d/%m/%Y")
date_time <- as.POSIXct(paste(as.character(X$Date[date_index]), as.character(X$Time[date_index]), sep = " "), format="%d/%m/%Y %H:%M:%S")

#### Select the Data #####
Z <- X$Global_active_power[date_index]
Z1<- X$Sub_metering_1[date_index]
Z2<- X$Sub_metering_2[date_index]
Z3<- X$Sub_metering_3[date_index]

#### Open PNG file ####################################### 
png("plot4.png")


par(mfrow=c(2,2))
#### Plot ######################################
plot(date_time,Z,type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(date_time,X$Voltage[date_index], type="l",ylab="Voltage", xlab="datetime")
plot(date_time,Z1,type="l",xlab ="",ylab="Energy sub metering")
lines(date_time,Z2,col = "red")
lines(date_time,Z3,col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"))
plot(date_time,X$Global_reactive_power[date_index], type="l",ylab="Global_reactive_power", xlab="datetime")


dev.off()