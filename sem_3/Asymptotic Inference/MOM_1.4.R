n=c(2300,2600,4000,5000,6000,8000,10000); 

lambda=2
eps=0.05
est_prob_T1=est_prob_T2=0
for (i in 1:length(n)) {
  y=runif(n[i]*n[i],0,1)
  x=(1-y)^(-1/lambda) # sample from pareto
  x=matrix(x,n[i],n[i])
  T1=apply(x,1,mean)
  T1=T1/(T1-1)
  z=log(x)
  T2=apply(z,1,mean)
  T2=1/T2
  est_prob_T1[i]=mean(abs(T1-lambda)<eps)
  est_prob_T2[i]=mean(abs(T2-lambda)<eps)
  
}
cbind(n,est_prob_T1,est_prob_T2)

