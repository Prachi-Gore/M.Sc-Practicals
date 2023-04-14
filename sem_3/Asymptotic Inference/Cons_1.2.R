# to conduct simulation study from Unif distn


n=c(100,200,300,400,600); # sample size (row )
m=1000;# sample size of each sample(col)
theta=1.5
eps=0.05
est_prob_T1=0
est_prob_T2=0
est_prob_T3=0
MSE_T1=0
MSE_T2=0
MSE_T3=0

for(i in 1:length(n)){
  data=runif(n[i]*m,0,theta)
  x=matrix(data,n[i],m)
  T_1=apply(x,2,max)
  T_2=apply(x,2,mean)  
  T_3=2*T_2
  A1=abs(T_1-theta)<eps
  A2=abs(T_2-theta)<eps
  A3=abs(T_3-theta)<eps
  #print(mean(A1))
  est_prob_T1[i]=mean(A1)
  est_prob_T2[i]=mean(A2)
  est_prob_T3[i]=mean(A3)
  MSE_T1=mean((T_1-theta)^2)
  MSE_T2=mean((T_2-theta)^2)
  MSE_T3=mean((T_3-theta)^2)
  
}
cbind(n,est_prob_T1,est_prob_T2,est_prob_T3)
cbind(n,MSE_T1,MSE_T2,MSE_T3)
