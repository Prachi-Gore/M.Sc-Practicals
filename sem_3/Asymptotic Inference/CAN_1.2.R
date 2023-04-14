lambda=3;
n=c(1000,1500,2000);
eps=0.1;
est_prob_T1=est_prob_T2=0
for (i in 1:length(n)) {
  data=rpois(n[i]*n[i],lambda)
  x=matrix(data,n[i],n[i])
  T1=apply(x,1,mean)
  T2=apply(x,1,var)
  A1=abs(T1-lambda)<eps
  A2=abs(T2-lambda)<eps
  est_prob_T1[i]=mean(A1)
  est_prob_T2[i]=mean(A2)
  
  
}
cbind(n,est_prob_T1,est_prob_T2)
par(mfrow=c(2,2))
hist(T1);qqnorm(T1)
hist(T2);qqnorm(T2)