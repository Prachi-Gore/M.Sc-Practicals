
n=c(200,500,700,900,1000); # sample size (row )
theta1=1.5
theta2=3
eps=0.015
est_prob_T1=0
est_prob_T2=0
for(i in 1:length(n)){
  data=runif(n[i]*n[i],theta1,theta2)
  x=matrix(data,n[i],n[i])
  T_1=apply(x,1,min)
  T_2=apply(x,1,max)  
  A1=abs(T_1-theta1)<eps
  A2=abs(T_2-theta2)<eps
  #print(mean(A1))
  est_prob_T1[i]=mean(A1)
  est_prob_T2[i]=mean(A2)
  
}
cbind(n,est_prob_T1,est_prob_T2)