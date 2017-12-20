

source('/home/map479/mxochicale/phd/nonlinear_dynamics_in_R/functions/functions00.R')


a=10; r=28; b=8/3; dt=0.01
X=0.01; Y=0.01; Z=0.01
n=10000
XYZ=array(0,dim=c(n,3))
t=0

for(i in 1:n)
{
  X1=X; Y1=Y; Z1=Z
  
  X=X1+(-a*X1+a*Y1)*dt
  Y=Y1+(-X1*Z1+r*X1-Y1)*dt
  Z=Z1+(X1*Y1-b*Z1)*dt
  #t=t+dt
  XYZ[i,]=c(X,Y,Z)
}


framewindow <- 000:2000;
  
x=XYZ[framewindow,1]
y=XYZ[framewindow,2]
z=XYZ[framewindow,3]

zmuv_x <- zeromean_unitvariance(  x )
plot.ts(zmuv_x)
write(zmuv_x, file="lts.datafile",ncolumns=1)

