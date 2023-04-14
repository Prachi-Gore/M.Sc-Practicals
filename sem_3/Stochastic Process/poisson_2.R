#N(6)=5
n=5
stop_time=5
a=sort(runif(n,0,stop_time))
data.frame("start"=c(0,a),"x"=rep("<=t<",n+1),"by"=c(a,stop_time),"Nt"=0:n)