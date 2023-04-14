lambda=2
t_last=5
x=rexp(20,rate = lambda)
a=cumsum(x)
a=a[a<t_last]
n=length(a)
data.frame("start"=c(0,a),"x"=rep("<=t<",n+1),"by"=c(a,t_last),"Nt"=0:n)

rm(list=ls(all=TRUE))
lambda=4;t=9.5
inter=rexp(50,rate = lambda);
arrival=cumsum(inter);
arrival=arrival[arrival<t];arrival
n=length(arrival);n
t1=c(0,arrival);
t2=c(arrival,t);
zt=c(10000,rnorm(n,1000,20));zt
zt=cumsum(zt);zt
Nt=0:n
d=data.frame("start"=t1,"t"=rep(" <=t< ",n+1),"by"=t2,"Nt"=Nt,"amount"=zt)
d
plot(t1,Nt) 
