
#### Read data from File #############################################
X <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

Y <- X
#### Convert Date field into appropriate format ###########
Y$Date <- as.Date(X$Date, "%d/%m/%Y")

#### Select the active power data of two days i.e. 01/02/2007 and 02/02/2007 #####
Z <- X$Global_active_power[Y$Date == as.Date("01/02/2007", "%d/%m/%Y") | Y$Date == as.Date("02/02/2007","%d/%m/%Y")]

#### Open PNG file ####################################### 
png("plot1.png")

#### Plot histogram ######################################
hist(Z,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     yaxt = "n"
     )
axis(2, at = seq(0, 1200, by = 200), las=2)

dev.off()