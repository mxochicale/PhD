#
#  Displaying the SSR
# 
#  Miguel Perez-Xochicale <perez.xochicale AT gmail.com>
#  University of Birmingham, UK
#  the 7th of August 2015
#

#functions
source('/home/mapx/Desktop/phd/nonlinear_dynamics_in_R/functions/functions00.R')

require(tseriesChaos)
require(rgl)
library(lattice) ##xyplot

rawdata <- NULL;
data <- NULL;
sdev_pc <- NULL;

# username <- "cristian"
# pattern_number <- "pattern2"
# window <- 400:900;
#now <- Sys.time()

##############
## Pattern 2Time difference of 3.038039 mins
#####

#If you want to change your working directory to a subdirectory,
#then you can simply do this:
#setwd(paste(getwd(),"/",username,sep=""))  ; # set and get the current working directory
setwd(getwd())  ; # set and get the current working directory
##list all files with a specific extension
files <-list.files(pattern = "\\.dat")

expert_p0_mz <- files[1]
expert_p2_my <- files[2]

interm_p0_mz <- files[3]
interm_p2_my <- files[4]

novice_p0_mz <- files[5]
novice_p2_my <- files[6]


#datasensornumber <- expert_p0_mz
#datasensornumber <- interm_p0_mz
datasensornumber <- novice_p0_mz

#datasensornumber <- expert_p2_my
#datasensornumber <- interm_p2_my
#datasensornumber <- novice_p2_my


rawdata<-read.csv(paste(datasensornumber,"",sep=""),header = FALSE, sep='');

zmv <- zeromean_unitvariance(rawdata);

Ezmv  <- Takens_Theorem(zmv,10,6,0);

PC <- PCA(Ezmv,0)

#Plot_3D_State_Space(PC[[3]][1,],PC[[3]][2,],PC[[3]][3,],10,6, 'red')
 
filenameimage <- paste("rss",".png",sep="") 
png(filenameimage, width=2000, height=2000, units="px", res=200,bg = "transparent")
Plot_2D_State_Space(PC[[3]][2,], -PC[[3]][1,])
dev.off()


       

  


# State_Space_Iteration(rawdata, 'black'  ,substr(datasensornumber,1,15),'')
# 
# 
# 
# 
# 
# 
# 
# 
# #################################################################
# RSS_iteration <- function(datasensornumber){
# 
#   
# rawdata<-read.csv(paste(datasensornumber,"",sep=""),header = FALSE, sep='');
# #rawdata<-read.csv(paste(datasensornumber,"",sep=""), sep=',');
# #N <- nrow(rawdata); #get the number of rows of the data file
# #window <- 0:N;
# # #window <- 200:600;
# # window <- 300:900;
# 
# # wL <- length(window); #get the number of rows of the data file
# # data$sample <- rawdata$Sample[window];
# # data$ax <- rawdata$ACCX[window];
# # data$ay <- rawdata$ACCY[window];
# # data$az <- rawdata$ACCZ[window];
# # data$am <- sqrt(data$ax^2 + data$ay^2 + data$az^2 );
# # data$mx <- rawdata$MAGX[window];
# # data$my <- rawdata$MAGY[window];
# # data$mz <- rawdata$MAGZ[window];
# # data$mm <- sqrt(data$mx^2 + data$my^2 + data$mz^2 );
# # data$gx <- rawdata$GYRX[window];
# # data$gy <- rawdata$GYRY[window];
# # data$gz <- rawdata$GYRZ[window];
# # data$gm <- sqrt(data$gx^2 + data$gy^2 + data$gz^2 );
# # write(data$ey, file = paste("yaw_wL",wL,"_",filename,".dat",sep=""), ncolumns=1)
# 
# 
# # 
# # 
# # #If you want to move back up to the parent directory, the type
# # 
# # 
# # dir.create("plots")
# # setwd(paste(getwd(),"/plots",sep=""))  ; # set and get the current working directory
# # 
# # dir.create(pattern_number)
# # setwd(paste(getwd(),"/",pattern_number,sep=""))  ; # set and get the current working directory
# # 
# # #imu number directory
# # dir.create(substr(datasensornumber,1,4))
# # setwd(paste(getwd(),"/",substr(datasensornumber,1,4),sep=""))  ; # set and get the current working directory
# # 
# # 
# # dir.create("pdfs")
# # setwd(paste(getwd(),"/pdfs",sep=""))  ; # set and get the current working directory
# # 
# # 
# # 
# # 
# # 
# # 
# # #  
# # State_Space_Iteration(data$ax, 'red'  ,substr(datasensornumber,1,4),'ax')
# # State_Space_Iteration(data$ay, 'blue' ,substr(datasensornumber,1,4),'ay')
# # State_Space_Iteration(data$az, 'green',substr(datasensornumber,1,4),'az')
# # 
# # # 
# # State_Space_Iteration(data$mx, 'red'  ,substr(datasensornumber,1,4),'mx')
# # State_Space_Iteration(data$my, 'blue' ,substr(datasensornumber,1,4),'my')
# # State_Space_Iteration(data$mz, 'green',substr(datasensornumber,1,4),'mz')
# # 
# # State_Space_Iteration(data$gx, 'red'  ,substr(datasensornumber,1,4),'gx')
# # State_Space_Iteration(data$gy, 'blue'  ,substr(datasensornumber,1,4),'gy')
# # State_Space_Iteration(data$gz, 'green'  ,substr(datasensornumber,1,4),'gz')
# # 
# # 
# # #If you want to move back up to the parent directory, the type
# # 
# # setwd("../") #back to imu number
# # setwd("../") #back to plots
# # setwd("../") #back to pattern number
# # setwd("../") #back to user
# 
# 
# #getwd()
# }
# 
# 
# 
# 
# 
# 
# #########################################
# ##  Main
# 
# 
# #RSS_iteration(filename_imu0,window)
#   ##RSS_iteration(filename_imu1,window)
# #RSS_iteration(filename_imu2,window)
# #RSS_iteration(filename_imu3,window)
# 
# 
# 
# 
# #setwd("../") #back to users
# 
# 
# #then <- Sys.time()
# #then-now
