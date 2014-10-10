plot1<-function(){
  library(datasets)
  Energy<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character","character","character","character","character","character","character","character","character"))
  subEnergy<-Energy[Energy$Date=="1/2/2007"|Energy$Date=="2/2/2007",]
  DateTime=strptime(paste(subEnergy$Date,subEnergy$Time),format="%d/%m/%Y %H:%M:%S")
  subEnergy<-cbind(DateTime,subEnergy)
  subEnergy$Global_active_power<-as.numeric(subEnergy$Global_active_power)
  plot(hist(subEnergy$Global_active_power),main="Global Active Power",xlab="Global Active Power (kilowatts)",col="Red")
  dev.copy(png,file="plot1.PNG")
  dev.off()
}