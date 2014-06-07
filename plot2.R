# plot2.R
#------------------------
#Note: Plot cannot simply be copied since it has extra info in the y-label
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

#----- output plot to PNG doc --------------------
png("c:/week4/plot2.png", width = 480, height = 480)

with(A2, {
#------ Plot of Global active power ----------------
  plot(A2$Date_Time,A2$Global_active_power,type="l", 
       ylab="Global Active Power (kilowatts)",xlab="")

  } )

#----- Return to default visualization display ---- 
dev.off()
