#to conduct simulation study from cauchy distn


n=c(10,20,30,40,60); # sample size (row )
m=1000;# sample size of each sample(col)
mu=2.14;sigma=1
eps=0.5
est_prob_T1=0
est_prob_T2=0
for(i in 1:length(n)){
  data=rcauchy(n[i]*m,mu,sigma)
  x=matrix(data,n[i],m)
  T_1=apply(x,2,mean)
  T_2=apply(x,2,median)  
  A1=abs(T_1-mu)<eps
  A2=abs(T_2-mu)<eps
  #print(mean(A1))
  est_prob_T1[i]=mean(A1)
  est_prob_T2[i]=mean(A2)
  
}
cbind(n,est_prob_T1,est_prob_T2)
