plot3<-function(){
  library(datasets)
  png(file = "plot3.png", height = 480, width = 480)
  Energy<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character","character","character","character","character","character","character","character","character"))
  subEnergy<-Energy[Energy$Date=="1/2/2007"|Energy$Date=="2/2/2007",]
  DateTime=strptime(paste(subEnergy$Date,subEnergy$Time),format="%d/%m/%Y %H:%M:%S")
  subEnergy<-cbind(DateTime,subEnergy)
  subEnergy$Sub_metering_1<-as.numeric(subEnergy$Sub_metering_1)
  subEnergy$Sub_metering_2<-as.numeric(subEnergy$Sub_metering_2)
  subEnergy$Sub_metering_3<-as.numeric(subEnergy$Sub_metering_3)
  plot(subEnergy$DateTime,subEnergy$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
  lines(subEnergy$DateTime,subEnergy$Sub_metering_2,col="Red")
  lines(subEnergy$DateTime,subEnergy$Sub_metering_3,col="Blue")
  legend("topright",legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),lty=c(1,1,1),col=c("Black","Red","Blue"))
  dev.off()
}