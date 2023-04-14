n=c(100,200,300,400,600,800);
theta=2.5 # rate
eps=0.01
est_prob_T1=0
est_prob_T2=0
for(i in 1:length(n)){
  y=matrix(runif(n[i]*n[i],0,1),n[i],n[i])
  x=theta-log(1-y)
  
  T1=apply(x,2,min) 
  T2=apply(x,2,mean)
  T2=T2-1
  
  
  A1=abs(T1-theta)<eps
  A2=abs(T2-theta)<eps
  
  #print(mean(A1))
  est_prob_T1[i]=mean(A1)
  est_prob_T2[i]=mean(A2)
  
  
}
cbind(n,est_prob_T1,est_prob_T2)