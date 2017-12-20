#
#
#  State Space Representation on R
#
# 
#  miguel_perez X O C H I C A L E
#  <perez.xochicale AT gmail.com>
#  University of Birmingham, UK
#  
# VERSIONS
# 00 -- poster graphical results
# the 29th of April 2015

#library(scatterplot3d)
require(tseriesChaos)
require(rgl)
library(lattice) ##xyplot

rawdata <- NULL;
data <- NULL;
sdev_pc <- NULL;


setwd(getwd())
files <-list.files(pattern = "\\.dat")

#Non-dancer
nmx <- files[1]
nmy <- files[4]
nmz <- files[7]

#Intermedium
imx <- files[2]
imy <- files[5]
imz <- files[8]

#Expert
emx <- files[3]
emy <- files[6]
emz <- files[9]




# Principal Component Analysis
PCA <- function(Embedded_Matrix, print_flag)
{
  # Center the data so that the mean of each row is 0
  rm=rowMeans(t(Embedded_Matrix));
  X= t(Embedded_Matrix  - t((matrix(rep(rm,dim(Embedded_Matrix)[1]),nrow=dim(Embedded_Matrix)[2]))))
  
  # Covariance Matrix
  E=X %*% t(X)
  Eigen=eigen(E,TRUE)
  
  Evalues = Eigen$values
  P=t(Eigen$vectors) # Principal Components
  
  #sdev_method1= sqrt(Eigen$values)
  #the standard deviations of the principal components 
  singular_values =  sqrt(diag(( 1 /(dim(X)[2]-1)*P%*% E %*% t(P))))
  #(i.e., the square roots of the eigenvalues of the covariance/correlation matrix).
  
  
  # Find the new data ##Rotated data
  rotateddata = P %*% X
  
  
  #Percentage Of Variance 
  POV <- ( Evalues/sum(Evalues) )*100 
  #http://stats.stackexchange.com/questions/31908/what-is-percentage-of-variance-in-pca
  
  #cummulative energy of PCA
  cumEigv <- c(0, cumsum(POV) ) /100
  
  
  ####PRINT C1 C2 C1+C2
  twoPC <- c( POV[1:2], sum(POV[1:2]) )
  
  
  if (print_flag == 1){
    print(singular_values)
  }
  
  #output<-list(  [1] ,      [2]  ,            [3]  ,          [4]  ,      [5],   [6],   [7] )
  output<-list(  P , singular_values  ,  rotateddata  ,   Eigen$values  ,  POV, cumEigv, twoPC )
  return(output)
  
}



# Takens' Theorem
Takens_Theorem <- function(timeserie,dim,tau,print_flag)
{
  timedelayembedded <- embedd(timeserie,  m=dim, d=tau)
  
  if (print_flag == 1){
    print("--------------")
    print(paste("Embedded Parameters:         " ,"m=",dim," t=",tau,sep="" ))
    print(paste("Embedded Matrix dimension:  ",dim(timedelayembedded)[1], 'x' ,dim(timedelayembedded)[2] ) )
  }
  
  return (timedelayembedded)
}

#Sphering the data (whitening)
zeromean_unitvariance <- function (vector)
{
  #   http://stackoverflow.com/questions/8717139/how-to-normalize-a-signal-to-zero-mean-and-unit-variance 
  #zero mean
  rmV <- rowMeans(t(vector))
  #View(rmACC)
  #View(matrix(rep(rmACC,dim(ACC)[1]),nrow=dim(ACC)[2]) ) ## create vectors with the mean
  zmV <- t(vector) - matrix(rep(rmV,dim(vector)[1]),nrow=dim(vector)[2]) 
  #View(WhitenA)
  #return(zmV)
  
  #View(rowMeans(WhitenA))
  #View(sd(WhitenA))                     # apply the sd function 
  sd_zmV <- sd(zmV)
  zmuv <- zmV/sd_zmV
  return( t(zmuv)  )
  
}

#Plot Cumulative Energy for Expert, Intermediate and Nondancer users
Plot_Cumulative_Energy<-function(e_cum,i_cum,n_cum, dimension){
  
ploting <-  
    xyplot(e_cum + i_cum + n_cum +c (0:dimension)/dimension ~  c(0:dimension),
           col.line = c("red","blue","green3","black"), type = c("b"), lwd=4, lty=c(2,3,4,1),
           pch=1:4,cex=3, # control the characther expansion for characters     
           main=list(label="", cex=2.5),
           xlab=list(label="Eigenvalue number",font=2, cex=1.5),
           ylab=list(label="Cumulative Energy %",font=2, cex=1.5),
           grid = TRUE,
           scales=list(font=1, cex=1.5,
                       y=list(at=seq(0,1,.5)),x=list(at=seq(0,dimension,1))  ),
           
           key=list(
             text = list(c(expression("Expert"), 
                           expression("Intermedium"),
                           expression("Non-dancer")
             ), cex=2 ),
             corner=c(0.95,0.05), # position
             lines = list(pch=c(1:3), col= c('red','blue','green3') ),
             type="b", lwd=6,lty=c(2,3,4),
             cex=3 # control the character expansion  of the symbols
           )
    )
  
  
  
  print(ploting)  
  
}




raw_emz <- read.csv(paste(emz,"",sep=""),header = FALSE, sep='')
w_emz <- zeromean_unitvariance(raw_emz)

embeddedmatrix_emz <- Takens_Theorem(w_emz,10,1,1)
pcamatrix_emz <- PCA(embeddedmatrix_emz,0)

filenameimage <- paste("ssr_ep0",".png",sep="") 
png(filenameimage, width=2600, height=2600, units="px", res=200,bg = "transparent")
xyplot(pcamatrix_emz[[3]][1,] ~ -pcamatrix_emz[[3]][2,],
       type = c("l","g"), lwd=10, col="black",
       xlab=list(label="-PC2", cex=4),
       ylab=list(label="PC1", cex=4),
       grid = FALSE,
       scales=list(font=1, cex=3, y=list(at=seq(-6,6,2),limits=c(-6.5,6.5)),x=list(at=seq(-5,5,2),limits=c(-5.5,5.5)) ),
       abline=list(h=0,v = 0,lwd=4,lty=2)
       )
dev.off()





raw_imz <- read.csv(paste(imz,"",sep=""),header = FALSE, sep='')
w_imz <- zeromean_unitvariance(raw_imz)

embeddedmatrix_imz <- Takens_Theorem(w_imz,10,1,1)
pcamatrix_imz <- PCA(embeddedmatrix_imz,0)

filenameimage <- paste("ssr_ip0",".png",sep="") 
png(filenameimage, width=2600, height=2600, units="px", res=200,bg = "transparent")
xyplot(pcamatrix_imz[[3]][1,] ~ -pcamatrix_imz[[3]][2,],
       type = c("l","g"), lwd=10, col="blue",
       xlab=list(label="-PC2", cex=4),
       ylab=list(label="PC1", cex=4),
       grid = FALSE,
       scales=list(font=1, cex=3, y=list(at=seq(-6,6,2),limits=c(-6.5,6.5)),x=list(at=seq(-5,5,2),limits=c(-5,5)) ),
       abline=list(h=0,v = 0,lwd=4,lty=2),
       trellis.par.set("axis.line",list(col="black",lty=1,lwd=4))
       )
dev.off()





raw_nmz <- read.csv(paste(nmz,"",sep=""),header = FALSE, sep='')
w_nmz <- zeromean_unitvariance(raw_nmz)

embeddedmatrix_nmz <- Takens_Theorem(w_nmz,10,1,1)
pcamatrix_nmz <- PCA(embeddedmatrix_nmz,0)

filenameimage <- paste("ssr_np0",".png",sep="") 
png(filenameimage, width=2600, height=2600, units="px", res=200,bg = "transparent")
xyplot(pcamatrix_nmz[[3]][1,] ~ pcamatrix_nmz[[3]][2,],
       type = c("l","g"), lwd=10, col="green3",
       xlab=list(label="PC2", cex=4),
       ylab=list(label="PC1", cex=4),
       grid = FALSE,
       scales=list(font=1, cex=3, y=list(at=seq(-6,6,2),limits=c(-6.5,6.5)),x=list(at=seq(-5,5,2),limits=c(-5,5)) ),
       abline=list(h=0,v = 0,lwd=4,lty=2),
       trellis.par.set("axis.line",list(col="black",lty=1,lwd=4))
)
dev.off()




Plot_Cumulative_Energy(pcamatrix_emz[[6]],pcamatrix_imz[[6]],pcamatrix_nmz[[6]],10)
