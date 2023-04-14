rm(list = ls());
mu=1.0;theta=2.5;eps=0.1
n=c(50,100,200,500,700,1000)
est_prob_T1=est_prob_T2=est_prob_T3=est_prob_T4=0
for (i in 1:length(n)){
  y=matrix(runif(n[i]*n[i],0,1),n[i],n[i])
 x=ifelse(y<=0.5,mu+log(2*y)*theta,mu-log(2-2*y)*theta)
 sam_median=apply(x,1,median);
  T_1=apply(abs(x-sam_median),1,mean)
  T_2=sqrt(apply(x,1,var)/2 )
  est_prob_T1[i]=mean(abs(T_1-theta)<eps)# for theta baed on mle
  est_prob_T2[i]=mean(abs(T_2-theta)<eps)# for theta baed on mom
  T_3=apply(x,1,mean )
  T_4=apply(x,1,median)
  est_prob_T3[i]=mean(abs(T_3-mu)<eps)# for mu baed on mom
  est_prob_T4[i]=mean(abs(T_4-mu)<eps)# for mu baed on mle
}
cbind(n,est_prob_T1,est_prob_T2,est_prob_T3,est_prob_T4)
par(mfrow=c(2,2))#this graph is for last value of n=1000
hist(T_1,main = "theta based on mle ")
qqnorm(T_1)
hist(T_2)
qqnorm(T_2)
par(mfrow=c(2,2))
hist(T_3)
qqnorm(T_3)
hist(T_4)
qqnorm(T_4)
