mu=0;lambda=1;n=25;
x=rcauchy(n,mu,lambda);
u=c(median(x),rep(0,9));
v=c(median(x),rep(0,9));
I=1/2# info fn
for (i in 1:10) {
  y=x-u[i];
  z=x-v[i];
  d_1=sum(2*z/(1+z^2));#scoring
  d_1_1=sum(2*y/(1+y^2));#newton
  v[i+1]=v[i]+d_1/(n*I);#scoring
  d2_1=2*sum((2*y^2-1-y^2)/(1+y^2)^2)
  u[i+1]=u[i]-d_1/d2_1;#newton
  
}
u
v
