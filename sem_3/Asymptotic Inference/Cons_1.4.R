# empirical dist is consistent for dist fn
mean=5;
rate=1/mean;
cdf=pexp(2,rate)  # population quantity
print(cdf)
eps=0.04
n=c(200,800,1200,1700,2200,2400);

est_prob_T1=0
for (i in 1:length(n)) {
  data=rexp(n[i]*n[i],rate);
  x=matrix(data,n[i],n[i]);
  y=x<=2; #matrix
  T1=apply(y,2,mean) # Fn(x) (estimator) empirical dist for each row /sample
 # print(T_1)
  A=abs(T1-cdf)<eps;
# print(A)
  est_prob_T1[i]=mean(A);
  
}
cbind(n,est_prob_T1);

# hence empirical dist fn is consistent for pop cdf
