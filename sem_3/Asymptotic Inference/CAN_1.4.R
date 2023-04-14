rm(list = ls());
mu=2.0;sigma=2.5;eps=0.02
n=c(500,1000,1500,2000,3000)
est_prob_T1=est_prob_T2=est_prob_T3=est_prob_T4=0

for (i in 1:length(n)){
  y=matrix(runif(n[i]*n[i],0,1),n[i],n[i])
  x=mu-sigma*log(1-y)
  T_1=apply(x,1,mean)# sample mean
  T_2=apply(x,1,min) #  minimum
  T_3=apply(x,1,var)# variance
  T_4=T_1-T_2 #d
  est_prob_T1[i]=mean(abs(T_1-mu)<eps)# for mu
  est_prob_T2[i]=mean(abs(T_2-mu)<eps)#for mu
  est_prob_T3[i]=mean(abs(T_3-sigma)<eps)# for mu
  est_prob_T4[i]=mean(abs(T_4-sigma)<eps)
}
cbind(n,est_prob_T1,est_prob_T2,est_prob_T3,est_prob_T4)