# suggest consistent estimator for exp(-lambda) when x follow poisson distn
# demonstrate its consistency

n=c(100,200,300,400,600,800); # sample size (row )

lambda=3;
eps=0.01
est_prob_T1=0

for(i in 1:length(n)){
  data=rpois(n[i]*n[i],lambda)
  x=matrix(data,n[i],n[i])
  T_1=apply(x,2,mean) # exp(-xbar) for each row(sample)
  T_1=exp(-T_1);
    
  A1=abs(T_1-exp(-lambda))<eps
  
  #print(mean(A1))
  est_prob_T1[i]=mean(A1)
  
  
}
cbind(n,est_prob_T1)

# exp(-xbar) consistent for exp(-lambda)