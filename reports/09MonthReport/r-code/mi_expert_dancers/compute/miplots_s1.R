library(lattice) ##xyplot

temp <- NULL;
temp <-read.csv("mx_s1.mi", header=FALSE, sep=' ');
mx <-temp[,]
temp <- NULL;
temp <-read.csv("my_s1.mi", header=FALSE, sep=' ');
my <-temp[,]
temp <- NULL;
temp <-read.csv("mz_s1.mi", header=FALSE, sep=' ');
mz <-temp[,]
temp <- NULL;


png(filename="MI_s1.png", height=500, width=1500,bg="white")
xyplot( mx[,2] +my[,2]+mz[,2]  ~ mx[,1],
  pch=16, col.line = c('royalblue', 'red', 'green'), type = c("l","g"), lwd=5,
  xlab=list(label="samples", cex=4),
  ylab=list(label="", cex=4),
  scales=list(font=1, cex=2.5,
              y=list(limits=c(0.9,3.1)),
              x=list(at=seq(0,50,5))  ),
  key=list(
    text = list(c(expression("mx"), 
                  expression("my"),
                  expression("mz")), cex=3 ),
    corner=c(0.9,0.1), # position
    lines = list( col= c('royalblue', 'red', 'green') ), lwd=6,
    cex=3 # control the character expansion  of the symbols
  ),
  abline=list(v=5,lwd=3,lty=3)
)
dev.off() # Turn off device driver (to flush output to PNG)


