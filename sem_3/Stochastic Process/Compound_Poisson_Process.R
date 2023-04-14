lambda=2
t_last=5
x=rexp(20,rate = lambda)
a=cumsum(x)
a=a[a<t_last]
n=length(a)
xo=100000
z=xo+cumsum(runif(n,-10000,10000))
data.frame("start"=c(0,a),"x"=rep("<=t<",n+1),"by"=c(a,t_last),"Nt"=0:n,"st"=c(xo,z))