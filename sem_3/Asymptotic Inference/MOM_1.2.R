rm(list=ls(all=T))
alpha=2.5 # shape 
beta=1.5 # scale 
eps=0.25
est_prob_T1=0
est_prob_T2=0
est_alpha=0
est_beta=0
n=c(1200,2200,2500,3000,3500)
for (i in 1:length(n)) {
x=matrix(rgamma(n[i]*n[i],shape=alpha,rate=1/beta),n[i],n[i]) # scale=beta
m1=apply(x,2,mean)
m2=apply(x,2,var)
alpha_hat=m1^2/m2 # T1
beta_hat=m2/m1
#moment estimate
est_alpha[i]=mean(alpha_hat)
est_beta[i]=mean((beta_hat))

est_prob_T1[i]=mean(abs(alpha_hat-alpha)<eps)
est_prob_T2[i]=mean(abs(beta_hat-beta)<eps)

}
cbind(n,est_alpha,est_beta,est_prob_T1,est_prob_T2)
# to check asymptotic dist
par(mfrow=c(2,1))
hist(alpha_hat)  # when n is large
hist(beta_hat)

