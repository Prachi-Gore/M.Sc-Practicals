x1=c(1,0,0,0,1,0,0,0)
x2=c(0,1,0,0,1,0,0,0)
x3=c(0,0,1,0,1,0,0,0)
x4=c(0,0,0,1,0,1,0,0)
x5=c(0,0,0,1,0,0,1,0)
x6=c(0,0,1,0,0,0,1,0)
x7=c(0,1,0,0,0,0,0,1)
x8=c(0,0,0,1,0,0,0,1)
X=matrix(c(x1,x2,x3,x4,x5,x6,x7,x8),nrow = 8,byrow = TRUE);X #Designed Matrix
r=qr(X)$rank # library(Matrix) rankMatrix(x)
n=8 # no.of response variable
rError=n-r # rank of error space
S=t(X)%*%X;S # t:transpose ,matrix multiplication
library(MASS) # for G-inverse
G=ginv(S)
H=G%*%S
#To check estimabilty of i)theta2-theta4,ii)
l1=c(0,1,0,-1,0,0,0,0);l2=c(1,1,1,0,3,0,0,0)
l=list(l1,l2)
for(i in l){
  print(i)
  lH=round(i%*%H)    #zapsmall
  if(all(i==lH)){    #checking equality of two vectors
    print('Yes,it is Estimable')
  }else{
    print('No,it is not Estimable')
  }
}
# c)
# To find two different solutions to normal equations
Y=matrix(c(60.2,74.39,77.88,94.75,81.47,99.34,111.86,127.68),8,1)
beta_hat=G%*%t(X)%*%Y
z=matrix(c(0,1,0,0.5,0,0,1,0),8,1)
beta_tilda=beta_hat+(diag(8)-H)%*%z
t(l1)%*%beta_hat
t(l1)%*%beta_tilda
