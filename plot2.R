# set working directory
setwd("/home/cristian/Git/coursera/exploratory_data_analysis/")

# set locale to english united states in order
# to use thuesday, friday and saturday instead
# of jueves, viernes y sábado (spanish).
Sys.setlocale("LC_TIME", "en_US.UTF-8")

# open PNG device; create 'plot2.png'
png(file = "plot2.png", height = 480, width = 480)

# read data
data = read.table("household_power_consumption.txt", header = TRUE, sep=';', stringsAsFactors=FALSE)

# convert the Date variable to Date class
data <- transform(data, Date = as.Date(Date, format = "%m/%d/%Y"))

# select data from the dates 2007-01-02 and 2007-02-02
data <- subset(data, Date == "2007-01-02" | Date == "2007-02-02")

# create extracolumn with date and time concatenated
data <- transform(data,  Datetime = strptime(paste(Date, Time), 
                                                 format="%Y-%d-%m %H:%M:%S"))
# transform Globa_active_power to numeric
data <- transform(data, 
                  Global_active_power = as.numeric(as.character(Global_active_power)))

# create the plot
with(data, plot(Datetime, Global_active_power, 
                  type = "l",
                  ylab = "Global active power (kilowatts)",
                  xlab = ""))

# close the PNG device
dev.off()