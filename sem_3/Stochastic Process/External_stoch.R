rm(list = ls(all=TRUE))
#branching process
#qn4 c)
z=0:3;z
pz=c(0.25,0.3,0,0.45);
x=rep(0,7)
x[1]=3;x
#x[1]=sample(z,1,FALSE,pz) # WHEN SIZE OF OTH GENERATION IS NOT GIVEN
for (i in 1:length(x)) {
  x[i+1]=sum(sample(z,x[i],replace = TRUE,prob=pz))
  
}
x

#M/M/1
rm(list = ls(all=TRUE))

# response adaptive randomization
drug=c('placebo','active');n=25
p1=0.5 #placebo
p2=0.7 #active
s=0.02 # take it by own
treat=rep(0,n);
res=rep(0,n);
treat[1]=rbinom(1,1,p1)
res[1]=rbinom(1,1,ifelse(treat[1]==0,p1,p2))
for (i in 2:n) {
  p1=ifelse(treat[i-1]==res[i-1],p1+s,p1-s)
  
  
  treat[i]=rbinom(1,1,p1)
  res[i]=rbinom(1,1,ifelse(treat[i]==0,p1,p2))
  
}
d=data.frame("subject"=1:n,drug[treat+1],res)
d

#pk parameter 
t=c(0,0.6,1.2,1.8,2.5,3.7,6.2,12,18,24,30,36)
c=c(0,0.58,0.73,1.66,3.42,4.61,5.06,5.14,4.51,4.21,3.09,2.19)
cmax=max(c);
a=which.max(c);a
tmax=t[a];
k=length(c);
AUC_k=sum((c[2:k]+c[1:k-1])*(t[2:k]-t[1:k-1]))*0.5;
slope=coefficients(lm(log10(c[a+1:k])~t[a+1:k]))[2];
eli_rate=-2.303*slope;
AUC_inf=AUC_k+(c[k]/eli_rate)
thalf=0.693/eli_rate
ans=cbind(cmax,tmax,AUC_k,AUC_inf,eli_rate,thalf)
ans
plot(t,c)

#test for carry over effect
n1=n2=6;
y11=c(290,187,168,294,250,293);
y12=c(210,116,77,140,161,240);
y21=c(201,200,151,97,228,154);
y22=c(212,277,193,253,201,232);
U1=y11+y12
U2=y21+y22
chat=mean(U2)-mean(U1)
var_u=(var(U1)*(n1-1)+var(U2)*(n2-1))/(n1+n2-2)
var_chat=var_u*((1/n1)+(1/n2))
tcal=chat/sqrt(var_chat)
pcal=2*(1-pt(abs(tcal),n1+n2-2))
alpha=0.05
talpha=pt(alpha,lower.tail = F,df=n1+n2-2)
LL=chat-talpha*sqrt(var_chat)
UL=chat+talpha*sqrt(var_chat)
cbind(LL,UL)
