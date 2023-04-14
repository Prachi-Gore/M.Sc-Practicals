rm(list = ls(all=T))
a=1.4;
b=1.2;
eps=0.1
est_prob_T1=0
est_prob_T2=0
est_a=0
est_b=0
bias_a=bias_b=0
n=c(750,1000,1500,2000,2500)
for (i in 1:length(n)) {
  x=matrix(rbeta(n[i]*n[i],a,b),n[i],n[i]) 
  m1=apply(x,2,mean)
  m2=apply(x^2,2,mean)
  T1=m1*(m1-m2)/(m2-m1^2);# estimator of a
  T2=(m2-m1)*(m1-1)/(m2-m1^2);# estimator of b
  est_a[i]=mean(T1)
  est_b[i]=mean(T2)
  bias_a[i]=est_a[i]-a;
  bias_b[i]=est_b[i]-b;
  
  
  est_prob_T1[i]=mean(abs(T1-a)<eps)
  est_prob_T2[i]=mean(abs(T2-b)<eps)
  
}
cbind(n,est_a,bias_a,est_b,bias_b)
cbind(n,est_prob_T1,est_prob_T2)
# to check asymptotic dist
par(mfrow=c(2,1))
hist(T1)  # when n is large
hist(T2)

