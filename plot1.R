#Global Active Power histogram


#reading data
setwd("C:/Users/Administrador/Desktop/datasciencecoursera/ExData_Plotting1")
DT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

#plot histogram

#Type of column=date
DT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
#filter dates
DT <- DT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#png device
png("plot1.png", width=480, height=480)

hist(DT[,Global_active_power], main="Global Active Power", xlab="Global Active Power", col="Red" )

#close device
dev.off()