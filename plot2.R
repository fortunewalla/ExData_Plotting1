# filename: plot2.R
# objective: plot2.png which contains Global Active Power.
# As per course instructions, the code to load & tidy dataset
# is repeated in all plot code files.

# >> SKIP TO PART II for graphics code <<<


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
# Part II Plotting the required graph: plot
#####################################

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(rdf$datetime,rdf$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off() ## Don't forget to close the PNG device!
                                                                                                                                                                                                                                                                                