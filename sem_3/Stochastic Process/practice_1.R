library(expm);
s=c(1,2,3,4); #state space
a=matrix(c(0.3,0.2,0.3,0.2),byrow=T,ncol = 1) #INITIAL Dist
P=matrix(c(0.2,0.4,0.2,0.2,0.3,0.2,0.2,0.3,0.25,0.25,0.25,0.25,0,0.5,0.1,0.4),byrow = T,nrow=4,ncol = 4) #tpm
n=5
x=rep(0,n)
x[1]=sample(s,1,prob=P[1,])
for (i in 2:5) {
  x[i]=sample(s,1,prob = P[x[i-1],])
  
}
x

p_32_5=cat((P%^%5)[3,2])

#treatment adaptive randomization
drug=c("A","B")
n=20;
subject=1:n;
treat=rep(0,n);
p=0.5
treat[1]=sample(drug,1,prob = c(p,1-p))
for (i in 2:n) {
  p=ifelse(treat[i-1]=="A",p-0.1,p+0.1)
  treat[i]=sample(drug,1,prob = c(p,1-p))
  
}
out=data.frame(subject,treat);out

t=c(0,0.6,1.2,1.8,2.5,3.7,6.2,12,18,24,30,36)
conc=c(0,0.58,0.73,1.66,3.42,4.61,5.06,5.14,4.51,4.21,3.09,2.19)
cmax=max(conc);
a=which.max(conc);
tmax=t[a];
#k1=length(conc)-1# k is starting from 0 as per formula
#auc1=0.5*sum((conc[2:(k1+1)]+conc[1:k1])*(t[2:(k1+1)]-t[1:k1]));auc1

k=length(conc)
auc=0;
for (i in 2:k) {
  auc=auc+(conc[i]+conc[i-1])*(t[i]-t[i-1])
}
auc=auc/2;auc
ke=-2.303*coefficients(lm(log10(conc[a+1:k])~t[a+1:k]))[2]#elimination rate
ke
aucinf=auc+(conc[k]/ke);aucinf
thalf=0.693/ke;thalf
pk=data.frame("c_max"=cmax,"tmax"=tmax,"auc"=auc,"aucinf"=aucinf,"thalf"=thalf);pk
print(pk)
k=4;k
