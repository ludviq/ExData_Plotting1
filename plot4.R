Sys.setlocale("LC_TIME", "English") 
# read input data
inputdata<-read.table(file =".\\household_power_consumption.txt",sep = ";",
                      na.strings = "?",stringsAsFactors = FALSE,header=TRUE)
# filter data
inputdata<-inputdata[inputdata$Date %in% c("1/2/2007","2/2/2007"),]
# convert data format and create datatime
inputdata$Date<- as.Date(inputdata$Date,"%d/%m/%Y")
inputdata$datatime<-paste(inputdata$Date,inputdata$Time,sep = ", ")
inputdata$datatime<- strptime(inputdata$datatime, format="%Y-%m-%d, %H:%M:%S")
# save plot 4
png("plot4.png",width=480, height=480)
par(mfrow = c(2, 2))
plot(x = inputdata$datatime,y = inputdata$Global_active_power,type="n",ylab ="Global Active Power",xlab="" )
lines(x = inputdata$datatime,y = inputdata$Global_active_power)
plot(x=inputdata$datatime,y=inputdata$Voltage,type="n",ylab="Voltage",xlab="datatime")
lines(x=inputdata$datatime,y=inputdata$Voltage)
plot(x = inputdata$datatime,y = inputdata$Sub_metering_1,type="n",ylab ="Energy sub metering",xlab="" )
legend( x="topright",
        col = c("black", "red","blue"),
        legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
        ,lwd=2
        , cex = 1
        ,bty = "n")
with(inputdata,lines(datatime,Sub_metering_1))
with(inputdata,lines(datatime,Sub_metering_2,col="red"))
with(inputdata,lines(datatime,Sub_metering_3,col="blue"))
plot(x=inputdata$datatime,y=inputdata$Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datatime")
lines(x=inputdata$datatime,y=inputdata$Global_reactive_power)
dev.off()