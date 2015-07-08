# set working directory
setwd("/home/cristian/Escritorio/Exploratory Data Analysis Course/projects/project 1/")

# open PNG device; create 'plot2.png'
#png(file = "plot2.png")

# read data
data = read.csv("household_power_consumption.txt", sep=';')

# convert the Date and Time variables to Date/Time classes
data <- transform(data, Date = as.Date(Date, format = "%d/%m/%Y"))

# select data from the dates 2007-02-01 and 2007-02-02
subset <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# transform dates to weekdays
subset["Date"] <- lapply(subset["Date"], FUN=weekdays)


# close the PNG device
#dev.off()