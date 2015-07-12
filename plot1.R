# set working directory
setwd("/home/cristian/Git/coursera/exploratory_data_analysis/")

# open PNG device; create 'plot1.png'
png(file = "plot1.png", height = 480, width = 480)

# read data
data = read.table("household_power_consumption.txt", header = TRUE, sep=';', stringsAsFactors=FALSE)

# convert the Date variable to Date class
data <- transform(data, Date = as.Date(Date, format = "%m/%d/%Y"))

# select data from the dates 2007-01-02 and 2007-02-02
data <- subset(data, Date == "2007-01-02" | Date == "2007-02-02")

# transform Globa_active_power to numeric
data <- transform(data, 
                  Global_active_power = as.numeric(as.character(Global_active_power)))

# plot histogram
hist(data$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     xlim = c(0, 6.5),
     col = "red")

# close the PNG device
dev.off()