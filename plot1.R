# filename: plot1.R
# objective: plot1.png which contains Global Active Power.
# As per course instructions, the code to load & tidy dataset
# is repeated in all plot code files.


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
# Part II Plotting the required graph: histogram in this case
#####################################

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(rdf$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off() ## Close PNG graphics device


## Code for remove missing values. We don't need to do it right now.
## Written here for completeness.  
##mvlv: missing values logical vector to filter out missing values.
#mvlv<-complete.cases(rds)
#rdswmv<-rds[mvlv,][,]



#============================
# Initial BrainStorming Work.
#============================

#rds<-rdsb

str(rdsb)
rdt<-rds[1:5,]
str(rdt)



# > str(rds$Date) Factor w/ 1442 levels "1/1/2007","1/1/2008",..: 342 342 342
# 342 342 342 342 342 342 342 ... > rds$Date <-as.Date(rds$Date,"%d/%m/%Y") >
# str(rds$Date) Date[1:2075259], format: "2006-12-16" "2006-12-16" "2006-12-16"
# "2006-12-16" "2006-12-16" ...

# Convert DateString to proper Date format
rds$Date <-as.Date(rds$Date,"%d/%m/%Y")
str(rds$Date)


rdsdt$Time<-as.POSIXct(rdsdt$Time,"%H:%M:%S",tz="",usetz=FALSE)
rdsdt$Time <- as.POSIXct(paste(rdsdt$Date, rdsdt$Time), format="%Y-%m-%d %H:%M:%S")


# rm(list='testads')


ss$Date <-as.Date(ss$Date,"%d/%m/%Y")
str(ss)
ss$Time<-as.POSIXct(strptime(ss$Time,ss$Date+"%H:%M:%S",tz=""))
tail(ss$Time,20)
tail(ss$Date,10)

ssf<-ss[ss$Date=="2007-02-01" | ss$Date=="2007-02-02",]

# removing missing values & creating dataset ready for analysis.
ssfwona<-complete.cases(ssf)
ads<-ssf[ssfwona,][,]
# test if any incomplete values.
testads<-sum(complete.cases(ads))
testads
#
names(ads)
str(ads)

head(ssf$Date,20)
tail(ssf$Date,20)
ssf$Date <-as.Date(ssf$Date,%)
rm(list="ssf")
class(ss)
class(ss$Date)
?`|`

tail(ssf,100)

                             