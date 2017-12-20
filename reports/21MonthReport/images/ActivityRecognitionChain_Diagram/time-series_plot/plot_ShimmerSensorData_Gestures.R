#
#  Displaying the time series data
#  from Shimmer3 IMU
# 

#   > Miguel Perez-Xochicale <perez.xochicale AT gmail.com>
#   > Doctoral Researcher in Human-Robot Interaction
#   > University of Birmigham, U.K. (2014-2017)
#   > https://twitter.com/mperezxochicale
#
#  March 2016
#


MAINPATH <- getwd()

#LOAD FUNCTIONS
#source("~/mxochicale/phd/r-code/functions/functions.R")
source("~/mxochicale/phd/r-code/functions/functions_inertial_sensors.R")



details = file.info(list.files(pattern="*.csv"))
details = details[with(details, order(as.POSIXct(mtime))), ]
files = rownames(details)


datafilename <- files[ 1 ]

data <- get_ShimmerSensorData(datafilename)


pathfilename <- substr(datafilename, 1, 24)



mainDir <- getwd()
subDir <- paste( "plots_", pathfilename, sep=""  )  
  

if (file.exists(subDir)){
  setwd(file.path(mainDir, subDir))
} else {
  dir.create(file.path(mainDir, subDir))
  setwd(file.path(mainDir, subDir))  
}


default_min_sample <- 0
default_max_sample <- dim(data)[1]
default_windowframe <- default_min_sample:default_max_sample;


gaussiannoise <- rnorm( dim(data)[1], mean = 0, sd = 1500)   
#gaussiannoise <- rnorm( dim(data)[1], mean = 0, sd = 00)   
data[,5] <- data[,5] + gaussiannoise

default_windowframe <- 1050:1160;



############################################################
####                      PLOTS
############################################################

#data[,3]
#datanoise <- data[,3] + gaussiannoise
 
png(file = paste( "plot_",pathfilename, ".png", sep=""), width = 1500, height = 900, units = "px", bg = "transparent")


plot = xyplot(  data[default_windowframe,5] ~ default_windowframe,
                pch=16, col.line = c('blue', 'blue', 'yellow3'), type = c("l","g"), lwd=40,
                main=list(label=paste( " ",sep=""), cex=2.5),
                xlab=list(label="", cex=3, fontfamily="Times"),
                ylab=list(label="", cex=3, fontfamily="Times"),
                scales=list(axs='i',draw=FALSE, x=list(at=NULL), y=list(at=NULL)),# http://stackoverflow.com/questions/18498349/how-to-hide-x-axis-in-lattice-r
                par.settings= list(axis.line = list(col = 0)), #http://grokbase.com/t/r/r-help/124rrkjdyd/r-remove-top-right-border-from-lattice-plots
                grid = FALSE 
                

)

print(plot)

dev.off()



setwd(paste(MAINPATH,"",sep="")); # set and get the current working directory
