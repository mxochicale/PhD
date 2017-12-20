require(tseriesChaos)
library(lattice) ##xyplot

# rawdata <- NULL;
# rawdata<-read.csv("pitch_wL1001_imu1_29012015-201358_h.dat", header=TRUE, sep=',');
# X <-rawdata[,]
# rawdata <- NULL;

# temp <- NULL;
# temp<-read.csv("nts.datafile", header=FALSE, sep=' ');
# lts <-temp[,]
# temp <- NULL;
# 
# maxtau <- 100
# b  <- 100
# 
# tsmitemp <- mutual(lts, partitions= b , lag.max = maxtau, plot=FALSE)
# tsmi <- unname(tsmitemp[])
# 


temp <- NULL;
temp <-read.csv("mi_s.mi", header=FALSE, sep=' ');
P <-temp[,]
temp <- NULL;

temp <-read.csv("mi_c.mi", header=FALSE, sep=' ');
C <-temp[,]
temp <- NULL;

temp <-read.csv("mi_r.mi", header=FALSE, sep=' ');
R <-temp[,]
temp <- NULL;




png(filename="mi_values.png", height=900, width=1500,bg="white")
xyplot(  P[,2]  +  C[,2] +  R[,2]~ P[,1],
  pch=16, col.line = c(1:3), type = c("l","g"), lwd=5,
  xlab=list(label= expression(tau) , cex=4),
  ylab=list(label="", cex=4),
  scales=list(font=1, cex=2.5),
  key=list(  
    text = list(c('periodic',
                  'chaotic',
                  'random'
    )
    ),
    lines = list(pch=c(1:3), col= c(1:3) ),
    lwd=5,
    #type="b",
    cex=3, # control the character expansion  of the symbols
    corner=c(0.95,0.95) # position
  ) 
)
dev.off() # Turn off device driver (to flush output to PNG)


# png(filename="MI_values.png", height=900, width=1500,bg="white")
# xyplot( X[,2] +  tsmi[1:maxtau+1] ~ X[,1],
#   pch=16, col.line = c('royalblue', 'red'), type = c("l","g"), lwd=5,
#   xlab=list(label="samples", cex=4),
#   ylab=list(label="", cex=4),
#   scales=list(font=1, cex=2.5)
# )
# dev.off() # Turn off device driver (to flush output to PNG)