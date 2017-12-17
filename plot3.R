library(lubridate)
library(dplyr)
library(tidyr)

# Read data
df <- read.table(unz('exdata_data_household_power_consumption.zip',
                     'household_power_consumption.txt'),
                 sep=';',
                 header=TRUE,
                 na='?',
                 colClasses = c(rep("character", 2), rep("numeric", 7)))

df <- filter(df, Date=='1/2/2007' | Date=='2/2/2007')
df <- mutate(df, datetime=dmy_hms(paste(Date, Time)))
# df<- gather(df, key='meter_number', value='energy_sub_metering', Sub_metering_1, Sub_metering_2, Sub_metering_3)

# Plot graph
png(filename = "plot3.png", width = 504, height = 504, units = "px")
plot(df$datetime, df$Sub_metering_1, type='l', xlab='', ylab='Energy syb metering', col='black')
lines(df$datetime, df$Sub_metering_2, col='red')
lines(df$datetime, df$Sub_metering_3, col='blue')
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
dev.off()