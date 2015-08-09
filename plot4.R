plot4<-function(){
  
  data1<-read.table("c:/Users/Kukurill/Documents/GitHub/ExData_Plotting1/household_power_consumption.txt", sep=";", dec=".", header=TRUE, na.strings="0")
  data2<-subset(data1,data1$Date=="1/2/2007"|data1$Date=="2/2/2007")

  data2$Date1<-as.Date(data2$Date, "%d/%m/%Y")
  data2$datetime<-paste(data2$Date1,data2$Time, sep=" ")
  data2$datetime<-strptime(data2$datetime, "%Y-%m-%d %H:%M:%S")
  data2$Sub_metering_1<-as.numeric(as.character(data2$Sub_metering_1))
  data2$Sub_metering_2<-as.numeric(as.character(data2$Sub_metering_2))
  data2$Sub_metering_3<-as.numeric(as.character(data2$Sub_metering_3))
  data2$Global_active_power<-as.numeric(as.character(data2$Global_active_power))
  data2$Voltage<-as.numeric(as.character(data2$Voltage))
  

  par(mfrow = c(2, 2))
  with(data2, {
    plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    
    plot(datetime, Voltage, xlab = "datetime", type = "l", ylab = "Voltage")
    
    ylimits = range(c(data2$Sub_metering_1, data2$Sub_metering_2, data2$Sub_metering_3))
    plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", ylim = ylimits, col = "black")
    
    par(new = TRUE)
    plot(datetime, Sub_metering_2, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "red")
    par(new = TRUE)
    plot(datetime, Sub_metering_3, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "blue")
    legend("topright",
          legend = c("Sub_metering_1               ", "Sub_metering_2               ", "Sub_metering_3               "), cex=0.5,
          bg = "transparent",
          bty = "n",
           lty = c(1,1,1),
          col = c("black", "red", "blue")
   )
    
    plot(datetime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
   dev.copy(png,file="c:/Users/Kukurill/Documents/GitHub/ExData_Plotting1/Plot4.png", height=480, width=480)
    
  })
  dev.off()
   
}
  