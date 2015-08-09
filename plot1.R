  plot1<-function(){
  
  data1<-read.table("c:/Users/Kukurill/Documents/GitHub/ExData_Plotting1/household_power_consumption.txt", sep=";", dec=".", header=TRUE, na.strings="0")
  data2<-subset(data1,data1$Date=="1/2/2007"|data1$Date=="2/2/2007")

  data3<-data2[,3]
  data3<-as.numeric(as.character(data3))

  hist(data3,main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
  dev.copy(png,file="c:/Users/Kukurill/Documents/GitHub/ExData_Plotting1/Plot1.png", height=480, width=480)
  dev.off()
  
  
    
  }
