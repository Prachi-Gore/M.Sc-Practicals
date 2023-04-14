#demonstrate consistency for sample mean,var 

n=c(100,1000,2000,3500,5500,9000); # sample size (row )

mu=25;sigma=2
eps=0.2
est_prob_T1=0
est_prob_T2=0
for(i in 1:length(n)){
  data=rnorm(n[i]*n[i],mu,sigma)
  x=matrix(data,n[i],n[i])
  T_1=apply(x,2,mean)
  T_2=apply(x,2,var)  # n-1
  A1=abs(T_1-mu)<eps
  A2=abs(T_2-sigma^2)<eps
  #print(mean(A1))
  est_prob_T1[i]=mean(A1)
  est_prob_T2[i]=mean(A2)
  
}
cbind(n,est_prob_T1,est_prob_T2)


# by def sample mean consistent for pop mean
# by def sample var consistent not for pop var
