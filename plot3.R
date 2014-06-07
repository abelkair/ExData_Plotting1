# plot3.R
#---------------------------
setwd("c:/week4")
# import data table in text format
A <- read.table("c:/week4/household_power_consumption.txt", header=TRUE,  sep=";")

# Conversion of Date column to date class
A$Date <- as.Date(as.character(A$Date), "%d/%m/%Y")

# Filter appropriate days from imported data file to save time/space
A2<-subset(A, (format.Date(Date, "%d") == "01" | format.Date(Date, "%d")=="02")
           & format.Date(Date, "%m")=="02" & format.Date(Date, "%Y")=="2007")

#----- Date/Time conversion -----------------------
A2$Date=as.Date(A2$Date,format="%d/%m/%Y")
A2$Date_Time=paste(A2$Date,A2$Time)
A2$Date_Time = strptime(A2$Date_Time,"%Y-%m-%d %H:%M:%S")

#============ Save plot output as PNG doc ==================

png("c:/week4/plot3.png", width = 480, height = 480)

#----- Plot of energy sub metering -------------
with(A2, {

  plot(A2$Date_Time, A2$Sub_metering_1,  type="l", 
       xlab="", ylab="Energy sub metering", yaxt="n", ylim=c(0, 30))
  
  lines(A2$Date_Time, A2$Sub_metering_2, col="red")
  lines(A2$Date_Time, A2$Sub_metering_3, col="blue")
  
  legend("topright", col=c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty=1, lwd =3.5)
  
#----- Custom tick sequencing ---------
  axis(2, at = seq(0, 30, 10))
  box()
  } )

#----- Return to default visualization display ---- 
dev.off()
