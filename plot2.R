#Global Active Power plot (thu-sat)


#reading data
setwd("C:/Users/Administrador/Desktop/datasciencecoursera/ExData_Plotting1")
DT <- data.table::fread(input = "household_power_consumption.txt"
                        , na.strings="?"
)

DT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
DT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
#filter dates
DT <- DT[(dateTime >= "2007-02-01") & (dateTime <= "2007-02-03")]

#png device
png("plot2.png", width=480, height=480)

plot(x=DT[,dateTime], y=DT[,Global_active_power], type="l", xlab="")

#close device
dev.off()
