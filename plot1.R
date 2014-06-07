# plot1.R
#------------------

setwd("c:/week4")
# import data table in text format
A <- read.table("c:/week4/household_power_consumption.txt", header=TRUE,  sep=";")

# Conversion of Date column to date class
A$Date <- as.Date(as.character(A$Date), "%d/%m/%Y")

# Filter appropriate days from imported data file to save time/space
A2<-subset(A, (format.Date(Date, "%d") == "01" | format.Date(Date, "%d")=="02")
            & format.Date(Date, "%m")=="02" & format.Date(Date, "%Y")=="2007")

#============ Save plot output as PNG doc ==================

png("c:/week4/plot1.png", width = 480, height = 480)

#---------------histogram of frequency of occurence of active power variable------------
# vizualization of household global minute-averaged active power (kilowatts)

hist( as.numeric(as.character(A2[['Global_active_power']])), # Column is in numeric form
      col="red",                                             # set color of plot to red  
      right = FALSE,                                         # intervals are closed on left
      main="Global Active Power",                            # set main title of plot
      xlab = "Global Active Power (kilowatts)")              # set x-axis label

#----- Return to default visualization display ---- 
dev.off()
