# plot4.R
#------------------------

setwd("c:/week4")
# import data table in text format
A <- read.table("c:/week4/household_power_consumption.txt", header=TRUE,  sep=";")

# Conversion of Date column to date class
A$Date <- as.Date(as.character(A$Date), "%d/%m/%Y")

# Filter appropriate days from imported data file to save time/space
A2 <- subset(A, (format.Date(Date, "%d") == "01" | format.Date(Date, "%d")=="02")
           & format.Date(Date, "%m")=="02" & format.Date(Date, "%Y")=="2007")

#----- Date/Time conversion -----------------------
A2$Date = as.Date(A2$Date,format="%d/%m/%Y")
A2$Date_Time = paste(A2$Date,A2$Time)
A2$Date_Time = strptime(A2$Date_Time,"%Y-%m-%d %H:%M:%S")

#============ Multiple Base Plots ==================
#NOTE: Custom tick sequencing worked only for the 
#      Global-reactive_power plot
#===================================================

#----- output plot to PNG doc --------------------
png("c:/week4/plot4.png", width = 480, height = 480)

#------ Set number of plots, margins and plots -----
par(mfrow=c(2,2))

with(A2, {
#------ Plot of Global active power ----------------
  plot(A2$Date_Time,A2$Global_active_power,type="l", 
       ylab="Global Active Power",xlab="")

#------ Voltage Plot ------------------------------- 
  plot(A2$Date_Time, A2$Voltage, type="l", 
       xlab="datetime", ylab="Voltage")

#----- Plot of different sub meterings -------------
  plot(A2$Date_Time, A2$Sub_metering_1,  type="l", yaxt="n",
       ylab="Energy sub metering", xlab="", ylim=c(0, 30))

  lines(A2$Date_Time, A2$Sub_metering_2, col="red")
  lines(A2$Date_Time, A2$Sub_metering_3, col="blue")
  legend("topright", col=c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty=1, lwd =3.5, bty="n")

#----- Custom tick sequencing ---------
  axis(2, at = seq(0, 30, 10))
  box()

#----- Plot of Global reactive power --------------
  plot(A2$Date_Time, A2$Global_reactive_power, type="l",
       xlab="datetime", ylab="Global_reactive_power")
  } )

#----- Return to default visualization display ---- 
dev.off()
