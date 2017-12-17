library(lubridate)
library(dplyr)

# Read data
df <- read.table(unz('exdata_data_household_power_consumption.zip',
                     'household_power_consumption.txt'),
                 sep=';',
                 header=TRUE,
                 na='?',
                 colClasses = c(rep("character", 2), rep("numeric", 7)))

df <- filter(df, Date=='1/2/2007' | Date=='2/2/2007')

# Plot graph
png(filename = "plot1.png", width = 504, height = 504, units = "px")
hist(df$Global_active_power,
     col='red',
     breaks=12,
     main='Global Active Power',
     xlab='Global Active Power (kilowatts)')
dev.off()