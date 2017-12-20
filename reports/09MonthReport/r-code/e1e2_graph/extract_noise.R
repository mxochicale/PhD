#
#  Structural Noise 
#  Hammmerla et. al 2011
# 
#  Miguel P. Xochicale <perez.xochicale AT gmail.com>
#  Doctoral Researcher in Human-Robot Interaction
#  University of Birmingham, UK
#
#  the 26th of May 2015

##################################################
library(lattice) # for xyplot
require(tseriesChaos)

source('/home/map479/mxochicale/phd/nonlinear_dynamics_in_R/functions/functions00.R')


timeserie.structural.noise <- function(time.serie.function, basefrequency, bf.sd, ts, wl,an.sd) {
  
  ns <- round( length(ts) /wl) # Number of Structures
  print( length(ts) /wl  )
  
  S_i <- character()
  for (i in 1:ns)
  {    
    randomfrec <- abs (rnorm(1, mean = basefrequency, sd = bf.sd) )     
    u_i <- 2*pi*randomfrec
    
    a.n <-  rnorm(wl, mean = 0, sd = an.sd) 
    
    S_i <- append( S_i, (u_i*sapply(ts[1:wl], function(t) time.serie.function(t,u_i)) )+a.n  )
    
  }
  return(S_i)
}


plot.timeserie <- function(time.serie, ts) {
plot <- xyplot(time.serie ~ ts,
  pch=16, col.line = c('royalblue'), type = c("l","g"), lwd=5,
  xlab=list(label="time", cex=4),
  ylab=list(label="f(t)", cex=4),
  scales=list(font=1, cex=3,
                   y=list(at=seq(-2,2,1),limits=c(-4,4))
                   #x=list(at=seq(-2,2,1),limits=c(-2.1,2.1))
       )
  )
print(plot)  
 }


###########################################
acq.freq <- 50                    # data acquisition (sample) frequency (Hz)
time     <- 40#200                    # measuring time interval (seconds)
ts       <- seq(0,time-1/acq.freq, 1/acq.freq) # vector of sampling time-points (s) 

dc.component <- 0
frequency <- 1/8      # frequency of signal component (Hz)
delay <- 0            # delay of signal component (radians)

wl <- 2000         # window lenght
freq.sd <- 0.0000001   # strunctural noise -- frequency standard deviation 
ad.sd <- 1000     # additive noise standard deviation


func   <- function(t,w) { 
   dc.component +   sin(w*t + delay) 
}

tts <- timeserie.structural.noise(func, frequency, freq.sd, ts, wl,ad.sd) 

x <- as.matrix(as.numeric(tts))
zmuv_x <- zeromean_unitvariance(  x )
plot.timeserie(zmuv_x, ts)

write(zmuv_x, file="nts.datafile",ncolumns=1)

# 
# dim <- 15
# tau <- 1
# 
# Embedded_Matrix <-Takens_Theorem (t(xw),dim,tau,   0)
# PCAMatrix_PC <- PCA(Embedded_Matrix, 0)
# Plot_State_Space(PCAMatrix_PC[[3]][1,],PCAMatrix_PC[[3]][2,],PCAMatrix_PC[[3]][3,],dim,tau, 'royalblue')
# 
