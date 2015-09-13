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
# save plot 2
png("plot2.png",width=480, height=480)
plot(x = inputdata$datatime,y = inputdata$Global_active_power,type="n",ylab ="Global Active Power (kilowatts)",xlab="" )
lines(x = inputdata$datatime,y = inputdata$Global_active_power)
dev.off()