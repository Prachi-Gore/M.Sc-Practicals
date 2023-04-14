n=100;mu=2.5;lambda=1;
x=rcauchy(n,mu,lambda)
u=c(median(x),rep(0,9))# scoring 
v=c(median(x),rep(0,9))#newton
I=0.5
for (i in 1:10) {
  a=x-u[i]
  b=x-v[i]
  del=2*sum(a/(a^2+1))
  u[i+1]=u[i]+del/(n*I)
  del_newton=2*sum(b/(b^2+1))
  del2=2*sum((b^2-1)/(b^2+1)^2)
  v[i+1]=v[i]-del_newton/del2
  
  
}
u
v