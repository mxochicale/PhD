
library(lattice) ##xyplot

source('/home/map479/mxochicale/phd/nonlinear_dynamics_in_R/functions/functions00.R')


rawdata<-read.csv("imu0_16072015-135711.csv", header=TRUE, sep=',');

x <-rawdata[,10]
rawdata <- NULL;

zmuv_x <- zeromean_unitvariance( x )

xyplot( zmuv_x ~ 1:length( zmuv_x) , 
        pch=16, col.line = c('royalblue'), type = c("l","g"), lwd=5,
        xlab=list(label="samples", cex=4),
        ylab=list(label="rawdata", cex=4),
        scales=list(font=2, cex=1.5),# size of the number labels from the x-y axes
)