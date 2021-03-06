# filename: plot3.R
# objective: plot3.png which contains Global Active Power.
# As per course instructions, the code to load & tidy dataset
# is repeated in all plot code files.

# >> SKIP DIRECTLY TO PART II for graphics code <<<


#####
# Part I Loading the data
# 
# When loading the dataset into R, please consider the following:
# * The dataset has 2,075,259 rows and 9 columns. 
# * Only be using data from the dates 2007-02-01 and 2007-02-02. 
# * Convert the Date and Time variables to Date/Time
#   classes in R using the strptime() and as.Date() functions.
# * Note that in this dataset missing values are coded as ?.

#####
# Part II Making Plots
# 
# * Fork and clone: https://github.com/rdpeng/ExData_Plotting1
# * Construct plot & save to PNG file with a width & height of 480 px
# * Name each of the plot files as plot1.png, plot2.png, etc.
# * Create a separate R code file (plot1.R, plot2.R, etc.). Your code 
#   file should include code for reading data so that the plot can be
#   fully reproduced. Include code that creates the PNG file.
# * Add the PNG file and R code file to your git repository
# * Push your git repository to GitHub. There should be
#   four PNG files and four R code files.

###################################
# Part I Load and tidy raw data set
###################################

# Setting Work Directory
setwd('./ExData_Plotting1/')

# Download & uncompress data set into ExData_Plotting1
# household_power_consumption.txt [approx. 126MB]
# properly read into a data frame.
rds<-read.table('household_power_consumption.txt',header=TRUE,sep=";",na.strings="?")
dim(rds) #[1] 2075259       9 ## Dimension same as original raw file.

# Make a backup of rds dataframe & store in memory.
rdsb<-rds

# Convert rds$Date into Proper Date format 
# & rds$Time into POSIXct Date/time format
rds$Time <- as.POSIXct(paste(rds$Date, rds$Time), format="%d/%m/%Y %H:%M:%S")
rds$Date <-as.Date(rds$Date,"%d/%m/%Y")

str(rds) #check structure

# raw data set filtered between date range  2007-02-01 and 2007-02-02.
rdf<-rds[rds$Date=="2007-02-01" | rds$Date=="2007-02-02",]

# To match exactly with column names on the plots, rename rdf$Time to rdf$datetime
# not necessary but it avoids xlab= in the plotting later.
colnames(rdf)[2] <- "datetime"

#####################################
# Part II Plotting the required graph: 2X2 plot
#####################################

png(filename = "plot4.png", width = 480, height = 480, units = "px")
# mfrow:creates 2X2 matrix for figures.
# mar: spacing in each figure - bottom,left,top,right
# oma: outer margin - bottom, left, top, right
# cex: text size in axis.
# All parameters found through trial/error to try to match original.
par(mfrow = c(2, 2), mar = c(4, 4,3, 2),oma=c(1,0,1,0),cex=0.9)
# 1 original plot2
plot(rdf$datetime,rdf$Global_active_power,type="l",xlab="",ylab="Global Active Power")
# 2 Voltage vs. datetime
with(rdf,plot(datetime,Voltage,type="l"))
# 3 original plot3
with(rdf,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(rdf,lines(datetime,Sub_metering_2,col="red"))
with(rdf,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",cex=0.9,lty=1,bty="n",x.intersp=.9,y.intersp=.9,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
# 4 Global reactive power vs. datetime
with(rdf,plot(datetime,Global_reactive_power,type="l"))


dev.off() ## Don't forget to close the PNG device!

#============================
# Initial BrainStorming Work.
#============================

# png(filename = "plot33.png", width = 480, height = 480, units = "px")
# 
# #par(mfrow = c(1, 3), mar = c(4, 4, 2, 1), oma = c(2, 0, 1, 0),mgp=c(3,1,4))
# 
# par(mfrow = c(2, 2), mar = c(4, 4,3, 2),oma=c(1,0,1,0),cex=0.9)
# #1 original plot2
# plot(rdf$datetime,rdf$Global_active_power,type="l",xlab="",ylab="Global Active Power")
# #2 Voltage 
# with(rdf,plot(datetime,Voltage,type="l"))
# 
# # 3 original plot3
# #plot(rdf$Time,rdf$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
# #plot(rdf$Time,rdf$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
# with(rdf,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
# with(rdf,lines(datetime,Sub_metering_2,col="red"))
# with(rdf,lines(datetime,Sub_metering_3,col="blue"))
# #legend("topright",type="l",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
# legend("topright",cex=0.9,lty=1,bty="n",x.intersp=.9,y.intersp=.9,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
# 
# #4 Global reactive power
# #1 original plot2
# with(rdf,plot(datetime,Global_reactive_power,type="l"))
# 
# 
# dev.off() ## Don't forget to close the PNG device!
                                                                                                                                                                                                                                                          