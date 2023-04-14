n1=4;n2=5; n3=6 ;n4=4
n=n1+n2+n3+n4
x1=c(rep(1,n))
x2=c(rep(1,n1),rep(0,n-n1))
x3=c(rep(0,n1),rep(1,n2),rep(0,n-n1-n2))
x4=c(rep(0,n1+n2),rep(1,n3),rep(0,n4))
x5=c(rep(0,n1+n2+n3),rep(1,n4))
X=cbind(x1,x2,x3,x4,x5)
S=t(X)%*%X
library(Matrix)
r=rankMatrix(X)
r=r[1]
library(MASS)
G=ginv(S)
y1=c(1020,1010,1030,1000)
y2=c(1030,1040,1050,1030,1060)
y3=c(990,980,970,960,970,980)
y4=c(1040,1050,1030,1070)
Y=matrix(c(y1,y2,y3,y4),nrow = n)
beta_hat=G%*%t(X)%*%Y
Y_hat=X%*%beta_hat
e=Y-Y_hat  # residual
SSE=t(e)%*%e
SSTreat=t(beta_hat)%*%t(X)%*%Y-n*mean(Y)^2
TSS=t(Y)%*%Y-n*mean(Y)^2
MSTret=SSTreat/(r-1)
MSE=SSE/(n-r)
F_cal=MSTret/MSE;F_cal
qf(0.05,r-1,n-r,lower.tail = F)# table value

boxplot(y1,y2,y3,y4)
factor=c(rep("R1",n1),rep("R2",n2),rep("R3",n3),rep("R4",n4))
data=data.frame(Y,factor)

