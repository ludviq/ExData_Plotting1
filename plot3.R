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
# save plot 3
png("plot3.png",width=480, height=480)
plot(x = inputdata$datatime,y = inputdata$Sub_metering_1,type="n",ylab ="Energy sub metering",xlab="" )
legend( x="topright",
        col = c("black", "red","blue"),
        legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
        ,lwd=2
        , cex = 1)
with(inputdata,lines(datatime,Sub_metering_1))
with(inputdata,lines(datatime,Sub_metering_2,col="red"))
with(inputdata,lines(datatime,Sub_metering_3,col="blue"))
dev.off()