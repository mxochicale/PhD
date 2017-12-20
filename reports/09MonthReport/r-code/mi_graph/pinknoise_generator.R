#reference
#http://stackoverflow.com/questions/8697567/how-to-simulate-pink-noise-in-r

library(lattice) ##xyplot

require(tuneR)
p <- noise(kind = c("pink"),duration = 10000, samp.rate = 50)
#par(mfrow=c(2,1))
#plot(w,main="white noise")
#writeWave(w,"p.wav")#writes pink noise on your hard drive
# plot(p,main="pink noise")

pn <- p@left

## 2D plot
xyplot( pn ~ 1:length(pn) ,
        pch=16, col.line = c('royalblue'), type = c("l","g"), lwd=2,
        xlab=list(label="samples", cex=4),
        ylab=list(label="", cex=4),
        scales=list(font=1, cex=2.5)
)

write(pn, file="pinkndata",ncolumns=1)


# require(audio)
# file <- paste(getwd(), "/p.wav", sep = "")
# p.vec <- load.wave( "/home/mapx/Desktop/phd/nonlinear_dynamics_in_R/noises/white_and_pink/p.wav" )


#this will load pink noise as a vector