require(tseriesChaos)
library(lattice) ##xyplot

# rawdata <- NULL;
# rawdata<-read.csv("pitch_wL1001_imu1_29012015-201358_h.dat", header=TRUE, sep=',');
# X <-rawdata[,]
# rawdata <- NULL;

temp <- NULL;
temp<-read.csv("pinkndata", header=FALSE, sep=' ');
lts <-temp[,]
temp <- NULL;

maxtau <- 100
b  <- 100

tsmitemp <- mutual(lts, partitions= b , lag.max = maxtau, plot=FALSE)
tsmi <- unname(tsmitemp[])



temp <- NULL;
temp <-read.csv("r.mi", header=FALSE, sep=' ');
X <-temp[,]
temp <- NULL;


png(filename="MI_values.png", height=900, width=1500,bg="white")
xyplot( X[,2] +  tsmi[1:maxtau+1] ~ X[,1],
  pch=16, col.line = c('royalblue', 'red'), type = c("l","g"), lwd=5,
  xlab=list(label="samples", cex=4),
  ylab=list(label="", cex=4),
  scales=list(font=1, cex=2.5)
)
dev.off() # Turn off device driver (to flush output to PNG)