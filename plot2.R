plot2<-function(){
  
  data1<-read.table("c:/Users/Kukurill/Documents/GitHub/ExData_Plotting1/household_power_consumption.txt", sep=";", dec=".", header=TRUE, na.strings="0")
  data2<-subset(data1,data1$Date=="1/2/2007"|data1$Date=="2/2/2007")

  data2$Date1<-as.Date(data2$Date, "%d/%m/%Y")
  data2$datetime<-paste(data2$Date1,data2$Time, sep=" ")
  data2$datetime<-strptime(data2$datetime, "%Y-%m-%d %H:%M:%S")

    
  with(data2,plot(data2$datetime,data2$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l"))
  dev.copy(png,file="c:/Users/Kukurill/Documents/GitHub/ExData_Plotting1/Plot2.png", height=480, width=480)
  dev.off()
}
