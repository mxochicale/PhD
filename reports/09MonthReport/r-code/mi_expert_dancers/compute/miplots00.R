library(lattice) ##xyplot

temp <- NULL;
temp <-read.csv("my_s2.mi", header=FALSE, sep=' ');
X <-temp[,]
temp <- NULL;


png(filename="MI_values.png", height=500, width=1500,bg="white")
xyplot( X[,2]  ~ X[,1],
  pch=16, col.line = c('royalblue', 'red'), type = c("l","g"), lwd=5,
  xlab=list(label="samples", cex=4),
  ylab=list(label="", cex=4),
  scales=list(font=1, cex=2.5,
              y=list(limits=c(0.9,3.1))
  )  
  
)
dev.off() # Turn off device driver (to flush output to PNG)


