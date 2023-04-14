mu=4;lambda=1;n=25;
x=rcauchy(n,mu,lambda);
u=c(median(x),rep(0,14));
v=c(median(x),rep(0,14));
I=1/2# info fn
for (i in 1:15) {
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
#obtain ACI
alpha=0.05;
u_mle=u[16];#newton
v_mle=v[16]
z_alpha=qcauchy(alpha/2,mu,lambda,lower.tail =FALSE)
ll_u=u_mle-z_alpha*sqrt(2/n)
ul_u=u_mle+z_alpha*sqrt(2/n)
ll_v=v_mle-z_alpha*sqrt(2/n)
ul_v=v_mle+z_alpha*sqrt(2/n)
cat("95% CI based on newton :",ll_u,"<theta<",ul_u)
cat("95% CI based on fisher :",ll_v,"<theta<",ul_v)